package kh.finalpro.project.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.service.BoardService;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.student.model.dto.Student;

@SessionAttributes({"loginMember"})
@RequestMapping("/board")
@Controller
public class BoardController { 

	@Autowired
	private BoardService service;


	// 오시는길
	@GetMapping("/comeMap")
	public String comeMap() {

		return "board/comeMap";
	}







	// ---------------------------------------------------------------------------
	// ---------------------------------- 게시판 ----------------------------------
	// ---------------------------------------------------------------------------

	// ---------------------------------- 자유게시판 ---------------------------------- 


	// 자유게시판 목록
	@GetMapping("/{categoryNo:3}")
	public String selectFreeBoardList(
										@PathVariable("categoryNo") int categoryNo,
										@RequestParam(value="cp" , required=false, defaultValue="1") int cp,
										Model model,
										@RequestParam Map<String, Object> paramMap
										) {
		
		Map<String, Object> map = null;
		
		if(paramMap.get("key") == null) { // 검색어가 없을 때 (검색 X)
			
			// 게시글 목록조회 서비스 호출
			map = service.selectFreeBoardList(categoryNo, cp);
			
			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map" , map);
			
		}else { // 검색어가 있을 때 (검색 O)
			
			paramMap.put("categoryNo", categoryNo);
			
			map = service.searchFreeBoardList(paramMap, cp);
			
			model.addAttribute("map" , map);
		}
		
		model.addAttribute("map" , map);
		
		System.out.println();
		System.out.println("---------------------------------------------------------------------------");
		System.out.println("Controller-categoryNo : " + categoryNo);
		System.out.println("Controller-cp : " + cp);
		System.out.println("Controller-model : " + model);
		System.out.println("Controller-paramMap : " + paramMap);
		System.out.println("Controller-map : " + map);
		System.out.println("---------------------------------------------------------------------------");
		System.out.println();

		return "board/freeBoardList";
	}


	// 자유게시판 상세
	@GetMapping("/{categoryNo:3}/{boardNo}")
	public String selectFreeBoardDetail(
			@PathVariable("categoryNo") int categoryNo,
			@PathVariable("boardNo") int boardNo,
			Model model,
			RedirectAttributes ra,
			@SessionAttribute(value="loginMember", required = false) Member loginMember,
			HttpServletRequest req,
			HttpServletResponse resp
			) throws ParseException {
		
		System.out.println();
		System.out.println("---------------------------------------------------------------------------");
		System.out.println("Controller:::categoryNo : "+categoryNo);
		System.out.println("Controller:::boardNo : "+boardNo);
		System.out.println("Controller:::loginMember : "+loginMember);
		System.out.println("---------------------------------------------------------------------------");
		System.out.println();
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);
		
		Board board = service.selectFreeBoard(map);
		
		System.out.println("---------------------------------------------------------------------------");
		System.out.println("Controller:::board : "+board);
		System.out.println("---------------------------------------------------------------------------");
		
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
			
			path = "board/freeBoardDetail"; // forward할 jsp 경로
			model.addAttribute("board" , board);
			
		}else { // 조회 결과가 없을 경우
			path = "redirect:/board/" + categoryNo;
			// 게시판 첫 페이지로 리다이렉트
			ra.addFlashAttribute("message" , "해당 게시글이 존재하지 않습니다."); // message는 푸터에 담겨있음
		}
		
		return path;
		
//		return "board/freeBoardDetail";
	}


	// 자유게시판 삽입
	@GetMapping("/freeBoardInsert")
	public String selectFreeBoardInsert() {

		return "board/freeBoardInsert";
	}


	// 자유게시판 수정
	@GetMapping("/freeBoardUpdate")
	public String selectFreeBoardUpdate() {

		return "board/freeBoardUpdate";

	}


	// 자료실 목록 연결
	@GetMapping("/boardData")
	public String boardData() {
		return "board/boardData";

	}

	//공지사항 목록
	@GetMapping("/{categoryNo:1}")
	public String selelctNoticeBoardList(
			@PathVariable("categoryNo") int categoryNo
			, @RequestParam(value="cp", required=false, defaultValue = "1") int cp
			, Model model) {
				
		
		// 게시글 목록 조회 서비스 호출
		Map<String, Object> map = service.selelctNoticeBoardList(categoryNo, cp);
		
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("map", map);
		
		return "board/noticeBoardList";
	}
	
	

	//공지사항 작성페이지
	@GetMapping("/noticeBoardWrite")
	public String noticeWrite() {
		return "board/noticeBoardWrite";
	}

	//공지사항 상세페이지
	@GetMapping("/noticeBoardDetail")
	public String noticeDetail() {
		return "board/noticeBoardDetail";
	}

	// 1:1문의 목록
	@GetMapping("/{categoryNo:4}")
	public String inquiryBoard(@PathVariable("categoryNo") int categoryNo,
			@RequestParam(value="cp" , required=false, defaultValue="1") int cp,
			Model model,
			@RequestParam Map<String, Object> paramMap) {
		
		if(paramMap.get("query") == null) {
			
			// 게시글 목록 조회 서비스 호출
			Map<String, Object> map = service.selectinquiryBoardList(categoryNo,cp);
			
			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map", map);
		}else {
			
			paramMap.put("categoryNo", categoryNo);
			
		    Map<String, Object> map = service.selectinquiryBoardList(paramMap, cp);
		    
		    model.addAttribute("map", map);
			
		}

		return "board/inquiryBoardList";
	}

	
	// 1:1문의 상세페이지
	@GetMapping("/{categoryNo:4}/{boardNo}")
	public String boardDetail(
				@PathVariable("categoryNo") int categoryNo,
				@PathVariable("boardNo") int boardNo,
				Model model, // 데이터 전달용 객체
				RedirectAttributes ra, // 리다이렉트 시 데이터 전달용 객체
				@SessionAttribute(value="loginMember", required=false) Member loginMember,
				// 세션에서 loginMember를 얻어오는데 없으면 null, 있으면 회원정보 저장
				
				// 쿠키를 이용한 조회 수 증가에서 사용
				HttpServletRequest req,
				HttpServletResponse resp
			) throws ParseException {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("categoryNo", categoryNo);
		map.put("boardNo", boardNo);
		
		// 게시글 상세 조회 서비스 호출
		Board board = service.selectInquiryBoard(map);
		String path = null;
		
		
			// ------------------------------------------------------------------------
			
			// 쿠키를 이용한 조회수 증가 처리
			
			// 1) 비회원 또는 로그인한 회원의 글이 아닌 경우
			if(loginMember == null || loginMember.getMemberNo() != board.getMemberNo()) {
				
				// 2) 쿠키 얻어오기
				Cookie c = null;
				
				// 요청에 담겨 있는 모든 쿠키 얻어오기
				Cookie[] cookies = req.getCookies();
				
				if(cookies != null) { // 쿠키가 존재할 경우
					
					// 쿠키 중 "readBoardNo"라는 쿠키를 찾아서 c에 대입
					for(Cookie cookie : cookies) {
						if(cookie.getName().equals("readBoardNo")) {
							c = cookie;
							break;
						}
					}
				}
				
				// 3) 기존 쿠키가 없거나(c == null)
				//		존재는 하나 현재 게시글 번호가
				//		쿠키에 저장되지 않은 경우(오늘 해당 게시글 본적 없음)
				int result = 0;
				if(c == null) {
					
					// 쿠키가 존재 X -> 하나 새로 생성
					c = new Cookie("readBoardNo", "|" + boardNo + "|");
					
					// 조회수 증가 서비스 호출
					result = service.updateReadCount(boardNo);
				}else {
					// 현재 게시글 번호가 쿠키에 있는지 확인
					
					// Cookie.getValue() : 쿠키에 저장된 모든 값을 읽어옴
					//								 -> String으로 반환
					
					// String.indexOf("문자열")
					// : 찾는 문자열이 String 몇번 인덱스에 존재하는지 반환
					//	  단, 없으면 -1 반환
					if(c.getValue().indexOf("|" + boardNo + "|") == -1) {
						// 쿠키에 현재 게시글 번호가 없다면
						
						// 기존 값에 게시글 번호 추가해서 다시 세팅
						c.setValue(c.getValue() + "|" + boardNo + "|");
						
						// 조회수 증가 서비스 호출
						result = service.updateReadCount(boardNo);
					}
				} // 종료
				
				// 4) 조회수 증가 성공 시
				// 쿠키가 적용되는 경로, 수명(당일 23시 59분 59초) 지정
				if(result > 0) {
					// 조회된  board 조회 수와 DB 조회 수 동기화
					board.setReadCount(board.getReadCount() + 1);
					
					// 적용 경로 설정
					c.setPath("/"); // "/" 이하 경로 요청 시 쿠키 서버로 전달
					
					// 수명 지정
					Calendar cal = Calendar.getInstance(); // 싱글톤 패턴
					cal.add(cal.DATE, 1);
					
					// 날짜 표기법 변경 객체 (DB의 TO_CHAR()와 비슷)
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					// java.util.Date
					Date a = new Date(); // 현재 시간
					
					Date temp = new Date(cal.getTimeInMillis()); // 내일 (24시간 후)
					// 2024-02-23 12:11:45
					
					Date b = sdf.parse(sdf.format(temp)); // 내일 0시 0분 0초
					
					// 내일 0시 0분 0초 - 현재 시간
					long diff = (b.getTime() - a.getTime()) / 1000;
					// -> 내일 0시 0분 0초 까지 남은 시간을 초단위로 반환
					
					c.setMaxAge((int)diff); // 수명 설정
					
					resp.addCookie(c); // 응답 객체를 이용해서
												 // 클라이언트에게 전달
					
				}
			}
			
			// ------------------------------------------------------------------------
			path = "board/inquiryBoardDetail"; // forward할 jsp 경로
			model.addAttribute("board", board);
			
		
		return path;
}
	 
	
	// 1:1문의 작성페이지
	@GetMapping("/inquiryBoardWrite")
	public String inquiryBoardWrite() {
		return "board/inquiryBoardWrite";
	}


	// 학과공지 목록
	@GetMapping("/departmentBoardList")
	public String departmentBoardList() {
		return "board/departmentBoardList";
	}

	// 학과공지 상세페이지
	@GetMapping("/departmentBoardDetail")
	public String departmentBoardDetail() {
		return "board/departmentBoardDetail";
	}

	// 학과공지 작성페이지
	@GetMapping("/departmentBoardWrite")
	public String departmentBoardWrite() {
		return "board/departmentBoardWrite";
	}







}
