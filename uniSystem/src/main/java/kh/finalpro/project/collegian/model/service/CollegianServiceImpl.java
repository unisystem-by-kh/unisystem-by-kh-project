package kh.finalpro.project.collegian.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.collegian.model.dao.CollegianDAO;
import kh.finalpro.project.collegian.model.dto.Member;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.collegian.model.dto.Department;

@Service
public class CollegianServiceImpl implements CollegianService{
	
	@Autowired
	private CollegianDAO dao;
	
	@Override
	public Map<String, Object> selectClassList(Member mem, int cp) {
		// 1. 특정 게시판의 삭제되지 않은 게시글 수 조회
		int listCount = dao.getListCount(mem);

		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨
		Pagination pagination = new Pagination(cp, listCount);

		// 3. 특정 게시판에서 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// (어떤 게시판(boardCode)에서
		// 몇 페이지(pagination.currentPage)에 대한 게시글 몇개(pagination.limit)조회
		List<Class> classList = dao.selectClassList(mem, pagination);
		
		List<Department> departmentList = dao.selectDepartmentList();

		// 4. pagination, boardList를 Map에 답아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("departmentList", departmentList);
		map.put("pagination", pagination);
		map.put("classList", classList);

		return map;
	}
	
	// 검색
	@Override
	public Map<String, Object> searchClassList(Map<String, Object> paramMap, int cp) {
		
		// 1. 특정 게시판의 삭제되지 않고 검색 조건이 일치하는 게시글 수 조회
		int listCount = dao.getListCount(paramMap);

		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Class> classList = dao.selectClassList(pagination, paramMap);
		
		List<Department> departmentList = dao.selectDepartmentList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("departmentList", departmentList);
		map.put("pagination", pagination);
		map.put("classList", classList);
		
		return map;
	}
	
	

}
