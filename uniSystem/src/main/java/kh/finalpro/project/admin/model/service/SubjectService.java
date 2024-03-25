package kh.finalpro.project.admin.model.service;

import java.util.List;
import java.util.Map;

import kh.finalpro.project.admin.model.dto.Subject;
import kh.finalpro.project.main.model.dto.Member;

public interface SubjectService {


	/** 교과목 등록
	 * @param inputClass
	 * @return result
	 */
	int insertSubject(Subject inputClass);

	/** 학과 코드 조회 서비스
	 * @return deptCodeList
	 */
	List<Map<String, Object>> selectDeptCodeList();

	/** 담당 교수 목록 조회
	 * @param deptCode
	 * @return memberList
	 */
	List<Member> searchProfessor(String deptCode);

	/** 교수 강의 시간 조회 
	 * @param map
	 * @return count
	 */
	int timeCheck(Map<String, Object> map);

	
	/** 교과목 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectSubjectList(int cp);

	/** 교과목 목록에서 검색 조회
	 * @param paramMap
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectSubjectList(Map<String, Object> paramMap, int cp);

	/** 교과목 수정 서비스
	 * @param inputClass
	 * @return result
	 */
	int updateSubject(Subject inputClass);

	/** 교과목 삭제
	 * @param classNo
	 * @return result
	 */
	int deleteSubject(int classNo);



}
