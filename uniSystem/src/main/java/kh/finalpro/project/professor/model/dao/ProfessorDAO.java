package kh.finalpro.project.professor.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.professor.model.dto.Professor;

@Repository
public class ProfessorDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 재학중인 학생 수 조회
	public int getListCount() {
		return sqlSession.selectOne("professorMapper.getListCount");
	}

	// 재학중인 학생 목록 조회
	public List<Professor> selectStudent() {
		return sqlSession.selectList("professorMapper.selectStudent");
	}

	// 재학중인 학생 수 조회 - 검색
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("professorMapper.getListCount_search", paramMap);
	}
	
	// 재학중인 학생 목록 조회 - 검색
	public List<Professor> searchStudent(Map<String, Object> paramMap) {
		return sqlSession.selectList("professorMapper.searchStudent", paramMap);
	}

	// 학생이 수강중인 수강 목록 조회
	public List<Lecture> lectureList() {
		return sqlSession.selectList("professorMapper.lectureList");
	}
	
	
	
	
	
	
}
