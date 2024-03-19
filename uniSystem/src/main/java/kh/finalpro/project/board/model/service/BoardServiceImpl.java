package kh.finalpro.project.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.board.model.dto.Board;
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
	
	

}
