package kh.finalpro.project.professor.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.Pagination;
import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dao.ProfessorDAO;
import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.professor.model.dto.Professor;
import kh.finalpro.project.professor.model.dto.Task;

/**
 * @author user1
 *
 */
@Service
public class ProfessorServiceImpl implements ProfessorService{

	

	@Autowired
	private ProfessorDAO dao;
	
	
	// 학생 조회
	@Override
	public Map<String, Object> selectStudent() {
		
		int listCount = dao.getListCount();
		
		List<Professor> studentList = dao.selectStudent();
		
		List<Lecture> lectureList = dao.lectureList();
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("studentList", studentList);
		map.put("lectureList", lectureList);
		
		return map;
	}


	// 학생 조회 - 검색
	@Override
	public Map<String, Object> searchStudent(Map<String, Object> paramMap) {
		
		int listCount = dao.getListCount(paramMap);

		List<Professor> studentList = dao.searchStudent(paramMap);
		
		

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("studentList", studentList);
		
		return map;
	}


	// 학생 목록 전부 조회 - ajax
	@Override
	public List<Professor> selectMemberList() {
		return dao.selectMemberList();
	}

	// 검색 조건에 따른 학생 목록 조회 - ajax
	@Override
	public List<Professor> searchMemberList(Map<String, Object> paramMap) {
		return dao.searchMemberList(paramMap);
	}

	// 여러가지 선택 조건(학년, 학기, 학과, 과목)에 검색 된 학생 목록 성적 조회 비동기 AJAX
	@Override
	public List<Professor> searchMember(Map<String, Object> paramMap) {
		return dao.searchMember(paramMap);
	}

	// 비동기로 학과를 가져와서 학과 목록 select/option 목록 가져오기
	@Override
	public List<Professor> departmentList() {
		return dao.departmentList();
	}

	// 비동기로 과목을 가져와서 학과 목록 select/option 목록 가져오기
	@Override
	public List<Professor> classList() {
		return dao.classList();
	}

	@Override
	public int updateGrades(List<Map<String, Object>> gradesList) {
		return dao.updateGrades(gradesList);
	}
	
	// 과제 등록 페이지 이동 시 등록되어 있는 과제 조회
	@Override
	public Map<String, Object> selectTaskList(Member loginMember) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		List<Task> taskList = dao.selectTaskList(loginMember); // 등록된 과제 목록 조회
		
		List<Class> classList = dao.selectClassList(loginMember); // 교수 담당 과목 조회
		
		map.put("taskList", taskList);
		map.put("classList", classList);
		
		return map;
	}


}
