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

@Service
public class ProfessorServiceImpl implements ProfessorService{

	@Autowired
	private ProfessorDAO dao;
	
	
	// 학생 조회
	@Override
	public Map<String, Object> selectStudent() {
		
		int listCount = dao.getListCount();
		
		List<ProfessorDAO> studentList = dao.selectStudent();
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("studentList", studentList);
		
		System.out.println("DAO : listCount : " + listCount);
		System.out.println("DAO : studentList : " + studentList);
		
		return map;
	}


	// 학생 조회 - 검색
	@Override
	public Map<String, Object> searchStudent(Map<String, Object> paramMap) {
		
		int listCount = dao.getListCount(paramMap);

		List<ProfessorDAO> studentList = dao.searchStudent(paramMap);

		// 4. pagination, boardList를 Map에 답아서 반환
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("studentList", studentList);
		
		System.out.println("DAO : listCount : SEARCH : " + listCount);
		System.out.println("DAO : studentList : SEARCH : " + studentList);

		return map;
	}

}
