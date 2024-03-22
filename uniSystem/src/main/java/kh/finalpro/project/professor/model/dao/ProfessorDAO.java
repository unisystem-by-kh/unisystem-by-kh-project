package kh.finalpro.project.professor.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dao.BoardDAO;

@Repository
public class ProfessorDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 재적중인 학생 수 조회
	public int getListCount() {
		return sqlSession.selectOne("professorMapper.getListCount");
	}

	// 학생 목록 조회
	public List<ProfessorDAO> selectStudent() {
		return sqlSession.selectList("professorMapper.selectStudent");
	}
	
	
	
	
}
