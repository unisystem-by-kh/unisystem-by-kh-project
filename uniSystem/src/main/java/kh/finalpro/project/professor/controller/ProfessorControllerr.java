package kh.finalpro.project.professor.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.board.model.dto.Reply;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.professor.model.dto.Professor;
import kh.finalpro.project.professor.model.dto.Task;
import kh.finalpro.project.professor.model.service.ProfessorService;

@SessionAttributes({"loginMember"})
@RequestMapping("/professor")
@Controller
public class ProfessorControllerr {
	
	@Autowired
	private ProfessorService service;

	// 학생 조회 페이지 이동
	@GetMapping("/professorPageStudentSearch")
	public String professorPageStudentSearch(
				Model model,
				@RequestParam Map<String, Object> paramMap
			) {
		
		// 조건 활용으로 인하여 map null 값 우선 선언
		Map<String, Object> map = null;
		
		if(paramMap.get("key") == null) {

			map = service.selectStudent();

			model.addAttribute("map" , map);

		}else { // 검색어가 있을 때 (검색 O)

			map = service.searchStudent(paramMap);

			model.addAttribute("map" , map);
		}
		
		model.addAttribute("map" , map);
		
		return "professor/professorPageStudentSearch";
		
	}
	
	// 성적 관리 페이지 이동
	@GetMapping("/professorPageStudentGrade")
	public String professorPageStudentGrade() {
		return "professor/professorPageStudentGrade";
	}
	
	// 증명서 조회 페이지 이동
	@GetMapping("/professorPageCertificate")
	public String professorPageCertificate(
			) {
		return "professor/professorPageCertificate";
	}
	
	
	// 학생 조회에서 엑셀로 저장
	@GetMapping(value="/excel/download" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public void excelDownload(
				HttpServletResponse resp
				,@RequestParam Map<String, Object> paramMap
				,@SessionAttribute(value="loginMember", required = false) Member loginMember
//				,Model model
			)throws IOException {
		
//      Workbook wb = new HSSFWorkbook(); // xls 파일
		Workbook wb = new XSSFWorkbook(); // xlsx 파일
		
		Sheet sheet = wb.createSheet("학생 목록");
		
        Row row = null;
        Cell cell = null;
        int rowNum = 0;
        
        // 먼저 엑셀 멘 위에 제목 넣기
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("학번");
        cell = row.createCell(1);
        cell.setCellValue("학과");
        cell = row.createCell(2);
        cell.setCellValue("이름");
        cell = row.createCell(3);
        cell.setCellValue("나이");
        cell = row.createCell(4);
        cell.setCellValue("학년");
        cell = row.createCell(5);
        cell.setCellValue("학기");
        cell = row.createCell(6);
        cell.setCellValue("입학년도");
        cell = row.createCell(7);
        cell.setCellValue("생년월일");
        cell = row.createCell(8);
        cell.setCellValue("이메일");
        cell = row.createCell(9);
        cell.setCellValue("전화번호");
        cell = row.createCell(10);
        cell.setCellValue("학적상태");
        
//		System.out.println("paramMap ::: "+paramMap);

	    // 검색된 결과만을 가져오도록 수정
	    Map<String, Object> map = null;
	    if(paramMap.get("key") == null) {
	        map = service.selectStudent();
	    }else {
	        map = service.searchStudent(paramMap);
	    }
		
		List<Member> list = (List<Member>) map.get("studentList");
		
		for(Member listStudent : list) {
			
			if(listStudent.getDepartmentNo() == loginMember.getDepartmentNo()) {
				
				String studentNo = listStudent.getMemberNo(); // 0
				String studentDepartmentName = listStudent.getDepartmentName(); // 1
				String studentName = listStudent.getMemberName(); // 2
				String studentAge = listStudent.getMemberAge(); // 3
				String studentGrade = listStudent.getMemberGrade(); // 4
				String studentTerm = listStudent.getMemberTerm(); // 5
				String studentDate = listStudent.getMemberDate(); // 6
				String studentSsn = listStudent.getMemberSsn(); // 7
				String studentEmail = listStudent.getMemberEmail(); // 8
				String studentPhone = listStudent.getMemberPhone(); // 9
				String studentStatus = listStudent.getMemberStatus(); // 10
				
	            row = sheet.createRow(rowNum++);
	            cell = row.createCell(0);
	            cell.setCellValue(studentNo);
	            cell = row.createCell(1);
	            cell.setCellValue(studentDepartmentName);
	            cell = row.createCell(2);
	            cell.setCellValue(studentName);
	            cell = row.createCell(3);
	            cell.setCellValue(studentAge);
	            cell = row.createCell(4);
	            cell.setCellValue(studentGrade);
	            cell = row.createCell(5);
	            cell.setCellValue(studentTerm);
	            cell = row.createCell(6);
	            cell.setCellValue(studentDate.substring(0, 4) + "년");
	            cell = row.createCell(7);
	            if(studentSsn.substring(7,8).equals("1") || studentSsn.substring(8,8).equals("3")) {
	            	cell.setCellValue(studentSsn.substring(0,2) + "년" + studentSsn.substring(2,4) + "월" + studentSsn.substring(4,6) + "일(남)");
	            }else if(studentSsn.substring(7,8).equals("2") || studentSsn.substring(8,8).equals("4")) {
	            	cell.setCellValue(studentSsn.substring(0,2) + "년" + studentSsn.substring(2,4) + "월" + studentSsn.substring(4,6) + "일(여)");
	            }
	            cell = row.createCell(8);
	            cell.setCellValue(studentEmail);
	            cell = row.createCell(9);
	            cell.setCellValue(studentPhone);
	            cell = row.createCell(10);
	            if(studentStatus.equals("N")) {
	            	cell.setCellValue("재학중");
	            }else if(studentStatus.equals("Y")) {
	            	cell.setCellValue("휴학중");
	            }else if(studentStatus.equals("P")) {
	            	cell.setCellValue("졸업");
	            }else if(studentStatus.equals("D")) {
	            	cell.setCellValue("중퇴");
	            }
	            
			}
			
		}

	    // 엑셀 타입으로 변환
        resp.setContentType("ms-vnd/excel");
//      response.setHeader("Content-Disposition", "attachment;filename=example.xls"); // xls 파일
        resp.setHeader("Content-Disposition", "attachment;filename=example.xlsx"); // xlsx 파일
		
        // 파일 내보내주고 닫기
        wb.write(resp.getOutputStream());
        wb.close();
        
	}
	
	
	
	
	// 학생 목록 성적 조회 비동기 AJAX
	@GetMapping(value="/selectMemberList" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Professor> selectMemberList(){
		return service.selectMemberList();
	}
	
	// 조건에 검색 된 학생 목록 성적 조회 비동기 AJAX
	@GetMapping(value="/searchMemberList" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Professor> searchMemberList(@RequestParam Map<String, Object> paramMap){
		return service.searchMemberList(paramMap);
	}
	
	// 여러가지 선택 조건(학년, 학기, 학과, 과목)에 검색 된 학생 목록 성적 조회 비동기 AJAX
	@GetMapping(value="/searchMember" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Professor> searchMember(@RequestParam Map<String, Object> paramMap){
		return service.searchMember(paramMap);
	}
	
	// 비동기로 학과를 가져와서 학과 목록 select/option 목록 가져오기
	@GetMapping(value="/departmentList" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Professor> departmentList(){
//		System.out.println("Controller : " + paramMap);
		return service.departmentList();
	}
	
	// 비동기로 과목을 가져와서 학과 목록 select/option 목록 가져오기
	@GetMapping(value="/classList" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Professor> classList(){
		return service.classList();
	}
	
	
	// 비동기로 모든 학생 성적 수정/삽입
	@PostMapping(value="/updateGrades", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public int updateGrades(@RequestBody Map<String, Object> updatedGrades) {
		
		List<Map<String, Object>> gradesList = (List<Map<String, Object>>) updatedGrades.get("updatedGrades");
		
		// 이거 필요 없을지도?
		for (Map<String, Object> gradeMap : gradesList) {
			
		    String memberNo = (String)gradeMap.get("memberNo");
		    String lectureGrade = (String)gradeMap.get("lectureGrade");
		    String lectureTerm = (String)gradeMap.get("lectureTerm");
		    String classNo = (String)gradeMap.get("classNo");
		    String lecturePoint = (String)gradeMap.get("lecturePoint");

		}
		
        return service.updateGrades(gradesList);
    }
	
	/*
	 * // 성적 수정
	 * 
	 * @GetMapping("/professorPageStudentGradeUpdate") public String
	 * professorPageStudentGradeUpdate() {
	 * 
	 * return "professor/professorPageStudentGradeUpdate";
	 * 
	 * }
	 * 
	 * // 성적 등록
	 * 
	 * @GetMapping("/professorPageStudentGradeInsert") public String
	 * professorPageStudentGradeInsert() {
	 * 
	 * return "professor/professorPageStudentGradeInsert";
	 * 
	 * }
	 */	

	
	
	// 과제 조회, 등록 페이지 이동
	@GetMapping("/taskWrite")
	public String taskWrite(
			Model model
			,@SessionAttribute(value="loginMember", required = false) Member loginMember) {
		
		Map<String, Object> map = service.selectTaskList(loginMember);
		model.addAttribute("map",map);
		
		return "professor/taskWrite";
	}
	
	// 과제 등록
	@PostMapping(value="/taskWrite", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int taskWrite(
//			@RequestParam(value="file", required = false) List<MultipartFile> file
			@SessionAttribute(value="loginMember") Member loginMember
			, RedirectAttributes ra
			, HttpSession session
			, @RequestBody List<Task> insertTask)throws IllegalStateException, IOException {
		
		//System.out.println(insertTask);
		
		int result = service.insertTask(loginMember, insertTask);
		String message;
		if(result > 0) {
			message = "과제가 등록되었습니다.";
		}else {
			message = "과제 등록 실패.";
		}

		ra.addFlashAttribute("message",message);
		
		return result;
	}
	
	// 과제 파일 등록
	@PostMapping(value="/uploadTask", produces = "application/json; charset=UTF-8")
	public String uploadTask(
			@RequestParam(value="file", required = false) List<MultipartFile> files
			, @SessionAttribute(value="loginMember") Member loginMember
			, HttpSession session
			, @RequestParam(value="dept") String[] classNo
			, RedirectAttributes ra)throws Exception {
		
		String webPath = "/resources/files/task/";
		String filePath = session.getServletContext().getRealPath(webPath); // 서버의 진짜 주소를 가져와라
		
		int result = service.uploadTask(files, webPath, filePath, classNo, loginMember); 
		
		String message = null;
		String path = "redirect:";
		if(result > 0) { // 성공 시
			message = "과제 파일이 등록되었습니다.";
			path += "/professor/taskWrite";
		}else {
			message = "과제 파일 업로드 실패";
			path += "/professor/taskWrite";
		}
		
		ra.addFlashAttribute("message" , message);
		
		return path;
		
	}
	
	// 등록된 과제 삭제
	@PutMapping("/taskDelete")
	@ResponseBody
	public int taskDelete(@RequestBody int taskNo) {
		
		int result = service.taskDelete(taskNo);
		
		return result;
	}
	
	// 제출된 과제 목록 페이지 이동
	@GetMapping("/taskList")
	public String taskList(Model model
			,@SessionAttribute(value="loginMember", required = false) Member loginMember) {
		
		return "professor/taskList";
	}
	
	
	
	
	
}
