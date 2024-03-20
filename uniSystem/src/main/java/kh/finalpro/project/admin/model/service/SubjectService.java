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



}
