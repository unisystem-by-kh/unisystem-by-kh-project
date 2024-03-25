package kh.finalpro.project.professor.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.finalpro.project.board.model.dto.Reply;
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
	
	// 성적 조회 페이지 이동
	@GetMapping("/professorPageStudentGrade")
	public String professorPageStudentGrade() {
		return "professor/professorPageStudentGrade";
	}
	
	
	
	// 학생 목록 성적 조회 비동기 AJAX
	@GetMapping(value="/selectMemberList" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Professor> selectMemberList(){
		return service.selectMemberList();
	}
	
	
	

	// 성적 수정
	@GetMapping("/professorPageStudentGradeUpdate")
	public String professorPageStudentGradeUpdate() {

		return "professor/professorPageStudentGradeUpdate";

	}

	// 성적 등록
	@GetMapping("/professorPageStudentGradeInsert")
	public String professorPageStudentGradeInsert() {

		return "professor/professorPageStudentGradeInsert";

	}
	
	// 과제 등록
	@GetMapping("/taskWrite")
	public String taskWrite() {
		return "professor/taskWrite";
	}
	
	// 과제 목록
	@GetMapping("/taskList")
	public String taskList() {
		return "professor/taskList";
	}

}
