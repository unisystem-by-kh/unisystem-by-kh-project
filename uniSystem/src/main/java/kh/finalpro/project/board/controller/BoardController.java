package kh.finalpro.project.board.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.BoardFile;
import kh.finalpro.project.board.model.dto.Pagination;
import kh.finalpro.project.board.model.service.BoardService;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.main.model.service.EmailService;

@SessionAttributes({"loginMember"})
@RequestMapping("/board")
@Controller
public class BoardController { 

	@Autowired
	private BoardService service;
	
	@Autowired
	private EmailService emailService;


	// ---------------------------------------------------------------------------
	// ---------------------------------- 게시판 ----------------------------------
	// ---------------------------------------------------------------------------

	// -------------------------------페이지 이동--------------------------------------

	// 자유게시판 삽입(작성) 페이지
	@GetMapping("/{categoryNo:3}/insert")
	public String selectFreeBoardInsert(@PathVariable("categoryNo") int categoryNo) {
		return "board/freeBoardInsert";
	}

	// 자료실 등록 연결
	@GetMapping("/{categoryNo:5}/write")
	public String writeBoardData(@PathVariable("categoryNo") int categoryNo) {
		return "board/boardDataWrite";
	}
	
	// 1:1문의 작성페이지
	@GetMapping("/{categoryNo:4}/write")
	public String inquiryBoardInsert(@PathVariable("categoryNo") int categoryNo) {
		return "board/inquiryBoardWrite";
	}

	// 학과공지 작성페이지
	@GetMapping("/{categoryNo:2}/write")
	public String departmentBoardWrite(@PathVariable("categoryNo") int categoryNo) {
		return "board/departmentBoardWrite";
	}
	
	//공지사항 작성페이지
	@GetMapping("/{categoryNo:1}/write")
	public String noticeboardInsert(@PathVariable("categoryNo") int categoryNo) {
		
		return "/board/noticeBoardWrite";
	}
	
	
			
	
	// -------------------------------------------------------------------------------

	// -------------------------------목록 조회--------------------------------------


	/* 
		1 : noticeBoardList 
		2 : departmentBoardList 
		3 : freeBoardList
		4 : inquiryBoardList
		5 : boardData
	 */


	// 게시판 목록(공지사항, 자유게시판, 1:1문의, 학과공지, 자료실)
	@GetMapping("/{categoryNo:[1-5]{1}}")
	public String selelctBoardList(
			@PathVariable("categoryNo") int categoryNo
			, @RequestParam(value="cp", required=false, defaultValue = "1") int cp
			, Model model
			, @RequestParam Map<String, Object> paramMap) {

		Map<String, Object> map = null;
		String path = null;

		switch (categoryNo) {
		case 1: path="noticeBoardList"; break; // 공지사항
		case 2: path="departmentBoardList"; break; // 학과공지
		case 3: path="freeBoardList"; break; // 자유게시판
		case 4: path="inquiryBoardList"; break; // 1:1 문의
		case 5: path="boardData"; break; // 자료실
		}

		if(paramMap.get("query") == null) { // 검색어가 없을 때 (검색X)	
			// 게시글 목록 조회 서비스 호출
			map = service.selelctBoardList(categoryNo,cp); // 전체


			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map", map);

		} else { // 검색어가 있을 때 (검색 O)
			paramMap.put("categoryNo", categoryNo);
			map = service.selelctBoardList(paramMap, cp);
		}
		
		model.addAttribute("map" , map);
		return "board/" + path; 
	}

	// -------------------------------------------------------------------------------

	// -------------------------------상세 조회--------------------------------------
	
	
	

	// 자유게시판, 자료실 상세
	@GetMapping("/{categoryNo:[3,5]{1}}/{boardNo}")
	public String selectFreeBoardDetail(
			@PathVariable("categoryNo") int categoryNo,
			@PathVariable("boardNo") int boardNo,
			Model model,
			RedirectAttributes ra,
			@SessionAttribute(value="loginMember", required = false) Member loginMember,
			HttpServletRequest req,
			HttpServletResponse resp
			) throws ParseException {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);

		Board board = service.selectFreeBoard(map);
		String path = null;
		if(board != null) {
			if(loginMember != null) { // 로그인 상태인 경우
				map.put("memberNo", loginMember.getMemberNo());
			}
			// 쿠키를 이용한 조회수 증가 처리
			// 1) 비회원 또는 로그인한 회원의 글이 아닌 경우
			if(loginMember == null || loginMember.getMemberNo() != board.getMemberNo()) {
				// 2) 쿠키 얻어오기
				Cookie c = null;

				Cookie[] cookies = req.getCookies();
				if(cookies != null) {
					for(Cookie cookie : cookies) {
						if(cookie.getName().equals("readBoardNo")) {
							c = cookie;
							break;
						}
					}
				}
				// 3) 기존 쿠키가 없거나(c == null)
				int result = 0;
				if(c == null) {
					// 쿠키가 존재 X -> 하나 새로 생성
					c = new Cookie("readBoardNo" , "|" + boardNo + "|");
					// 조회수 증가 서비스 호출
					result = service.updateReadCount(boardNo);
				}else {
					// String.indexOf("문자열")
					// : 찾는 문자열이 String 몇번 인덱스에 존재하는지 반환
					//   단, 없으면 -1 반환
					if(c.getValue().indexOf("|" + boardNo + "|") == -1) {
						// 기존 값에 게시글 번호 추가해서 다시 세팅
						c.setValue(c.getValue() + "|" + boardNo + "|");
						// 조회수 증가 서비스 호출
						result = service.updateReadCount(boardNo);
					}
				}
				// 4) 조회수 증가 성공 시
				// 쿠키가 적용되는 경로, 수명(당일 23시 59분 59초) 지정
				if(result > 0) {
					// 조회된 board 조회 수와 DB 조회 수 동기화
					board.setBoardCount(board.getBoardCount() + 1);
					// 적용 경로 설정
					c.setPath("/"); // "/" 이하 경로 요청 시 쿠키 서버로 전달
					// 수명 지정
					Calendar cal = Calendar.getInstance();
					cal.add(cal.DATE, 1);
					// 날짜 표기법 변경 객체 (DB의 TO_CHAR()와 비슷)
					SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
					// Java.util.Date
					Date a = new Date(); // 현재 시간
					Date temp = new Date(cal.getTimeInMillis()); // 내일 (24시간 후)
					Date b = sdf.parse(sdf.format(temp)); // 내일 0시 0분 0초

					// -> 내일 0시 0분 0초 까지 남은 시간을 초단위로 반환
					long diff = (b.getTime() - a.getTime()) / 1000;
					c.setMaxAge((int)diff); // 수명 설정
					resp.addCookie(c); 
				}
			}
			// ---------------------------------------------------------------------
			if(categoryNo == 3) {
				path = "board/freeBoardDetail"; // forward할 jsp 경로 // 자유게시판
			}else {
				path = "board/boardDataDetail"; // forward할 jsp 경로 // 자료실
			}
			model.addAttribute("board" , board);
		}else { // 조회 결과가 없을 경우
			path = "redirect:/board/" + categoryNo;
			// 게시판 첫 페이지로 리다이렉트
			ra.addFlashAttribute("message" , "해당 게시글이 존재하지 않습니다."); // message는 푸터에 담겨있음
		}
		return path;
	}



	//공지사항 상세페이지
	@GetMapping("/{categoryNo:1}/{boardNo}")
	public String noticeDetail( @PathVariable("categoryNo") int categoryNo
			, @PathVariable("boardNo") int boardNo
			, Model model // 데이터 전달용 객체
			, RedirectAttributes ra // 리다이렉트 시 데이터 전달용 객체
			, @SessionAttribute(value="loginMember", required=false) Member loginMember

			) throws ParseException  {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);
		
		// 게시글 상세 조회 서비스 호출
		
		Board board = service.noticeDetailBoard(map);
		
		
		String path = null;

		if (board != null) { // 조회 결과가 있을 경우

			path = "board/noticeBoardDetail"; // forward할 jsp 경로

			model.addAttribute("board", board);

		} else { // 조회 결과가 없을 경우
			path = "redirect:/board/" + categoryNo;
			// 게시판 첫 페이지로 리다이렉트

			ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다.");
		}
		return path;
	}

	// -------------------------------------------------------------------------------

	// ----------------------------------게시글 작성--------------------------------------

	// 자유게시판 삽입(작성)	
	@PostMapping("/{categoryNo:3}/insert")
	public String freeBoardWrite(
			@PathVariable("categoryNo") int categoryNo
			, Board board // 커맨드 객체 (필드에 파라미터 담겨있음)
			, @RequestParam(value="file", required = false) List<MultipartFile> file
			, @SessionAttribute(value="loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session)throws IllegalStateException, IOException {


		// 1.로그인한 회원 번호를 얻어와 board에 세팅
		board.setMemberNo(loginMember.getMemberNo());

		// 2. boardCode도 board에 세팅
		board.setCategoryNo(categoryNo);
		// 3. 업로드된 이미지 서버에 실제로 저장되는 경로 
		// + 웹에서 요청 시 이미지를 볼 수 있는 경로 (웹 접근 경로)
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);

		// 게시글 삽입 서비스 호출 후 삽입된 게시글 번호 반환 받기 
		int boardNo = service.inquiryBoardWrite(board, file, webPath, filePath);
		// 게시글 삽입 성공 시
		// -> 방금 삽입한 게시글의 상세 조회 페이지 리다이렉트
		// -> /board/{boardCode}/{boardNo} @PathVariable
		String message = null; 
		String path = "redirect:";
		if(boardNo > 0) { // 성공 시 
			message = "게시글이 등록되었습니다.";
			path += "/board/" + categoryNo + "/" + boardNo;
		}else {
			message= "게시글 등록 실패 ㅠㅠ";
			path += "insert";
		}
		ra.addFlashAttribute("message",message);
		return path;
	}



	// 1:1문의, 자료실 작성페이지
	@PostMapping("/{categoryNo:[4,5]{1}}/write")
	public String inquiryBoardWrite(
			@PathVariable("categoryNo") int categoryNo
			, Board board // 커맨드 객체 (필드에 파라미터 담겨있음)
			, @RequestParam(value="file", required = false) List<MultipartFile> file
			, @SessionAttribute(value="loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session)throws IllegalStateException, IOException {

		// 1.로그인한 회원 번호를 얻어와 board에 세팅
		board.setMemberNo(loginMember.getMemberNo());

		// 2. boardCode도 board에 세팅
		board.setCategoryNo(categoryNo);
		// 3. 업로드된 이미지 서버에 실제로 저장되는 경로 
		// + 웹에서 요청 시 이미지를 볼 수 있는 경로 (웹 접근 경로)
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);


		// 게시글 삽입 서비스 호출 후 삽입된 게시글 번호 반환 받기 
		int boardNo = service.inquiryBoardWrite(board, file, webPath, filePath);
		// 게시글 삽입 성공 시
		// -> 방금 삽입한 게시글의 상세 조회 페이지 리다이렉트
		// -> /board/{boardCode}/{boardNo} @PathVariable
		String message = null; 
		String path = "redirect:";
		if(boardNo > 0) { // 성공 시 
			message = "게시글이 등록되었습니다.";
			path += "/board/" + categoryNo + "/" + boardNo;
		}else {
			message= "게시글 등록 실패 ㅠㅠ";
			path += "write";
		}
		ra.addFlashAttribute("message",message);
		return path;
	}




	//공지사항 작성페이지*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
	
	@PostMapping("/{categoryNo:1}/write")
	public String noticeboardWrite(
			@PathVariable("categoryNo") int categoryNo
			, Board board // 커맨드 객체 (필드에 파라미터 담겨있음)
			, @RequestParam(value="file", required = false) List<MultipartFile> file
			, @SessionAttribute(value="loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session)throws IllegalStateException, IOException {

		// 1.로그인한 회원 번호를 얻어와 board에 세팅
		board.setMemberNo(loginMember.getMemberNo());

		// 2. boardCode도 board에 세팅
		board.setCategoryNo(categoryNo);
		// 3. 업로드된 이미지 서버에 실제로 저장되는 경로 
		// + 웹에서 요청 시 이미지를 볼 수 있는 경로 (웹 접근 경로)
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);

		// 게시글 삽입 서비스 호출 후 삽입된 게시글 번호 반환 받기 
		int boardNo = service.noticeboardWrite(board, file, webPath, filePath);
		// 게시글 삽입 성공 시
		// -> 방금 삽입한 게시글의 상세 조회 페이지 리다이렉트
		// -> /board/{boardCode}/{boardNo} @PathVariable
		String message = null; 
		String path = "redirect:";
		if(boardNo > 0) { // 성공 시 
			message = "게시글이 등록되었습니다.";
			path += "/board/" + categoryNo + "/" + boardNo;
		}else {
			message= "게시글 등록 실패 ㅠㅠ";
			path += "insert";
		}
		ra.addFlashAttribute("message",message);
		return path;
	}


	// ----------------------------------------------------------------------------------


	// ----------------------------------게시글 수정--------------------------------------

	// 자유게시판 수정 기능
	@PostMapping("/{categoryNo:3}/{boardNo}/update")
	public String freeBoardUpdate(
			Board board // 커맨드 객체(name==필드 경우 필드에 파라미터 세팅
			,@RequestParam(value="cp", required = false, defaultValue = "1") int cp // 쿼리스트링 유지
			,@RequestParam(value="deleteList", required = false) String deleteList // 삭제할 이미지 순서
			,@RequestParam(value="file", required = false) List<MultipartFile> file // 업로드된 파일 리스트
			,@PathVariable("categoryNo") int categoryNo
			,@PathVariable("boardNo") int boardNo
			,HttpSession session // 서버 파일 저장 경로 얻어올 경로
			,RedirectAttributes ra // 리다이렉트 시 값 전달용
			) throws IllegalStateException, IOException {


		// 1) boardCode, boardNo를 커맨드 객체(board)에 세팅 
		board.setCategoryNo(categoryNo);
		board.setBoardNo(boardNo);
		// board(boardCode, boardNo , boardTitle, boardContent)

		// 2) 이미지 웹 접근 경로, 서버 저장 경로 
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);

		// 3) 게시글 수정 서비스 호출 
		int rowCount = service.freeBoardUpdate(board, file, webPath, filePath, deleteList);

		// 4) 결과에 따라서 message, path 설정
		String message = null; 
		String path = "redirect:";

		if(rowCount > 0) {
			message = "게시글이 수정되었습니다.";
			path += "/board/" + categoryNo + "/" + boardNo + "?cp=" + cp; // 상세조회 페이지
		}else {
			message = "게시글이 수정 실패.";
			path += "update";
		}

		ra.addFlashAttribute("message",message);
		return path;
	}

	// 1:1문의 게시글 수정
	@PostMapping("/{categoryNo:4}/{boardNo}/update")
	public String inquiryBoardUpdate(
			Board board // 커맨드 객체(name==필드 경우 필드에 파라미터 세팅
			,@RequestParam(value="cp", required = false, defaultValue = "1") int cp // 쿼리스트링 유지
			,@RequestParam(value="deleteList", required = false) String deleteList // 삭제할 이미지 순서
			,@RequestParam(value="file", required = false) List<MultipartFile> file // 업로드된 파일 리스트
			,@PathVariable("categoryNo") int categoryNo
			,@PathVariable("boardNo") int boardNo
			,HttpSession session // 서버 파일 저장 경로 얻어올 경로
			,RedirectAttributes ra // 리다이렉트 시 값 전달용
			) throws IllegalStateException, IOException {


		// 1) boardCode, boardNo를 커맨드 객체(board)에 세팅 
		board.setCategoryNo(categoryNo);
		board.setBoardNo(boardNo);
		// board(boardCode, boardNo , boardTitle, boardContent)

		// 2) 이미지 웹 접근 경로, 서버 저장 경로 
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);

		// 3) 게시글 수정 서비스 호출 
		int rowCount = service.inquiryBoardUpdate(board, file, webPath, filePath, deleteList);

		// 4) 결과에 따라서 message, path 설정
		String message = null; 
		String path = "redirect:";

		if(rowCount > 0) {
			message = "게시글이 수정되었습니다.";
			path += "/board/" + categoryNo + "/" + boardNo + "?cp=" + cp; // 상세조회 페이지
		}else {
			message = "게시글이 수정 실패.";
			path += "update";
		}

		ra.addFlashAttribute("message",message);
		return path;
	}


	// 학과공지 게시글 수정
	@PostMapping("/{categoryNo:2}/{boardNo}/update")
	public String departmentBoardUpdate(
			Board board // 커맨드 객체(name==필드 경우 필드에 파라미터 세팅
			,@RequestParam(value="cp", required = false, defaultValue = "1") int cp // 쿼리스트링 유지
			,@SessionAttribute("loginMember") Member loginMember
			,@RequestParam(value="images", required = false) List<MultipartFile> images 
			,@RequestParam(value="file", required = false) List<MultipartFile> file // 업로드된 파일 리스트
			,@PathVariable("categoryNo") int categoryNo
			,@PathVariable("boardNo") int boardNo
			,HttpSession session // 서버 파일 저장 경로 얻어올 경로
			,RedirectAttributes ra // 리다이렉트 시 값 전달용
			) throws IllegalStateException, IOException {


		// 1) boardCode, boardNo를 커맨드 객체(board)에 세팅 
		board.setCategoryNo(categoryNo);
		board.setBoardNo(boardNo);
		// board(boardCode, boardNo , boardTitle, boardContent)
		
		if(board.getShoot() == 1) {
			
			List<Member> memberList = service.selectMemberList(loginMember);
			
			emailService.emailShoot(board,memberList);
			
		}

		// 2) 이미지 웹 접근 경로, 서버 저장 경로 
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);

		// 3) 게시글 수정 서비스 호출 
		int rowCount = service.departmentBoardUpdate(board, file, webPath, filePath, images);

		// 4) 결과에 따라서 message, path 설정
		String message = null; 
		String path = "redirect:";

		if(rowCount > 0) {
			message = "게시글이 수정되었습니다.";
			path += "/board/" + categoryNo + "/" + boardNo + "?cp=" + cp; // 상세조회 페이지
		}else {
			message = "게시글이 수정 실패.";
			path += "update";
		}

		ra.addFlashAttribute("message",message);
		return path;
	}

	// 공지사항 수정*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
		@PostMapping("/{categoryNo:1}/{boardNo}/update")
		public String noticeBoardUpdate(
				Board board // 커맨드 객체(name==필드 경우 필드에 파라미터 세팅
				,@RequestParam(value="cp", required = false, defaultValue = "1") int cp // 쿼리스트링 유지
				,@RequestParam(value="deleteList", required = false) String deleteList // 삭제할 이미지 순서
				,@RequestParam(value="file", required = false) List<MultipartFile> file // 업로드된 파일 리스트
				,@PathVariable("categoryNo") int categoryNo
				,@PathVariable("boardNo") int boardNo
				,HttpSession session // 서버 파일 저장 경로 얻어올 경로
				,RedirectAttributes ra // 리다이렉트 시 값 전달용
				) throws IllegalStateException, IOException {


			// 1) boardCode, boardNo를 커맨드 객체(board)에 세팅 
			board.setCategoryNo(categoryNo);
			board.setBoardNo(boardNo);
			// board(boardCode, boardNo , boardTitle, boardContent)

			// 2) 이미지 웹 접근 경로, 서버 저장 경로 
			String webPath = "/resources/images/board/";
			String filePath = session.getServletContext().getRealPath(webPath);

			// 3) 게시글 수정 서비스 호출 
			int rowCount = service.noticeBoardUpdate(board, file, webPath, filePath, deleteList);

			// 4) 결과에 따라서 message, path 설정
			String message = null; 
			String path = "redirect:";

			if(rowCount > 0) {
				message = "게시글이 수정되었습니다.";
				path += "/board/" + categoryNo + "/" + boardNo + "?cp=" + cp; // 상세조회 페이지
			}else {
				message = "게시글이 수정 실패.";
				path += "update";
			}

			ra.addFlashAttribute("message",message);
			return path;
		}

	// ----------------------------------------------------------------------------------


	// ----------------------------------게시글 수정 화면 이동--------------------------------------

	// 자유게시판 수정 화면 이동
	@GetMapping("/{categoryNo:[3,5]{1}}/{boardNo}/update")
	public String selectFreeBoardUpdate(
			@PathVariable("categoryNo") int categoryNo,
			@PathVariable("boardNo") int boardNo,
			Model model
			) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);

		Board board = service.selectFreeBoard(map);

		model.addAttribute("board", board);

		String path = "board";
		if(categoryNo == 3) {
			path += "/freeBoardUpdate";
		}else {
			path += "/boardDataUpdate";
		}
		
		return path;
	}

	// 1:1문의 수정 화면 전환
	@GetMapping("/{categoryNo:4}/{boardNo}/update")
	public String inquiryBoardUpdate(
			@PathVariable("categoryNo") int categoryNo
			,@PathVariable("boardNo") int boardNo
			,Model model // 데이터 전달용 객체 (기본 scope : requset)
			) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);
		Board board = service.selectInquiryBoard(map);
		model.addAttribute("board", board);

		return "board/inquiryBoardUpdate";
	}

	// 학과공지 수정 화면 전환
	@GetMapping("/{categoryNo:2}/{boardNo}/update")
	public String departmentBoardUpdate(
			@PathVariable("categoryNo") int categoryNo
			,@PathVariable("boardNo") int boardNo
			,Model model // 데이터 전달용 객체 (기본 scope : requset)
			) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);
		Board board = service.selectInquiryBoard(map);
		model.addAttribute("board", board);

		return "board/departmentBoardUpdate";
	}
	
	//공지사항 수정 화면 전환********************************
	@GetMapping("/{categoryNo:1}/{boardNo}/update")
	public String noticeBoardUpdate(
			@PathVariable("categoryNo") int categoryNo
			,@PathVariable("boardNo") int boardNo
			,Model model // 데이터 전달용 객체 (기본 scope : requset)
			) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);
		Board board = service.noticeDetailBoard(map);
		model.addAttribute("board", board);

		return "board/noticeBoardUpdate";
	}

	// ----------------------------------------------------------------------------------


	// ----------------------------------게시글 상세 조회--------------------------------------



	/** 자료실 상세 페이지
	 * @param boardNo
	 * @param model
	 * @return
	 */
//	@GetMapping("/{categoryNo:5}/{boardNo}")
//	public String boardDataDetail(
//			@PathVariable("boardNo") int boardNo
//			, Model model
//			) {
//
//
//		Board board = service.boardDataDetail(boardNo);
//
//		List<BoardFile> boardFile = service.selectBoardFile(boardNo);
//
//		Map<String, Object> map = new HashMap<String, Object>();
//
//
//		if(boardFile.size() != 0) {
//			System.out.println("배열 길이가 0이 아닐 때"+boardFile);
//
//			map.put("boardFile", boardFile);
//		}
//
//		map.put("board", board);
//
//		model.addAttribute("map", map);
//
//		return "board/boardDataDetail";
//	}


	// 1:1문의 상세페이지
	/*
	 * @GetMapping("/{categoryNo:4}/{boardNo}") public String boardDetail(
	 * 
	 * @PathVariable("categoryNo") int categoryNo,
	 * 
	 * @PathVariable("boardNo") int boardNo, Model model,
	 * 
	 * @SessionAttribute(value="loginMember", required=false) Member loginMember )
	 * throws ParseException {
	 * 
	 * }
	 */

	Map<String, Object> map = new HashMap<String, Object>();

	/*
	 * // 자료실 등록 연결
	 * 
	 * @GetMapping("/{categoryNo:5}/write") public String
	 * writeBoardData(@PathVariable("categoryNo") int categoryNo) { return
	 * "board/boardDataWrite"; }
	 * 
	 * 
	 * //공지사항 목록
	 * 
	 * @GetMapping("/{categoryNo:1}") public String selelctNoticeBoardList(
	 * 
	 * @PathVariable("categoryNo") int categoryNo , @RequestParam(value="cp",
	 * required=false, defaultValue = "1") int cp , Model model , @RequestParam
	 * Map<String, Object> paramMap) {
	 * 
	 * if(paramMap.get("key") == null) { // 검색어가 없을 때 (검색X)
	 * 
	 * // 게시글 목록 조회 서비스 호출 Map<String, Object> map =
	 * service.selelctNoticeBoardList(categoryNo, cp);
	 * 
	 * 
	 * // 조회 결과를 request scope에 세팅 후 forward model.addAttribute("map", map);
	 * 
	 * } else { // 검색어가 있을 때 (검색 O) paramMap.put("categoryNo", categoryNo);
	 * Map<String, Object> map = service.selelctNoticeBoardList(paramMap, cp);
	 * 
	 * 
	 * 
	 * model.addAttribute("map", map); }
	 * 
	 * 
	 * map.put("categoryNo", categoryNo); map.put("boardNo", boardNo); }
	 */







	//공지사항 상세페이지
	/*
	 * @GetMapping("/{categoryNo:1}/{boardNo}") public String
	 * noticeDetail( @PathVariable("categoryNo") int categoryNo
	 * , @PathVariable("boardNo") int boardNo , Model model // 데이터 전달용 객체 ,
	 * RedirectAttributes ra // 리다이렉트 시 데이터 전달용 객체
	 * , @SessionAttribute(value="loginMember", required=false) Member loginMember
	 * 
	 * ) throws ParseException {
	 * 
	 * Map<String, Object> map = new HashMap<String, Object>();
	 * map.put("categoryNo", categoryNo); map.put("boardNo", boardNo);
	 * 
	 * // 게시글 상세 조회 서비스 호출 Board board = service.noticeDetailBoard(map);
	 * 
	 * String path = null;
	 * 
	 * if (board != null) { // 조회 결과가 있을 경우
	 * 
	 * 
	 * path = "board/noticeBoardDetail"; // forward할 jsp 경로
	 * 
	 * model.addAttribute("board", board);
	 * 
	 * } else { // 조회 결과가 없을 경우 path = "redirect:/board/" + categoryNo; // 게시판 첫
	 * 페이지로 리다이렉트
	 * 
	 * ra.addFlashAttribute("message", "해당 게시글이 존재하지 않습니다."); } return path; }
	 */
	@ResponseBody
	@PostMapping("/check")
	public int boardCheck(
			@RequestBody Map<String, Object> map
			){
		return service.boardCheck(map); 
	}


	// 1:1문의 상세페이지
	@GetMapping("/{categoryNo:4}/{boardNo}")
	public String boardDetail(
			@PathVariable("categoryNo") int categoryNo,
			@PathVariable("boardNo") int boardNo,
			Model model, 
			@SessionAttribute(value="loginMember", required=false) Member loginMember				
			) throws ParseException {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);

		// 게시글 상세 조회 서비스 호출
		Board board = service.selectInquiryBoard(map);
		String path = null;



		path = "board/inquiryBoardDetail"; // forward할 jsp 경로
		model.addAttribute("board", board);
		return path;
	}	

	// 학과공지 상세
	@GetMapping("/{categoryNo:2}/{boardNo}")
	public String departmentBoardDetail(
			@PathVariable("categoryNo") int categoryNo,
			@PathVariable("boardNo") int boardNo,
			Model model,
			RedirectAttributes ra,
			@SessionAttribute(value="loginMember", required = false) Member loginMember,
			HttpServletRequest req,
			HttpServletResponse resp
			) throws ParseException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);

		Board board = service.selectInquiryBoard(map);
		String path = null;
		if(board != null) {

			if(loginMember != null) { // 로그인 상태인 경우
				map.put("memberNo", loginMember.getMemberNo());
			}


			// 쿠키를 이용한 조회수 증가 처리

			// 1) 비회원 또는 로그인한 회원의 글이 아닌 경우
			if(loginMember == null || loginMember.getMemberNo() != board.getMemberNo()) {

				// 2) 쿠키 얻어오기
				Cookie c = null;

				Cookie[] cookies = req.getCookies();
				if(cookies != null) {

					for(Cookie cookie : cookies) {
						if(cookie.getName().equals("readBoardNo")) {
							c = cookie;
							break;
						}
					}

				}

				// 3) 기존 쿠키가 없거나(c == null)
				int result = 0;

				if(c == null) {

					// 쿠키가 존재 X -> 하나 새로 생성
					c = new Cookie("readBoardNo" , "|" + boardNo + "|");

					// 조회수 증가 서비스 호출
					result = service.updateReadCount(boardNo);

				}else {


					// String.indexOf("문자열")
					// : 찾는 문자열이 String 몇번 인덱스에 존재하는지 반환
					//   단, 없으면 -1 반환
					if(c.getValue().indexOf("|" + boardNo + "|") == -1) {

						// 기존 값에 게시글 번호 추가해서 다시 세팅
						c.setValue(c.getValue() + "|" + boardNo + "|");

						// 조회수 증가 서비스 호출
						result = service.updateReadCount(boardNo);
					}

				}

				// 4) 조회수 증가 성공 시
				// 쿠키가 적용되는 경로, 수명(당일 23시 59분 59초) 지정

				if(result > 0) {

					// 조회된 board 조회 수와 DB 조회 수 동기화
					board.setBoardCount(board.getBoardCount() + 1);

					// 적용 경로 설정
					c.setPath("/"); // "/" 이하 경로 요청 시 쿠키 서버로 전달

					// 수명 지정
					Calendar cal = Calendar.getInstance();
					cal.add(cal.DATE, 1);

					// 날짜 표기법 변경 객체 (DB의 TO_CHAR()와 비슷)
					SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");

					// Java.util.Date
					Date a = new Date(); // 현재 시간

					Date temp = new Date(cal.getTimeInMillis()); // 내일 (24시간 후)

					Date b = sdf.parse(sdf.format(temp)); // 내일 0시 0분 0초

					// -> 내일 0시 0분 0초 까지 남은 시간을 초단위로 반환
					long diff = (b.getTime() - a.getTime()) / 1000;

					c.setMaxAge((int)diff); // 수명 설정

					resp.addCookie(c); 

				}

			}

			// ---------------------------------------------------------------------

			path = "board/departmentBoardDetail"; // forward할 jsp 경로
			model.addAttribute("board" , board);

		}else { // 조회 결과가 없을 경우
			path = "redirect:/board/" + categoryNo;
			// 게시판 첫 페이지로 리다이렉트
			ra.addFlashAttribute("message" , "해당 게시글이 존재하지 않습니다."); // message는 푸터에 담겨있음
		}

		return path;
	}






	// ---------------------------------------------------------------------------------------




	// 자유게시판 게시글 삭제
	@GetMapping("/{categoryNo:{3}}/{boardNo}/delete")
	public String freeBoardDelete(@PathVariable("categoryNo") int categoryNo
			,@PathVariable("boardNo") int boardNo
			,HttpSession session
			,RedirectAttributes ra
			) {

		int result = service.freeBoardDelete(boardNo);
		String path = "redirect:";
		String message = null;
		

		if(result > 0) {
			path += "/board/" + categoryNo;
			message = "게시글이 삭제되었습니다.";
		}else {
			path += "/board/" + categoryNo + "/" + boardNo;
			message = "게시글 삭제 실패";
		}

		ra.addFlashAttribute("message", message);

		return path;
	}







	//학과공지 작성페이지
	@PostMapping("/{categoryNo:2}/write")
	public String departmentBoardInsert(
			@PathVariable("categoryNo") int categoryNo
			, Board board // 커맨드 객체 (필드에 파라미터 담겨있음)
			, @RequestParam(value="file", required = false) List<MultipartFile> file
			, @RequestParam(value="images", required = false) List<MultipartFile> images
			, @SessionAttribute(value="loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session)throws IllegalStateException, IOException {
		
		
		// 1.로그인한 회원 번호를 얻어와 board에 세팅
		board.setMemberNo(loginMember.getMemberNo());

		// 2. boardCode도 board에 세팅
		board.setCategoryNo(categoryNo);
		
		if(board.getShoot() == 1) {
			
			List<Member> memberList = service.selectMemberList(loginMember);
			
			emailService.emailShoot(board,memberList);
			
		}
		// 3. 업로드된 이미지 서버에 실제로 저장되는 경로 
		// + 웹에서 요청 시 이미지를 볼 수 있는 경로 (웹 접근 경로)
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);


		// 게시글 삽입 서비스 호출 후 삽입된 게시글 번호 반환 받기 
		int boardNo = service.departmentBoardInsert(board, file, images, webPath, filePath);
		// 게시글 삽입 성공 시
		// -> 방금 삽입한 게시글의 상세 조회 페이지 리다이렉트
		// -> /board/{boardCode}/{boardNo} @PathVariable
		String message = null; 
		String path = "redirect:";
		if(boardNo > 0) { // 성공 시 
			message = "게시글이 등록되었습니다.";
			path += "/board/" + categoryNo + "/" + boardNo;
		}else {
			message= "게시글 등록 실패 ㅠㅠ";
			path += "write";
		}
		ra.addFlashAttribute("message",message);



		return path;
	}



	// 1:1문의 게시글 삭제
	@GetMapping("/{categoryNo:[2,3,4]{1}}/{boardNo}/delete")
	public String boardDelete(@PathVariable("categoryNo") int categoryNo
			,@PathVariable("boardNo") int boardNo
			,HttpSession session
			,RedirectAttributes ra
			) {


		int result = service.inquiryBoardDelete(boardNo);
		String path = "redirect:";
		String message = null;

		if(result > 0) {
			path += "/board/" + categoryNo;
			message = "게시글이 삭제되었습니다.";
		}else {
			path += "/board/" + categoryNo + "/" + boardNo;
			message = "게시글 삭제 실패";
		}

		ra.addFlashAttribute("message", message);

		return path;
	}


	// 공지사항 게시글 삭제*******************
		@GetMapping("/{categoryNo:1}/{boardNo}/delete")
		public String noticeBoardDelete(@PathVariable("categoryNo") int categoryNo
				,@PathVariable("boardNo") int boardNo
				,HttpSession session
				,RedirectAttributes ra
				) {
			int result = service.noticeBoardDelete(boardNo);
			String path = "redirect:";
			String message = null;
			

			if(result > 0) {
				path += "/board/" + categoryNo;
				message = "게시글이 삭제되었습니다.";
			}else {
				path += "/board/" + categoryNo + "/" + boardNo;
				message = "게시글 삭제 실패";
			}

			ra.addFlashAttribute("message", message);

			return path;
		}





















}
