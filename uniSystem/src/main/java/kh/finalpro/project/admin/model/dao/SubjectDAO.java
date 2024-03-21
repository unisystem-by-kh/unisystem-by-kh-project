package kh.finalpro.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.admin.model.dto.Subject;
import kh.finalpro.project.main.model.dto.Member;

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

	/** 학과코드 호출 DAO
	 * @return deptCodeList
	 */
	public List<Map<String, Object>> selectDeptCodeList() {
		return sqlSession.selectList("subjectMapper.selectDeptCodeList");
	}

	/** 담당 교수 목록 조회 DAO
	 * @param deptCode
	 * @return memberList
	 */
	public List<Member> searchProfessor(String deptCode) {
		return sqlSession.selectList("memberMapper.searchProfessor", deptCode);
	}

	/** 교수 강의 시간 조회 DAO
	 * @param map
	 * @return count
	 */
	public int timeCheck(Map<String, Object> map) {
		return sqlSession.selectOne("subjectMapper.timeCheck", map);
	}


}
