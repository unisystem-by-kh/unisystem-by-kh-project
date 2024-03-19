package kh.finalpro.project.board.model.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	
	/** 게시판 종류 목록 조회 Service
	 * @return List 
	 */
	List<Map<String, Object>> selectCategory();
	
	
	/**
	 * 자유게시판 목록
	 * @param boardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectFreeBoardList(int categoryNo, int cp);

	
	/** 자유게시판 목록(검색)
	 * @param paramMap
	 * @param cp
	 * @return map
	 */
	Map<String, Object> searchFreeBoardList(Map<String, Object> paramMap, int cp);

	/** 1 : 1 문의 목록조회
	 * @param boardCode
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectinquiryBoardList(int categoryNo, int cp);


	/** 1 : 1 문의 목록(검색)
	 * @param paramMap
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectinquiryBoardList(Map<String, Object> paramMap, int cp);

}
