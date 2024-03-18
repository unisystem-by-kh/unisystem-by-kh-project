package kh.finalpro.project.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

		return map;
	}

	// 1:1 문의 목록조회
	@Override
	public Map<String, Object> selectinquiryBoardList(int boardCode, int cp) {

		int listCount = dao.getListCount(boardCode);

		Pagination pagination = new Pagination(cp, listCount);

		List<BoardDAO> boardList = dao.selectinquiryBoardList(pagination, boardCode);
		
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

}
