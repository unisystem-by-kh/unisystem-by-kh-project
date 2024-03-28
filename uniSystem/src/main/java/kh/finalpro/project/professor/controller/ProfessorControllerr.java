package kh.finalpro.project.professor.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.finalpro.project.board.model.dto.Reply;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.professor.model.dto.Professor;
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
//				@PathVariable("memberNo") int memberNo
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

	
	
	// 과제 목록
	@GetMapping("/taskList")
	public String taskList() {
		
		return "professor/taskList";
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 과제 등록
	@GetMapping("/taskWrite")
	public String taskWrite() {
		return "professor/taskWrite";
	}
	
	
	
	
	
	
}
