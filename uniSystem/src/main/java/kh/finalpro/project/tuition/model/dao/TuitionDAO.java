package kh.finalpro.project.tuition.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.tuition.model.dto.Tuition;

@Repository
public class TuitionDAO {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int tuitionInsert(Tuition tuition) {
		return sqlSession.insert("tuitionMapper.tuitionInsert", tuition);
	}

	public int tuition(String memberNo) {
		return sqlSession.selectOne("tuitionMapper.tuition", memberNo);
	}

}
