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


	/** 게시판 종류 목록 조회 DAO
	 * @return boardTypeList
	 */
	public List<Map<String, Object>> selectCategory() {
		return sqlSession.selectList("boardMapper.selectCategory");
	}

	/**
	 * 자유 게시판의 게시글 삭제 되지 않은 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */

	public int getListCount(int categoryNo) {
		
		return sqlSession.selectOne("boardMapper.getListCount", categoryNo);

	}


	/** 자유 게시판의 게시글 목록 조회
	 * @param pagination
	 * @param categoryNo
	 * @return listCount
	 */
	public List<BoardDAO> selectFreeBoardList(Pagination pagination, int categoryNo) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectFreeBoardList" , categoryNo, rowBounds);
		
	}

	/** 자유 게시판의 게시글 수 조회(검색)
	 * @param paramMap
	 * @return listCount
	 */
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.getListCount_search", paramMap);
	}

	/** 자유 게시판의 게시글 목록 조회(검색)
	 * @param pagination
	 * @param paramMap
	 * @return boardList
	 */
	public List<Board> searchFreeBoardList(Pagination pagination, Map<String, Object> paramMap) {

		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
				
		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		// 3) selectList("namespace.id" , 파라미터 , RowBounds) 호출
		return sqlSession.selectList("boardMapper.searchFreeBoardList" , paramMap, rowBounds);

	}
	
	

	/** 1:1 문의 목록조회
	 * @param pagination
	 * @param boardCode
	 * @return map
	 */
	public List<BoardDAO> selectinquiryBoardList(Pagination pagination, int categoryNo) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectinquiryBoardList", categoryNo, rowBounds);

	}
	/** 1:1문의 검색 게시글 갯수 조회
	 * @param paramMap
	 * @return
	 */
	public int getListCountInquiry(Map<String, Object> paramMap) {
		return sqlSession.selectOne("boardMapper.getListCount_inquiry", paramMap);
	}

	/** 1:1문의 목록(검색)
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<BoardDAO> selectinquiryBoardList(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("boardMapper.selectinquiryBoardList_search", paramMap, rowBounds);
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

	/** 공지사항 목록 조회
	 * @param pagination
	 * @param categoryNo
	 * @return
	 */
	public List<Board> selectNoticeBoardList(Pagination pagination, int categoryNo) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		// 3) selectList

		return sqlSession.selectList("boardMapper.selectNoticeBoardList", categoryNo, rowBounds);
  }
	
	/** 자료실 목록 조회
	 * @param categoryNo
	 * @param pagination
	 * @return
	 */
	public List<Board> selectDataList(int categoryNo, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit() + 5);
		
		return sqlSession.selectList("boardMapper.selectDataBoardList", categoryNo, rowBounds);
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

	
	
	/** 공지사항 목록 검색
	 * @param pagination
	 * @param paramMap
	 * @return boardList
	 */
	public List<Board> selelctNoticeBoardList(Pagination pagination, Map<String, Object> paramMap) {
		// Rowbounds 객체
		// - 마이바티스에서 페이징 처리를 위해 제동하는 객체
		// - offset만큼 건너 뛰고
		// 그 다음 지정된 행 개수(limit)만큼 조회

		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit() + 5);
		
		return sqlSession.selectList("boardMapper.selelctNoticeBoardList_search", paramMap, rowBounds);
	}

}
