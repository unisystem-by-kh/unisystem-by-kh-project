package kh.finalpro.project.collegian.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.finalpro.project.collegian.model.dao.CollegianDAO;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.collegian.model.dto.Request;
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
	public Map<String, Object> insertMyClass(String[] classNoList, Member mem) {
		
		int result = 0;
		
		List<String> success = new ArrayList<String>();
		List<String> fail = new ArrayList<String>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0; i < classNoList.length; i++) {
			
			
			map.put("classNo", classNoList[i]);
			
			map.put("memberNo", mem.getMemberNo());
			
			int checkNo = dao.checkClassMax(map); // 수강 정원 확인
			
			if(checkNo != 0) { // 수강 가능
				
				checkNo = dao.insertMyClass(map); // 수강 신청 결과
				
				if(checkNo > 0) {
					result += (i+1); // 성공 과목 몇 번째 항목인지
					success.add(dao.selectClassName(classNoList[i]));
				}
				
			}else { // 수강 불가능 정원 초과
				result += (i+1)*100; // 실패 과목 몇 번째 항목인지 구분
				fail.add(dao.selectClassName(classNoList[i]));
				
			}
			map.put("success", success);
			map.put("fail", fail);
			
		}
		return map;
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
	public Map<String,Object> selectTaskList(Member loginMember) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		List<Class> taskList = dao.selectTaskList(loginMember); // 과제 제출 과목 목록
		
		//List<Task> myTaskes = dao.selectMyTaskes(loginMember); // 제출한 과제 목록
		
		map.put("taskList", taskList);
		//map.put("myTaskes", myTaskes);
		
		return map;
	}
	
	// 과제물 제출
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertTask(Member loginMember, int taskNo, MultipartFile file, String webPath, String filePath) throws IllegalStateException, IOException {
		
		int result = 0;
		
		if(file.getSize() > 0) {
			Task task = new Task();
			
			task.setFilePath(webPath);
			task.setTaskNo(taskNo);
			
			String fileName = file.getOriginalFilename(); // 원본명
			
			task.setFileName(fileName);
			task.setFileRename(Util.fileRename(fileName));
			task.setMemberNo(loginMember.getMemberNo());
			
			
			result = dao.selectTask(task); // 제출한 과제물이 있는지 확인
			
			if(result == 0 ) { // 기존에 제출한 과제물이 없을 경우
				result = dao.insertTask(task);
			}else {
				// task.setFileNo(result); // 조회한 파일 넘버 가져옴
				result = dao.updateTask(task);
			}
			
			if(result > 0) {
				String rename = task.getFileRename();
				file.transferTo(new File(filePath +rename));
			}
			
		}
		
		return result;
	}
	
	// 학적 변동 신청 내역 조회
	@Override
	public List<Request> selectRequest(Request req) {
		return dao.selectRequest(req);
	}	
	
	// 학적 변동 신청
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertRequest(Request req) {
		return dao.insertRequest(req);
	}
	
	
	@Override
	public List<Lecture> selectScore(Member loginMember) {
		return dao.selectScore(loginMember);
	}
	
	@Override
	public int changeProfile(Member loginMember, MultipartFile file, String webPath, String filePath) throws IllegalStateException, IOException {
		
		int result = 0;

		if(file.getSize() > 0) {
			
			String fileName = file.getOriginalFilename(); // 원본명
			
			loginMember.setMemberProfile(webPath+fileName);
			
			result = dao.changeProfile(loginMember);
			
			if(result > 0) {
				file.transferTo(new File(filePath +fileName));
			}
		}else {
			result = dao.deleteProfile(loginMember);
		}
		
		return result;
		
	}
	
	@Override
	public int updateInfo(Member inputMember) {
		return dao.updateInfo(inputMember);
	}
	
	@Override
	public int insertRate(Map<String, Object> map) {
		return dao.insertRate(map);
	}
}
