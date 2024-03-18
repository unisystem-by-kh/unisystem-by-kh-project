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

	


}
