package kh.finalpro.project.professor.model.service;

import java.util.Map;


public interface ProfessorService {

	// 학생 조회(교수 전용)
	Map<String, Object> selectStudent();

	// 학생 조회(교수 전용) - 검색 처리
	Map<String, Object> searchStudent(Map<String, Object> paramMap);


}
