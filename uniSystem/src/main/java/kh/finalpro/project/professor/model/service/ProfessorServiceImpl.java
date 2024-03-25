package kh.finalpro.project.professor.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.Pagination;
import kh.finalpro.project.professor.model.dao.ProfessorDAO;
import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.professor.model.dto.Professor;

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


	// 학생 목록 전부 조회
	@Override
	public List<Professor> selectMemberList() {
		return dao.selectMemberList();
	}

}
