package kh.finalpro.project.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	
	/** 게시판 종류 목록 조회 Service
	 * @return List 
	 */
	List<Map<String, Object>> selectBoardTypeList();
	
	/**
	 * 자유게시판 목록
	 * @param boardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectFreeBoardList(int boardCode, int cp);

}
