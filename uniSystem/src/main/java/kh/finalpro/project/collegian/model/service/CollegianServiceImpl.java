package kh.finalpro.project.collegian.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		// 1. 사용자 교과목 수 조회
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
		
		// 1. 검색 조건이 일치하는 교과목 수 조회
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
	
	// 수강 신청 검색
	@Override
	public Map<String, Object> searchLecture(Map<String, Object> paramMap, int cp) {
		// 1. 검색 조건이 일치하는 교과목 수 조회
		int listCount = dao.getListCount(paramMap);

		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨
		Pagination pagination = new Pagination(cp, listCount);

		List<Class> lecture = dao.searchLecture(pagination, paramMap);

		List<Department> departmentList = dao.selectDepartmentList();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("departmentList", departmentList);
		map.put("pagination", pagination);
		map.put("lecture", lecture);

		return map;
	}

	// 수강 신청 조회
	@Override
	public Map<String, Object> selectLecture(Member mem, int cp) {
		// 1. 사용자 교과목 수 조회
		int listCount = dao.getListCount(mem);

		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨
		Pagination pagination = new Pagination(cp, listCount);

		// 3. 특정 게시판에서 현재 페이지에 해당하는 부분에 대한 게시글 목록 조회
		// (어떤 게시판(boardCode)에서
		// 몇 페이지(pagination.currentPage)에 대한 게시글 몇개(pagination.limit)조회
		List<Class> lecture = dao.selectLecture(mem, pagination);

		List<Department> departmentList = dao.selectDepartmentList();

		// 4. pagination, boardList를 Map에 답아서 반환
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("departmentList", departmentList);
		map.put("pagination", pagination);
		map.put("lecture", lecture);

		return map;
	}
	
	
	
	// 수강신청 서비스
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMyClass(String[] classNoList, Member mem) {
		
		int result = 0;
		
		for(int i=0; i < classNoList.length; i++) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("classNo", classNoList[i]);
			
			map.put("mem", mem);
			
			result += dao.insertMyClass(map);
			
		}
		
		return result;
	}
	
	@Override
	public List<Class> selectMyClasses(Member mem) {
		
		return dao.selectMyClasses(mem);
	}
	
	

}
