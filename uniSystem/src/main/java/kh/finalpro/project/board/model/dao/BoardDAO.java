package kh.finalpro.project.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dto.Board;
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

	/** 공지사항 목록 조회
	 * @param pagination
	 * @param boardCode
	 * @return
	 */
	public List<Board> selectNoticeBoardList(Pagination pagination, int categoryNo) {
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		// 3) selectList

		return sqlSession.selectList("boardMapper.selectNoticeBoardList", categoryNo, rowBounds);
	}

	/** 공지사항 목록 조회(검색)
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<Board> selectNoticeBoardList(Pagination pagination, Map<String, Object> paramMap) {
		// 1) offset 계산
				int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

				// 2) RowBounds 객체 생성
				RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
				
				return sqlSession.selectList("boardMapper.selectNoticeBoardList_search", paramMap, rowBounds);
	}


	


}
