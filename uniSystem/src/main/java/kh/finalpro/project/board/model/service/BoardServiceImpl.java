package kh.finalpro.project.board.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.finalpro.project.common.util.Util;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.BoardFile;
import kh.finalpro.project.board.model.dto.Pagination;
import kh.finalpro.project.board.model.exception.ImageDeleteException;


@Service
public class BoardServiceImpl implements BoardService{


	@Autowired
	private BoardDAO dao;

	// -------------------------------목록 조회--------------------------------------

	// 게시판 목록 조회(공지사항, 자유게시판, 1:1 문의, 학과공지, 자료실)
	@Override
	public Map<String, Object> selelctBoardList(int categoryNo, int cp) {
		int listCount = dao.getListCount(categoryNo);
		Pagination pagination = new Pagination(cp, listCount);

		// List<Board> boardList = dao.selectNoticeBoardList(pagination, categoryNo); // 공지사항
		// List<Board> boardList = dao.selectFreeBoardList(pagination, categoryNo); // 자유게시판
		// List<Board> boardList = dao.selectinquiryBoardList(pagination, categoryNo); // 1:1, 학과공지
		// List<Board> boardList = dao.selectDataList(pagination, categoryNo); // 자료실
		List<Board> boardList = dao.selectBoardList(pagination, categoryNo); // 전체

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		return map;
	}

	// -------------------------------- 검색 ---------------------------------------

	// 게시판 목록 검색(공지사항, 자유게시판, 1:1문의, 학과공지)
	@Override
	public Map<String, Object> selelctBoardList(Map<String, Object> paramMap, int cp) {
		// 1. 특정 게시판의 삭제되지 않고 검색 조건이 일치하는 게시글 수 조회

		int listCount = 0;

		if(paramMap.get("categoryNo").equals(2) || paramMap.get("categoryNo").equals(4)) {
			listCount = dao.getListCountInquiry(paramMap); // 1:1문의, 학과공지
		}else {
			listCount = dao.getListCount(paramMap);
		}

		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨
		Pagination pagination = new Pagination(cp, listCount);
		// 3. 특정 게시판에서
		// 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// + 단, 검색 조건 일치하는 글만
		// List<Board> boardList = dao.selelctNoticeBoardList(pagination, paramMap); // 공지사항
		// List<Board> boardList = dao.searchFreeBoardList(pagination, paramMap); // 자유게시판
		// List<Board> boardList = dao.selectinquiryBoardList(pagination, paramMap); // 1:1, 학과공지

		List<Board> boardList = dao.selelctBoardList(pagination, paramMap); // 전체
		// 4. pagination, boardList를 Map 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pagination", pagination);
		map.put("boardList", boardList);
		return map;
	}


	// ------------------------------------------------------------------------------


	// -----------------------------게시글 상세 조회------------------------------

	// 자유게시판 상세 조회
	@Override
	public Board selectFreeBoard(Map<String, Object> map) {
		return dao.selectFreeBoard(map);
	}

	// 1:1문의 상세조회
	@Override
	public Board selectInquiryBoard(Map<String, Object> map) {
		return dao.selectInquiryBoard(map);
	}

	// ------------------------------------------------------------------------------






	// 게시판 종류 목록 조회
	@Override
	public List<Map<String, Object>> selectCategory() {
		return dao.selectCategory();
	}









	// 자유게시판 게시글 조회수 증가
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReadCount(int boardNo) {
		return dao.updateReadCount(boardNo);
	}





	@Override
	public List<String> selectFileList(int boardNo) {
		return dao.selectFileList(boardNo);
	}





	// 1:1문의 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int inquiryBoardWrite(Board board, List<MultipartFile> file, String webPath, String filePath) throws IllegalStateException, IOException{
		// 0. XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));

		// 0-1 boardSt가 null이라면 기본값 세팅
		if(board.getBoardSt() == null) {
			board.setBoardSt("N");
		}

		// 1. BOARD 테이블 INSERT 하기(제목, 내용, 작성자, 게시판 코드)
		// -> boardNo(시퀀스로 생성한 번호) 반환 받기
		int boardNo = dao.inquiryBoardWrite(board);

		// 2. 게시글 삽입 성공 시
		//	업로드된 이미지가 있다면 BOARD_IMG 테이블에 삽입하는 DAO 호출
		if(boardNo > 0) { // 게시글 삽입 성공 시

			// List<MultipartFile> images
			// -> 업로드된 파일이 담긴 객체 MultipartFile이 5개 존재
			// -> 단, 업로드된 파일이 없어도 MultipartFile 객체는 존재

			// 실제 업로드된 파일의 정보를 기록할 List
			List<BoardFile> uploadList = new ArrayList<BoardFile>();

			// images에 담겨있는 파일 중 실제 업로드된 파일만 분류
			for(int i = 0; i < file.size(); i++) {

				// i번째 요소에 업로드한 파일이 있다면
				if(file.get(i).getSize() > 0) {

					BoardFile img = new BoardFile();
					// img에 파일 정보를 담아서 uploadList에 추가
					img.setBoardFilePath(webPath); // 웹 접근 경로
					img.setBoardNo(boardNo); // 게시글 번호

					
					img.setCategoryNo(board.getCategoryNo());

					if(img.getCategoryNo() == 3) {
						img.setBoardFileCategoryNo(1);
					}else {
						img.setBoardFileCategoryNo(2);
					}

					// 파일 원본명
					String fileName = file.get(i).getOriginalFilename(); // 원본명
					img.setBoardFileOriginal(fileName); // 원본명
					img.setBoardFileRename(Util.fileRename(fileName)); // 변경명

					uploadList.add(img);
				}

			} // 분류 for문 종료

			// 분류 작업 후 uploadList가 비어있지 않은 경우
			// == 업로드한 파일이 있다.
			if(!uploadList.isEmpty()) {

				// BOARD_IMG 테이블에 INSERT하는 DAO 호출
				int result = dao.insertInquiryFile(uploadList);
				// result == 삽입된 행의 개수 == uploadList.size()

				// 삽입된 행의 개수와 uploadList의 개수가 같다면
				// == 전체 insert 성공
				if(result == uploadList.size()) {

					// 서버에 파일을 저장(transferTo())

					// images      : 실제 파일이 담긴 객체 리스트
					//				      (업로드 안된 인덱스 빈칸)

					// uploadList : 업로드된 파일의 정보 리스트
					//					  (원본명, 변경명, 순서, 경로, 게시글 번호)

					// 순서 == images 업로드된 인덱스

					for(int i = 0; i < uploadList.size(); i++) {

						String rename = uploadList.get(i).getBoardFileRename();
						
						System.out.println("++++++++++++++++++++++++++++++++ : "+rename);
						
						file.get(i).transferTo(new File(filePath + rename));
						

					}

				}else { // 일부 또는 전체 insert 실패

					// ** 웹 서비스 수행 중 1개라도 실패하면 전체 실패 **
					// -> rollback 필요

					// [결론]
					// 예외를 강제로 발생기켜서 rollback 해야된다.
					// -> 사용자 정의 예외 발생
					// throw new FileUploadException(); // 예외 강제 발생

				}
			}


		}
		return boardNo;
	}

	// 자료실 상세 조회(미완)
	@Override
	public Board boardDataDetail(int boardNo) {
		return dao.boardDataDetail(boardNo);
	}

	// 게시글에 존재하는 파일 조회
	@Override
	public List<BoardFile> selectBoardFile(int boardNo) {

		return dao.selectBoardFile(boardNo);
	}
	// 1:1문의 게시글 삭제
	@Override
	public int inquiryBoardDelete(int boardNo) {
		return dao.inquiryBoardDelete(boardNo);
	}

	// 1:1문의 게시글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int inquiryBoardUpdate(Board board, List<MultipartFile> file, String webPath, String filePath,
			String deleteList) throws IllegalStateException, IOException{
		// 1. 게시글 제목/내용만 수정

		// 1) XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		// 2) DAO호출
		int rowCount = dao.inquiryBoardUpdate(board);

		// 2. 게시글 부분이 수정 성공 했을 때
		if(rowCount > 0) {

			/*
			 * if(!deleteList.equals("")) { // 삭제할 이미지가 있다면 // 3. deleteList에 작성된 이미지 모두 삭제
			 * Map<String, Object> deleteMap = new HashMap<String, Object>();
			 * deleteMap.put("boardNo", board.getBoardNo()); deleteMap.put("deleteList",
			 * deleteList);
			 * 
			 * rowCount = dao.inquiryFileDelete(deleteMap); 
			 * 
			 * if(rowCount == 0) { // 이미지 삭제 실패 시 전체 롤백 // 예외 강제로 발생 // throw new
			 * ImageDeleteException(); } }
			 * 
			 * // 4. 새로 업로드된 이미지 분류 작업
			 * 
			 * // images : 실제 파일이 담긴 List // -> input type="file" 개수만큼 요소가 조재 // -> 제출된 파일이
			 * 없어도 MultipartFile 객체는 존재
			 */
			List<BoardFile> uploadList = new ArrayList<BoardFile>();

			// images에 담겨있는 파일 중 실제 업로드된 파일만 분류

			for(int i = 0; i < file.size(); i++) {

				if(file.get(i).getSize() > 0) {

					BoardFile img = new BoardFile();
					img.setBoardFilePath(webPath);
					img.setBoardNo(board.getBoardNo()); 

					String fileName = file.get(i).getOriginalFilename(); 
					img.setBoardFileOriginal(fileName); 
					img.setBoardFileRename(Util.fileRename(fileName)); 

					uploadList.add(img);
					if(!uploadList.isEmpty()) {


						for(int s = 0; s < uploadList.size(); s++) {

							String rename = uploadList.get(s).getBoardFileRename();

							file.get(s).transferTo(new File(filePath + rename));

						}

					}else { // 일부 또는 전체 insert 실패


					}
					rowCount = dao.inquiryFileUpdate(img);

					if(rowCount == 0) {
						// 수정 실패 == DB에 이미지가 없었다.
						// -> 이미지를 삽입
						rowCount = dao.inquiryFileInsert(img);
					}
				}



			}


		}


		return rowCount;
	}	









	// 자유게시판 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int freeBoardUpdate(Board board, List<MultipartFile> file, String webPath, String filePath,
			String deleteList) throws IllegalStateException, IOException {

		// 1. 게시글 제목/내용만 수정

		// 1) XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		// 2) DAO호출
		int rowCount = dao.freeBoardUpdate(board);


		// 2. 게시글 부분이 수정 성공 했을 때
		if(rowCount > 0) {

			if(!deleteList.equals("")) { // 삭제할 이미지가 있다면
				// 3. deleteList에 작성된 이미지 모두 삭제
				Map<String, Object> deleteMap = new HashMap<String, Object>();
				deleteMap.put("boardNo", board.getBoardNo());
				deleteMap.put("deleteList", deleteList);

				rowCount = dao.freeFileDelete(deleteMap);

				if(rowCount == 0) { // 이미지 삭제 실패 시 전체 롤백
//					 예외 강제로 발생
//					 throw new ImageDeleteException();
				}
			}

			// 4. 새로 업로드된 이미지 분류 작업

			// images : 실제 파일이 담긴 List
			//				  -> input type="file" 개수만큼 요소가 조재
			//				  -> 제출된 파일이 없어도 MultipartFile 객체는 존재

			List<BoardFile> uploadList = new ArrayList<BoardFile>();

			// images에 담겨있는 파일 중 실제 업로드된 파일만 분류

			for(int i = 0; i < file.size(); i++) {

				if(file.get(i).getSize() > 0) {
					
					Map<String, Object> map = new HashMap<String, Object>();
					
					BoardFile img = new BoardFile();
					img.setBoardFilePath(webPath);
					img.setBoardNo(board.getBoardNo()); 

					String fileName = file.get(i).getOriginalFilename(); 
					img.setBoardFileOriginal(fileName); 
					img.setBoardFileRename(Util.fileRename(fileName)); 
					
					uploadList.add(img);
					
					map.put("img", img);
					map.put("categoryNo", board.getCategoryNo());
					
					System.out.println("zxclkjnczxlhkjxcznlkjqewrwiqprnioqniqn::::::::::::::::::::::" + map);
					
					if(!uploadList.isEmpty()) {
						
						
						for(int s = 0; s < uploadList.size(); s++) {
							
							String rename = uploadList.get(s).getBoardFileRename();
							
							System.out.println("lkfdjkljgfdjklfgdkljgfdfdl ::::" + rename);
							
							file.get(s).transferTo(new File(filePath + rename));
							
						}
						
					}else { // 일부 또는 전체 insert 실패
						
						
					}

					rowCount = dao.freeFileUpdate(img);
					
					System.out.println("123123123123213123 ::::::::::"+rowCount);
					System.out.println("@@@@@@@@@@@@@@@@@@@@" + uploadList);
					System.out.println("####################" + img);

					if(rowCount == 0) {
						// 수정 실패 == DB에 이미지가 없었다.
						// -> 이미지를 삽입
						rowCount = dao.freeFileInsert(img);
					}
				}


			}


		}
		return rowCount;

	}

	//공지사항 게시글 상세조회
	@Override
	public Board noticeDetailBoard(Map<String, Object> map) {
		System.out.println("map2 : " + map);
		return dao.noticeDetailBoard(map);
	}



	// 공지사항 작성 페이지----------------------------------
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int noticeboardWrite(Board board, List<MultipartFile> file, String webPath, String filePath) throws IllegalStateException, IOException{
		// 0. XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));

		// 0-1 boardSt가 null이라면 기본값 세팅
		if(board.getBoardSt() == null) {
			board.setBoardSt("N");
		}

		// 1. BOARD 테이블 INSERT 하기(제목, 내용, 작성자, 게시판 코드)
		// -> boardNo(시퀀스로 생성한 번호) 반환 받기
		int boardNo = dao.noticeboardWrite(board);

		// 2. 게시글 삽입 성공 시
		//	업로드된 이미지가 있다면 BOARD_IMG 테이블에 삽입하는 DAO 호출
		if(boardNo > 0) { // 게시글 삽입 성공 시

			// List<MultipartFile> images
			// -> 업로드된 파일이 담긴 객체 MultipartFile이 5개 존재
			// -> 단, 업로드된 파일이 없어도 MultipartFile 객체는 존재

			// 실제 업로드된 파일의 정보를 기록할 List
			List<BoardFile> uploadList = new ArrayList<BoardFile>();

			// images에 담겨있는 파일 중 실제 업로드된 파일만 분류
			for(int i = 0; i < file.size(); i++) {

				// i번째 요소에 업로드한 파일이 있다면
				if(file.get(i).getSize() > 0) {

					BoardFile img = new BoardFile();
					// img에 파일 정보를 담아서 uploadList에 추가
					img.setBoardFilePath(webPath); // 웹 접근 경로
					img.setBoardNo(boardNo); // 게시글 번호

					
					img.setCategoryNo(board.getCategoryNo());

					if(img.getCategoryNo() == 1) {
						img.setBoardFileCategoryNo(1);
					}else {
						img.setBoardFileCategoryNo(2);
					}

					// 파일 원본명
					String fileName = file.get(i).getOriginalFilename(); // 원본명
					img.setBoardFileOriginal(fileName); // 원본명
					img.setBoardFileRename(Util.fileRename(fileName)); // 변경명

					uploadList.add(img);
				}

			} // 분류 for문 종료

			// 분류 작업 후 uploadList가 비어있지 않은 경우
			// == 업로드한 파일이 있다.
			if(!uploadList.isEmpty()) {

				// BOARD_IMG 테이블에 INSERT하는 DAO 호출
				int result = dao.noticeBoardFile(uploadList);
				// result == 삽입된 행의 개수 == uploadList.size()

				// 삽입된 행의 개수와 uploadList의 개수가 같다면
				// == 전체 insert 성공
				if(result == uploadList.size()) {

					// 서버에 파일을 저장(transferTo())

					// images      : 실제 파일이 담긴 객체 리스트
					//				      (업로드 안된 인덱스 빈칸)

					// uploadList : 업로드된 파일의 정보 리스트
					//					  (원본명, 변경명, 순서, 경로, 게시글 번호)

					// 순서 == images 업로드된 인덱스

					for(int i = 0; i < uploadList.size(); i++) {

						String rename = uploadList.get(i).getBoardFileRename();
						
						System.out.println("++++++++++++++++++++++++++++++++ : "+rename);
						
						file.get(i).transferTo(new File(filePath + rename));
						

					}

				}else { // 일부 또는 전체 insert 실패

					// ** 웹 서비스 수행 중 1개라도 실패하면 전체 실패 **
					// -> rollback 필요

					// [결론]
					// 예외를 강제로 발생기켜서 rollback 해야된다.
					// -> 사용자 정의 예외 발생
					// throw new FileUploadException(); // 예외 강제 발생

				}
			}


		}
		return boardNo;
	}
	
	//********************************************공지사항 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int noticeBoardUpdate(Board board, List<MultipartFile> file, String webPath, String filePath,
			String deleteList) throws IllegalStateException, IOException {
		// 1. 게시글 제목/내용만 수정

				// 1) XSS 방지 처리
				board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
				board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
				// 2) DAO호출
				int rowCount = dao.noticeBoardUpdate(board);


				// 2. 게시글 부분이 수정 성공 했을 때
				if(rowCount > 0) {

					if(!deleteList.equals("")) { // 삭제할 이미지가 있다면
						// 3. deleteList에 작성된 이미지 모두 삭제
						Map<String, Object> deleteMap = new HashMap<String, Object>();
						deleteMap.put("boardNo", board.getBoardNo());
						deleteMap.put("deleteList", deleteList);

						rowCount = dao.noticeFileDelete(deleteMap);

						if(rowCount == 0) { // 이미지 삭제 실패 시 전체 롤백
//							 예외 강제로 발생
//							 throw new ImageDeleteException();
						}
					}

					// 4. 새로 업로드된 이미지 분류 작업

					// images : 실제 파일이 담긴 List
					//				  -> input type="file" 개수만큼 요소가 조재
					//				  -> 제출된 파일이 없어도 MultipartFile 객체는 존재

					List<BoardFile> uploadList = new ArrayList<BoardFile>();

					// images에 담겨있는 파일 중 실제 업로드된 파일만 분류

					for(int i = 0; i < file.size(); i++) {

						if(file.get(i).getSize() > 0) {
							
							Map<String, Object> map = new HashMap<String, Object>();
							
							BoardFile img = new BoardFile();
							img.setBoardFilePath(webPath);
							img.setBoardNo(board.getBoardNo()); 

							String fileName = file.get(i).getOriginalFilename(); 
							img.setBoardFileOriginal(fileName); 
							img.setBoardFileRename(Util.fileRename(fileName)); 
							
							uploadList.add(img);
							
							map.put("img", img);
							map.put("categoryNo", board.getCategoryNo());
							
							System.out.println("noticeBoard::::::::::::::::::::::" + map);
							
							if(!uploadList.isEmpty()) {
								
								
								for(int s = 0; s < uploadList.size(); s++) {
									
									String rename = uploadList.get(s).getBoardFileRename();
									
									System.out.println("noticeBoard ::::" + rename);
									
									file.get(s).transferTo(new File(filePath + rename));
									
								}
								
							}else { // 일부 또는 전체 insert 실패
								
								
							}

							rowCount = dao.freeFileUpdate(img);
							
							System.out.println("noticeBoard ::::::::::"+rowCount);
							System.out.println("noticeBoard" + uploadList);
							System.out.println("noticeBoard" + img);

							if(rowCount == 0) {
								// 수정 실패 == DB에 이미지가 없었다.
								// -> 이미지를 삽입
								rowCount = dao.noticeBoardFileUpdate(img);
							}
						}


					}


				}
				return rowCount;
	}
	


	// 1:1문의 비밀번호 확인
	@Override
	public int boardCheck(Map<String, Object> map) {
		return dao.boardCheck(map);
	}


	// 학과공지 게시글 작성
	@Override
	public int departmentBoardInsert(Board board, List<MultipartFile> file, List<MultipartFile> images, String webPath,
			String filePath) throws IllegalStateException, IOException {


		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));

		// 0-1 boardSt가 null이라면 기본값 세팅
		if(board.getBoardSt() == null) {
			board.setBoardSt("N");
		}

		// 1. BOARD 테이블 INSERT 하기(제목, 내용, 작성자, 게시판 코드)
		// -> boardNo(시퀀스로 생성한 번호) 반환 받기
		int boardNo = dao.inquiryBoardWrite(board);

		// 2. 게시글 삽입 성공 시
		//	업로드된 이미지가 있다면 BOARD_IMG 테이블에 삽입하는 DAO 호출
		if(boardNo > 0) { // 게시글 삽입 성공 시

			// List<MultipartFile> images
			// -> 업로드된 파일이 담긴 객체 MultipartFile이 5개 존재
			// -> 단, 업로드된 파일이 없어도 MultipartFile 객체는 존재

			// 실제 업로드된 파일의 정보를 기록할 List
			List<BoardFile> uploadList1 = new ArrayList<BoardFile>();
			
			List<BoardFile> uploadList2 = new ArrayList<BoardFile>();

			// images에 담겨있는 파일 중 실제 업로드된 파일만 분류
			if(file != null) {
				for(int i = 0; i < file.size(); i++) {
					
					// i번째 요소에 업로드한 파일이 있다면
					if(file.get(i).getSize() > 0) {
						
						BoardFile img = new BoardFile();
						// img에 파일 정보를 담아서 uploadList에 추가
						img.setBoardFilePath(webPath); // 웹 접근 경로
						img.setBoardNo(boardNo); // 게시글 번호
						
						img.setBoardFileCategoryNo(
								board.getCategoryNo()
								);
						
						// 파일 원본명
						String fileName = file.get(i).getOriginalFilename(); // 원본명
						img.setBoardFileOriginal(fileName); // 원본명
						img.setBoardFileRename(Util.fileRename(fileName)); // 변경명
						
						uploadList1.add(img);
					}
				
			}
				if(images != null) {
					
					for(int s = 0; s < images.size(); s++) {
						
						// i번째 요소에 업로드한 파일이 있다면
						if(images.get(s).getSize() > 0) {
							
							BoardFile imgs = new BoardFile();
							// img에 파일 정보를 담아서 uploadList에 추가
							imgs.setBoardFilePath(webPath); // 웹 접근 경로
							imgs.setBoardNo(boardNo); // 게시글 번호
							
							imgs.setBoardFileCategoryNo(
									board.getCategoryNo()
									);
							
							// 파일 원본명
							String fileName = images.get(s).getOriginalFilename(); // 원본명
							imgs.setBoardFileOriginal(fileName); // 원본명
							imgs.setBoardFileRename(Util.fileRename(fileName)); // 변경명
							
							uploadList2.add(imgs);
						}
					}
				}

			} // 분류 for문 종료

			// 분류 작업 후 uploadList가 비어있지 않은 경우
			// == 업로드한 파일이 있다.
			if(!uploadList1.isEmpty()) {

				// BOARD_IMG 테이블에 INSERT하는 DAO 호출
				int result = dao.insertDepartmentFile(uploadList1);
				// result == 삽입된 행의 개수 == uploadList.size()

				// 삽입된 행의 개수와 uploadList의 개수가 같다면
				// == 전체 insert 성공
				if(result == uploadList1.size()) {

					// 서버에 파일을 저장(transferTo())

					// images      : 실제 파일이 담긴 객체 리스트
					//				      (업로드 안된 인덱스 빈칸)

					// uploadList : 업로드된 파일의 정보 리스트
					//					  (원본명, 변경명, 순서, 경로, 게시글 번호)

					// 순서 == images 업로드된 인덱스

					for(int i = 0; i < uploadList1.size(); i++) {

						String rename = uploadList1.get(i).getBoardFileRename();
						file.get(i).transferTo(new File(filePath + rename));

					}

				}else { // 일부 또는 전체 insert 실패

					// ** 웹 서비스 수행 중 1개라도 실패하면 전체 실패 **
					// -> rollback 필요

					// [결론]
					// 예외를 강제로 발생기켜서 rollback 해야된다.
					// -> 사용자 정의 예외 발생
					// throw new FileUploadException(); // 예외 강제 발생

				}

				if(!uploadList2.isEmpty()) {

					// BOARD_IMG 테이블에 INSERT하는 DAO 호출
					int result1 = dao.insertDepartmentImage(uploadList2);
					// result == 삽입된 행의 개수 == uploadList.size()

					// 삽입된 행의 개수와 uploadList의 개수가 같다면
					// == 전체 insert 성공
					if(result1 == uploadList2.size()) {

						// 서버에 파일을 저장(transferTo())

						// images      : 실제 파일이 담긴 객체 리스트
						//				      (업로드 안된 인덱스 빈칸)

						// uploadList : 업로드된 파일의 정보 리스트
						//					  (원본명, 변경명, 순서, 경로, 게시글 번호)

						// 순서 == images 업로드된 인덱스

						for(int i = 0; i < uploadList2.size(); i++) {

							String rename = uploadList2.get(i).getBoardFileRename();
							images.get(i).transferTo(new File(filePath + rename));

						}

					}else { // 일부 또는 전체 insert 실패

						// ** 웹 서비스 수행 중 1개라도 실패하면 전체 실패 **
						// -> rollback 필요

						// [결론]
						// 예외를 강제로 발생기켜서 rollback 해야된다.
						// -> 사용자 정의 예외 발생
						// throw new FileUploadException(); // 예외 강제 발생

					}

				}
			}

		}
		return boardNo;
	}

	@Override
	public Map<String, Object> searchFreeBoardList(Map<String, Object> paramMap, int cp) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> selectinquiryBoardList(Map<String, Object> paramMap, int cp) {
		// TODO Auto-generated method stub
		return null;
	}

	// 학과공지 수정
	@Override
	public int departmentBoardUpdate(Board board, List<MultipartFile> file, String webPath, String filePath,
			List<MultipartFile> images) throws IllegalStateException, IOException {
		// 1) XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));
		// 2) DAO호출
		int rowCount = dao.departmentBoardUpdate(board);
		
		// 2. 게시글 부분이 수정 성공 했을 때
		if(rowCount > 0) {


			List<BoardFile> uploadList1= new ArrayList<BoardFile>();
			List<BoardFile> uploadList2 = new ArrayList<BoardFile>();

			// images에 담겨있는 파일 중 실제 업로드된 파일만 분류
			if(file != null) {
				for(int i = 0; i < file.size(); i++) {
					
					if(file.get(i).getSize() > 0) {
						
						BoardFile img1 = new BoardFile();
						img1.setBoardFilePath(webPath);
						img1.setBoardNo(board.getBoardNo()); 
						
						String fileName = file.get(i).getOriginalFilename(); 
						img1.setBoardFileOriginal(fileName); 
						img1.setBoardFileRename(Util.fileRename(fileName)); 
						uploadList1.add(img1);
						if(!uploadList1.isEmpty()) {
							
							
							for(int s = 0; s < uploadList1.size(); s++) {
								
								String rename = uploadList1.get(s).getBoardFileRename();
								
								file.get(s).transferTo(new File(filePath + rename));
								
							}
							
						}else { // 일부 또는 전체 insert 실패
							
							
						}
						rowCount = dao.inquiryFileUpdate(img1);
						
						if(rowCount == 0) {
							// 수정 실패 == DB에 이미지가 없었다.
							// -> 이미지를 삽입
							rowCount = dao.inquiryFileInsert(img1);
						}
					}
					
					
					
				}
				
			}
			if(images != null) {
				
				for(int i = 0; i < images.size(); i++) {
					
					if(images.get(i).getSize() > 0) {
						
						BoardFile img2 = new BoardFile();
						img2.setBoardFilePath(webPath);
						img2.setBoardNo(board.getBoardNo()); 
						
						String fileName = images.get(i).getOriginalFilename(); 
						img2.setBoardFileOriginal(fileName); 
						img2.setBoardFileRename(Util.fileRename(fileName)); 
						uploadList2.add(img2);
						if(!uploadList2.isEmpty()) {
							
							
							for(int s = 0; s < uploadList2.size(); s++) {
								
								String rename = uploadList2.get(s).getBoardFileRename();
								
								images.get(s).transferTo(new File(filePath + rename));
								
							}
							
						}else { // 일부 또는 전체 insert 실패
							
							
						}
						rowCount = dao.inquiryImageUpdate(img2);
						
						if(rowCount == 0) {
							// 수정 실패 == DB에 이미지가 없었다.
							// -> 이미지를 삽입
							rowCount = dao.inquiryImageInsert(img2);
						}
					}
					
					
					
				}
			}


		}


		return rowCount;
	}

	@Override
	public List<Member> selectMemberList(Member loginMember) {
		return dao.selectMemberList(loginMember);
	}

	@Override
	public int freeBoardDelete(int boardNo) {
		return dao.freeBoardDelete(boardNo);
	}

	@Override
	public List<Board> selectMainBoard() {
		return dao.selectMainBoard();
	}

	@Override
	public int noticeBoardDelete(int boardNo) {
		return dao.noticeBoardDelete(boardNo);
	}
	









}
