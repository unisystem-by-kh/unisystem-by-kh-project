package kh.finalpro.project.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalpro.project.admin.model.dao.SubjectDAO;
import kh.finalpro.project.admin.model.dto.Subject;
import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.collegian.model.dto.Department;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.main.model.dto.Member;

@Service
public class SubjectServiceImpl implements SubjectService{

	@Autowired
	private SubjectDAO dao;

	// 교과목 등록
	@Override
	@Transactional
	public int insertSubject(Subject inputClass) {

		// 담당교수 번호 가져오기
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberName", inputClass.getMemberName());
		map.put("departmentNo", inputClass.getDepartmentNo());

		String memberNo = dao.selectProfessor(map);

		if(memberNo != null) {
			inputClass.setMemeberNo(memberNo);
		}

		return dao.insertSubject(inputClass);
	}

	// 학과코드 호출 서비스
	@Override
	public List<Map<String, Object>> selectDeptCodeList() {
		return dao.selectDeptCodeList();
	}

	// 담당 교수 목록 조회 서비스
	@Override
	public List<Member> searchProfessor(String deptCode) {
		return dao.searchProfessor(deptCode);
	}

	// 교수 강의 시간 조회 서비스
	@Override
	public int timeCheck(Map<String, Object> map) {
		return dao.timeCheck(map);
	}

	// 교과목 목록 조회
	@Override
	public Map<String, Object> selectSubjectList(int cp) {
		
		// 1. 모든 교과목 수 조회
		int listCount = dao.getListCount();

		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨
		Pagination pagination = new Pagination(cp, listCount);

		// 3. 교과목 목록 조회
		// 몇 페이지(pagination.currentPage)에 대한 교과목 몇개(pagination.limit)조회
		List<Subject> subjectList = dao.selectSubjectList(pagination);

		
		// 4. pagination, boardList를 Map에 답아서 반환
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pagination", pagination);
		map.put("subjectList", subjectList);

		return map;
	}
	
	// 교과목 목록 조회 검색어(O)
	@Override
	public Map<String, Object> selectSubjectList(Map<String, Object> paramMap, int cp) {
		
		paramMap.put("query", ((String) paramMap.get("query")).toUpperCase());
		
		int listCount = dao.getListCount(paramMap);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Subject> subjectList = dao.selectSubjectList(paramMap, pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("pagination", pagination);
		map.put("subjectList", subjectList);
		
		return map;
	}
	
	// 교과목 수정 서비스
	@Override
	@Transactional
	public int updateSubject(Subject inputClass) {
		
		// 담당교수 번호 가져오기
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("memberName", inputClass.getMemberName());
		map.put("departmentNo", inputClass.getDepartmentNo());

		String memberNo = dao.selectProfessor(map);

		if(memberNo != null) inputClass.setMemeberNo(memberNo);
		
		return dao.updateSubject(inputClass);
	}
	
	// 교과목 삭제
	@Override
	@Transactional
	public int deleteSubject(int classNo) {
		return dao.deleteSubject(classNo);
	}


}
