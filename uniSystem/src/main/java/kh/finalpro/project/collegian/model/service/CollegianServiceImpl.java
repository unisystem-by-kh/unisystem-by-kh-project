package kh.finalpro.project.collegian.model.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.finalpro.project.collegian.model.dao.CollegianDAO;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.collegian.model.dto.Task;
import kh.finalpro.project.common.util.Util;
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
	public Map<String, Object> searchLecture(Map<String, Object> paramMap) {
		// 1. 검색 조건이 일치하는 교과목 수 조회
		//int listCount = dao.getListCount(paramMap);

		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		//Pagination pagination = new Pagination(cp, listCount);

		List<Class> lecture = dao.searchLecture(paramMap);

		List<Department> departmentList = dao.selectDepartmentList();

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("departmentList", departmentList);
		map.put("lecture", lecture);

		return map;
	}

	// 수강 신청 조회
	@Override
	public Map<String, Object> selectLecture(Member mem) {
		// 1. 사용자 교과목 수 조회
		//int listCount = dao.getListCount(mem);

		// 2. 1번 조회 결과 + cp를 이용해서 pagination 객체 생성
		// -> 내부 필드가 모두 계산되어 초기화됨
		//Pagination pagination = new Pagination(listCount);

		
		List<Class> lecture = dao.selectLecture(mem);

		List<Department> departmentList = dao.selectDepartmentList();

		// 4. pagination, boardList를 Map에 답아서 반환
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("departmentList", departmentList);
		map.put("lecture", lecture);

		return map;
	}
	
	
	
	// 수강 신청 서비스
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertMyClass(String[] classNoList, Member mem) {
		
		int result = 0;
		
		for(int i=0; i < classNoList.length; i++) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("classNo", classNoList[i]);
			
			map.put("memberNo", mem.getMemberNo());
			
			int checkNo = dao.checkClassMax(map); // 수강 정원 확인
			
			if(checkNo != 0) { // 수강 가능
				
				checkNo = dao.insertMyClass(map); // 수강 신청 결과
				
				if(checkNo > 0) {
					result += (i+1); // 성공 과목 몇 번째 항목인지
				}
				
			}else { // 수강 불가능
				result += (i+1)*100; // 실패 과목 몇 번째 항목인지 구분
			}
			
		}
		return result;
	}
	
	// 수강 신청 내역 조회 
	@Override
	public List<Class> selectMyClasses(Member mem) {
		return dao.selectMyClasses(mem);
	}
	
	@Transactional(rollbackFor = Exception.class)
	// 수강 신청 내역 삭제
	@Override
	public int deleteMyClass(Map<String, Object> map) {
		return dao.deleteMyClass(map);
	}
	
	
	// 과제물 조회
	@Override
	public List<Class> selectTaskList(Member loginMember) {
		return dao.selectTaskList(loginMember);
	}
	
	// 과제물 제출
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertTask(Member loginMember, int taskNo, List<MultipartFile> file, String webPath, String filePath) throws IllegalStateException, IOException {
		
		int result = 0;
		
		if(file.get(0).getSize() > 0) {
			Task task = new Task();
			
			task.setFilePath(webPath);
			task.setTaskNo(taskNo);
			
			String fileName = file.get(0).getOriginalFilename(); // 원본명
			
			task.setFileName(fileName);
			task.setFileRename(Util.fileRename(fileName));
			task.setMemberNo(loginMember.getMemberNo());
			
			result = dao.insertTask(task);
			
			if(result > 0) {
				
				System.out.println(result);
				
				String rename = task.getFileRename();
				
				file.get(0).transferTo(new File(filePath +rename));
			}
			
			
		}
		
		
		return result;
	}

}
