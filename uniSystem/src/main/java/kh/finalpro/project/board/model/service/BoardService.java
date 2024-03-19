package kh.finalpro.project.board.model.service;

import java.util.List;
import java.util.Map;

import kh.finalpro.project.board.model.dto.Board;

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


	/** 자유게시판 상세 목록 조회
	 * @param map
	 * @return freeBoard
	 */
	Board selectFreeBoard(Map<String, Object> map);


	/** 자유게시판 조회수 증가
	 * @param boardNo
	 * @return result
	 */
	int updateReadCount(int boardNo);

	
	/** DB에 있는 이미지(파일) 목록 조회
	 * @return dbImageList
	 */
	List<String> selectFileList(int boardNo);

	

	/** 1:1문의 상세페이지
	 * @param map
	 * @return board
	 */
	Board selectInquiryBoard(Map<String, Object> map);


	/** 공지사항 목록 조회
	 * @param categoryNo
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selelctNoticeBoardList(int categoryNo, int cp);



}
