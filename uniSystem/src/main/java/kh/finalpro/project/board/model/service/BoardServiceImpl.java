package kh.finalpro.project.board.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.finalpro.project.common.util.Util;
import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.BoardFile;
import kh.finalpro.project.board.model.dto.Pagination;


@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;

	// 게시판 종류 목록 조회
	@Override
	public List<Map<String, Object>> selectCategory() {
		return dao.selectCategory();
	}

	// 자유게시판 목록 조회
	@Override
	public Map<String, Object> selectFreeBoardList(int categoryNo, int cp) {
		
		int listCount = dao.getListCount(categoryNo);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<BoardDAO> boardList = dao.selectFreeBoardList(pagination, categoryNo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		System.out.println(boardList);

		System.out.println("Service ;; " + map);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@썸네일을 찾아라 : " + boardList);

		return map;
	}

	// 1:1 문의 목록조회
	@Override
	public Map<String, Object> selectinquiryBoardList(int categoryNo, int cp) {

		int listCount = dao.getListCount(categoryNo);

		Pagination pagination = new Pagination(cp, listCount);

		List<BoardDAO> boardList = dao.selectinquiryBoardList(pagination, categoryNo);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pagination", pagination);
		map.put("boardList", boardList);

		
		return map;
	}


	// 자유게시판 목록 조회(검색)
	@Override
	public Map<String, Object> searchFreeBoardList(Map<String, Object> paramMap, int cp) {
		
		// 1. 특정 게시판의 삭제되지 않고 검색 조건이 일치하는 게시글 수 조회
		int listCount = dao.getListCount(paramMap);
		
		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		// 		-> 내부 필드가 모두 계산되어 초기화됨
		Pagination pagination = new Pagination(cp, listCount);
		
		// 3. 특정 게시판에서 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// + 단, 검색 조건 일치하는 글만
		List<Board> boardList = dao.searchFreeBoardList(pagination, paramMap);
		
		// 4. pagination, boardList를 Map에 답아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
		
	}
	
	// 1:1문의 목록(검색)
	@Override
	public Map<String, Object> selectinquiryBoardList(Map<String, Object> paramMap, int cp) {
		
		int listCount = dao.getListCountInquiry(paramMap);

		Pagination pagination = new Pagination(cp, listCount);

		List<BoardDAO> boardList = dao.selectinquiryBoardList(pagination, paramMap);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}

	// 자유게시판 상세 조회
	@Override
	public Board selectFreeBoard(Map<String, Object> map) {
		return dao.selectFreeBoard(map);
	}

	// 자유게시판 게시글 조회수 증가
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReadCount(int boardNo) {
		return dao.updateReadCount(boardNo);
	}

	
	
	// 1:1문의 상세조회
	@Override
	public Board selectInquiryBoard(Map<String, Object> map) {
		return dao.selectInquiryBoard(map);
	}

	@Override
	public List<String> selectFileList(int boardNo) {
		return dao.selectFileList(boardNo);
	}

	
	// 공지사항 목록 조회
	@Override
	public Map<String, Object> selelctNoticeBoardList(int categoryNo, int cp) {
		
		int listCount = dao.getListCount(categoryNo);
		
		
		Pagination pagination = new Pagination(cp, listCount);
		
				
		List<Board> boardList = dao.selectNoticeBoardList(pagination, categoryNo);
		
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("boardList", boardList);
		
		return map;
	}
	
	// 1:1문의 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int inquiryBoardWrite(Board board, List<MultipartFile> file, String webPath, String filePath) throws IllegalStateException, IOException{
		// 0. XSS 방지 처리
		board.setBoardTitle(Util.XSSHandling(board.getBoardTitle()));
		board.setBoardContent(Util.XSSHandling(board.getBoardContent()));

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
					img.setBoardFileCategoryNo(board.getCategoryNo());
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
	
	

}
