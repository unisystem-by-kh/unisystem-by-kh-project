package kh.finalpro.project.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dto.Pagination;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 게시판 종류 목록 조회 DAO
	 * @return boardTypeList
	 */
	public List<Map<String, Object>> selectBoardTypeList() {
		return sqlSession.selectList("boardMapper.selectBoardTypeList");
	}

	/**
	 * 특정 게시판의 게시글 삭제 되지 않은 게시글 수 조회
	 * @param boardCode
	 * @return listCount
	 */
	public int getListCount(int boardCode) {

		System.out.println("DAO ;; : " + boardCode);

		return sqlSession.selectOne("boardMapper.getListCount", boardCode);
	}




	public List<BoardDAO> selectFreeBoardList(Pagination pagination, int boardCode) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		System.out.println("DAO ;; " + pagination);
		System.out.println("DAO ;; " + boardCode);

		return sqlSession.selectList("boardMapper.selectFreeBoardList" , boardCode, rowBounds);

	}

	/** 1:1 문의 목록조회
	 * @param pagination
	 * @param boardCode
	 * @return map
	 */
	public List<BoardDAO> selectinquiryBoardList(Pagination pagination, int boardCode) {

		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("boardMapper.selectinquiryBoardList", boardCode, rowBounds);
	}

}
