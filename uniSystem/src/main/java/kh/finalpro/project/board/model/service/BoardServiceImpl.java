package kh.finalpro.project.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.board.model.dto.Pagination;


@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO dao;

	// 게시판 종류 목록 조회
	@Override
	public List<Map<String, Object>> selectBoardTypeList() {
		return dao.selectBoardTypeList();
	}

	// 자유게시판 목록 조회
	@Override
	public Map<String, Object> selectFreeBoardList(int boardCode, int cp) {

		int listCount = dao.getListCount(boardCode);

		Pagination pagination = new Pagination(cp, listCount);

		List<BoardDAO> boardList = dao.selectFreeBoardList(pagination, boardCode);

		System.out.println("Service ;; " + boardList);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pagination", pagination);
		map.put("boardList", boardList);

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



}
