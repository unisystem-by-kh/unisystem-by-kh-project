package kh.finalpro.project.professor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.professor.model.dto.Lecture;

@Repository
public class AjaxDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Lecture> selectLecture(String memberNo) {
		return sqlSession.selectList("professorMapper.selectLecture");
	}
	
	
	

}
