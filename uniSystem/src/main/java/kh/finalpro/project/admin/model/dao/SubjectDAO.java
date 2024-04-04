package kh.finalpro.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.admin.model.dto.Subject;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.main.model.dto.Member;

/**
 * @author user1
 *
 */
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

	/** 교과목 테이블 갯수 카운트
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("subjectMapper.getListCount");
	}

	/** 교과목 목록 조회
	 * @param pagination
	 * @return subjectList
	 */
	public List<Subject> selectSubjectList(Pagination pagination) {
		
		// RowBounts 객체
		// - 마이바티스에서 페이징 처리를 위해 제공하는 객체
		// - offset만큼 건너 뛰고
		// 그 다음 지정된 행 개수(limit) 만큼 조회

		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		// 3) selectList("namespace.id", 파라미터, RowBounds) 호출 
		return sqlSession.selectList("subjectMapper.selectSubjectList", offset, rowBounds);
	}

	/** 교과목 목록 검색어(O) 갯수 조회
	 * @param paramMap
	 * @return listCount
	 */
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("subjectMapper.getListCount_query", paramMap);
	}

	/** 교과목 목록 조회 검색어(O)
	 * @param paramMap
	 * @param pagination
	 * @return subjectList
	 */
	public List<Subject> selectSubjectList(Map<String, Object> paramMap, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("subjectMapper.selectSubjectList_query", paramMap, rowBounds);
	}

	/** 교과목 수정 DAO
	 * @param inputClass
	 * @return result
	 */
	public int updateSubject(Subject inputClass) {
		return sqlSession.update("subjectMapper.updateSubject",inputClass);
	}

	/** 교과목 삭제 DAO
	 * @param classNo
	 * @return result
	 */
	public int deleteSubject(int classNo) {
		return sqlSession.delete("subjectMapper.deleteSubject", classNo);
	}

	/** 담당 교수 확인 DAO
	 * @param paramMap
	 * @return result
	 */
	public int professorCheck(Map<String, Object> paramMap) {
		return sqlSession.selectOne("subjectMapper.professorCheck", paramMap);
	}

	/** 교수 시간표 조회 DAO
	 * @param memberNo
	 * @return classList
	 */
	public List<Subject> professorTimeTable(String memberNo) {
		return sqlSession.selectList("subjectMapper.professorTimeTable", memberNo);
	}


}
