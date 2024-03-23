package kh.finalpro.project.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.admin.model.dto.Evaluation;
import kh.finalpro.project.collegian.model.dto.Pagination;

@Repository
public class EvaluationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 평가 목록 갯수 카운트
	public int getListCount() {
		return sqlSession.selectOne("evaluationMapper.getListCount");
	}

	// 평가 목록 조회
	public List<Evaluation> selectLateList(Pagination pagination) {

		int offset
		= (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("evaluationMapper.selectLateList", pagination);
	}

}
