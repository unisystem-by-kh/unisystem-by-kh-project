package kh.finalpro.project.professor.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.Pagination;
import kh.finalpro.project.board.model.exception.FileUploadException;
import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.common.util.Util;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dao.ProfessorDAO;
import kh.finalpro.project.professor.model.dto.Files;
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

	// 과제 등록
	@Override
	public int insertTask(Member loginMember, List<Task> insertTask) {

//		String webPath = "/resources/files/task/";
//		
//		List<Files> file =  new ArrayList<Files>();
//		
//		for(int i=0; i<insertTask.size(); i++) {
//			
//		}
		int result = 0;
		for(int i=0; i<insertTask.size(); i++) {
			result += dao.insertTask(insertTask.get(i), loginMember);
		}
		
		return result;
	}

	// 과제 파일 등록
	@Override
	public int uploadTask(List<MultipartFile> files, String webPath, String filePath, String[] classNo, Member loginMember) throws IllegalStateException, IOException {
		
		List<Task> uploadList = new ArrayList<Task>();
		
		for(int i = 0; i < files.size(); i++) {
			// i번째 요소에 업로드한 파일이 있다면
			if(files.get(i).getSize() > 0) {
				
				Task file = new Task();
				file.setFilePath(webPath); // 웹 접근 경로
				
				// 파일 원본명
				String fileName = files.get(i).getOriginalFilename();
				
				file.setFileName(fileName); // 원본명
				file.setFileRename(Util.fileRename(fileName)); // 변경명
		
				// uploadList == 업로드할 이미지 정보가 담겨있음
				uploadList.add(file);
				
			}
			
		} // 븐류 for문 종료
		
		int result = 0;
		if(!uploadList.isEmpty()) {
			
			
			for(int i=0; i<uploadList.size(); i++) {
				uploadList.get(i).setClassNo(classNo[i]);
				uploadList.get(i).setMemberNo(loginMember.getMemberNo());
				
				result += dao.uploadTask(uploadList.get(i));
			}
			
			
			
			if(result == uploadList.size()) {
				
				System.out.println(uploadList.size()); // 확인용
				for(int i = 0; i < uploadList.size(); i++) {
					
					// 파일로 변환
					String rename = uploadList.get(i).getFileRename();
					
					files.get(i).transferTo(new File(filePath + rename));
				}
				
				
			}else { // 일부 또는 전체 insert 실패
				
				// ** 웹 서비스 수행 중 1개라도 실패하면 전체 실패 **
				// -> rollback 필요
				
				// [결론]
				// 예외를 강제로 발생 시켜서 rollback 해야한다.
				// -> 사용자 정의 예외 생성
				throw new FileUploadException(); // 예외 강제 발생
				
			}
			
		}
		
		return result;
	}


	// 등록된 과제 삭제
	@Override
	public int taskDelete(int taskNo) {
		
		int result = 0;
		
		result += dao.taskListDelete(taskNo);
		
		if(result > 0) {
			result += dao.taskFileDelete(taskNo);
		}
		
		return result;
	}
	
	
	
	
	


}
