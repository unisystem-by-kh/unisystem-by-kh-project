package kh.finalpro.project.professor.model.service;

import java.util.List;
import java.util.Map;

import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Professor;


public interface ProfessorService {

	// 학생 조회(교수 전용)
	Map<String, Object> selectStudent();

	// 학생 조회(교수 전용) - 검색 처리
	Map<String, Object> searchStudent(Map<String, Object> paramMap);

	// 학생 목록 전부 조회
	List<Professor> selectMemberList();

	// 검색 조건에 맞는 학생 목록 조회
	List<Professor> searchMemberList(Map<String, Object> paramMap);

	// 여러가지 선택 조건(학년, 학기, 학과, 과목)에 검색 된 학생 목록 성적 조회 비동기 AJAX
	List<Professor> searchMember(Map<String, Object> paramMap);

	// 비동기로 학과를 가져와서 학과 목록 select/option 목록 가져오기
	List<Professor> departmentList();

	// 비동기로 과목을 가져와서 학과 목록 select/option 목록 가져오기
	List<Professor> classList();

	int updateGrades(List<Map<String, Object>> gradesList);

	// 과제 등록 페이지 이동 시 등록되어 있는 과제 조회
	Map<String, Object> selectTaskList(Member loginMember);




}
