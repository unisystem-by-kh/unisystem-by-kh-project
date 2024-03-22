package kh.finalpro.project.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.BoardFile;
import kh.finalpro.project.board.model.dto.Pagination;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;



	// -----------------------게시판 목록 조회------------------------------------

	/** 게시판 목록 조회 (공지사항, 자유게시판, 1:1 문의, 학과공지, 자료실)
	 * @param pagination
	 * @param categoryNo
	 * @return boardList
	 */
	public List<Board> selectBoardList(Pagination pagination, int categoryNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds;
		
		if(categoryNo == 1 || categoryNo == 5) {
			rowBounds = new RowBounds(offset, pagination.getLimit()+5); // 공지사항, 자료실
		}else {
			rowBounds = new RowBounds(offset, pagination.getLimit()); // 자유게시판, 1:1 문의, 학과공지
		}

		return sqlSession.selectList("boardMapper.selectBoardList", categoryNo, rowBounds); // 공지사항, 자료실
		// return sqlSession.selectList("boardMapper.selectFreeBoardList" , categoryNo, rowBounds); // 자유게시판
		// return sqlSession.selectList("boardMapper.selectinquiryBoardList", categoryNo, rowBounds); // 1:1문의, 학과공지
		// return sqlSession.selectList("boardMapper.selectDataBoardList", categoryNo, rowBounds); // 자료실

  	}

	// ---------------------------------------------------------------------

	// ---------------------게시판 목록 조회(검색)----------------------------

	/** 공지사항 목록 검색
	 * @param pagination
	 * @param paramMap
	 * @return boardList
	 */
	public List<Board> selelctBoardList(Pagination pagination, Map<String, Object> paramMap) {

		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		// return sqlSession.selectList("boardMapper.selelctNoticeBoardList_search", paramMap, rowBounds); // 공지사항
		// return sqlSession.selectList("boardMapper.searchFreeBoardList" , paramMap, rowBounds); // 자유게시판
		// return sqlSession.selectList("boardMapper.selectinquiryBoardList_search", paramMap, rowBounds); // 1:1문의, 학과공지

		return sqlSession.selectList("boardMapper.selectBoardList_search", paramMap, rowBounds); // 전체
	}

	// ----------------------------------------------------------------------





	// ----------------------------게시판 카운트(다 있어야 함)-----------------------------
	/**
	 * 자유 게시판의 게시글 삭제 되지 않은 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */
	public int getListCount(int categoryNo) {
		return sqlSession.selectOne("boardMapper.getListCount", categoryNo);
	}
	/** 자유 게시판의 게시글 수 조회(검색)
	 * @param paramMap
	 * @return listCount
	 */
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.getListCount_search", paramMap);
	}
	/** 1:1문의 검색 게시글 갯수 조회
	 * @param paramMap
	 * @return
	 */
	public int getListCountInquiry(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.getListCount_inquiry", paramMap);
	}
	// ---------------------------------------------------------------------


	/** 게시판 종류 목록 조회 DAO
	 * @return boardTypeList
	 */
	public List<Map<String, Object>> selectCategory() {
		return sqlSession.selectList("boardMapper.selectCategory");
	}

	/** 자유게시판 상세 조회
	 * @param map
	 * @return map
	 */
	public Board selectFreeBoard(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectFreeBoard" , map);
	}

	/** 자유게시판 게시글 조회수 증가
	 * @param boardNo
	 * @return result
	 */
	public int updateReadCount(int boardNo) {
		return sqlSession.update("boardMapper.updateReadCount" , boardNo);
	}


	public List<String> selectFileList(int boardNo) {
		return sqlSession.selectList("boardMapper.selectImageListAll", boardNo);
	}

	/** 1:1문의 상세 조회
	 * @param map
	 * @return board
	 */
	public Board selectInquiryBoard(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.selectInquiryBoard", map);
	}

	
	
	
	
	
	/** 1:1문의 작성
	 * @param board
	 * @return boardNo
	 */
	public int inquiryBoardWrite(Board board) {
		
		int result = sqlSession.insert("boardMapper.inquiryBoardWrite", board);
		
		if(result > 0) {
			result = board.getBoardNo();
		}
		
		return result;
	}

	/** 1:1문의 파일 업로드
	 * @param uploadList
	 * @return
	 */
	public int insertInquiryFile(List<BoardFile> uploadList) {
		return sqlSession.insert("boardMapper.insertInquiryFile", uploadList);
	}

	/** 게시글에 존재하는 파일 조회
	 * @param boardNo
	 * @return boardFile
	 */
	public List<BoardFile> selectBoardFile(int boardNo) {
		return sqlSession.selectList("boardMapper.selectBoardFile", boardNo);
	}

	/** 자료실 상세
	 * @param boardNo
	 * @return board
	 */
	public Board boardDataDetail(int boardNo) {
		return sqlSession.selectOne("boardMapper.boardDataDetail", boardNo);
	}

	/** 1:1문의 게시글 삭제
	 * @param boardNo
	 * @return
	 */
	public int inquiryBoardDelete(int boardNo) {
		return sqlSession.update("boardMapper.inquiryBoardDelete", boardNo);
	}

	/** 1:1문의 게시글 수정
	 * @param board
	 * @return
	 */
	public int inquiryBoardUpdate(Board board) {
		return sqlSession.update("boardMapper.inquiryBoardUpdate", board);
	}

	/** 1:1문의 파일 삭제
	 * @param deleteMap
	 * @return
	 */
	public int inquiryFileDelete(Map<String, Object> deleteMap) {
		return sqlSession.delete("boardMapper.inquiryBoardDelete", deleteMap);
	}

	/** 1:1문의 파일 수정
	 * @param img
	 * @return
	 */
	public int inquiryFileUpdate(BoardFile img) {
		return sqlSession.update("boardMapper.inquiryFileUpdate", img);
	}

	/** 1:1문의 파일 삽입
	 * @param img
	 * @return
	 */
	public int inquiryFileInsert(BoardFile img) {
		return sqlSession.insert("boardMapper.inquiryFileInsert", img);
	}

	
	
	

	/** 공지사항 상세페이지
	 * @param map
	 * @return board
	 */
	public Board noticeDetailBoard(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.noticeDetailBoard", map);
	}

	/** 공지사항 작성 페이지
	 * @param board
	 * @return boardNo
	 */
	public int noticeBoardWrite(Board board) {
		return sqlSession.insert("boardMapper.noticeBoardWrite", board);
	}
	
}
