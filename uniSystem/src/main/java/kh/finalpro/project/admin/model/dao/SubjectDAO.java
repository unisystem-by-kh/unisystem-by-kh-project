package kh.finalpro.project.admin.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.admin.model.dto.Subject;

@Repository
public class SubjectDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 담당교수 번호 가져오는 DAO
	 * @param map
	 * @return memberNo
	 */
	public String selectProfessor(Map<String, Object> map) {
		return sqlSession.selectOne("subjectMapper.selectProfessor", map);
	}

	/** 교과목 등록 DAO
	 * @param inputClass
	 * @return result
	 */
	public int insertSubject(Subject inputClass) {
		return sqlSession.insert("subjectMapper.insertSubject", inputClass);
	}

}
