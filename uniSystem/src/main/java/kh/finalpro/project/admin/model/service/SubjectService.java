package kh.finalpro.project.admin.model.service;

import kh.finalpro.project.admin.model.dto.Subject;

public interface SubjectService {


	/** 교과목 등록
	 * @param inputClass
	 * @return result
	 */
	int insertSubject(Subject inputClass);

}
