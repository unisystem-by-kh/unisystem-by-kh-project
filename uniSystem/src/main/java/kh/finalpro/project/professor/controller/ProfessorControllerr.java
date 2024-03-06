package kh.finalpro.project.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/professor")
@Controller
public class ProfessorControllerr {

	// 학생 조회 페이지
	@GetMapping("/professorPageStudentSearch")
	public String professorPageStudentSearch() {

		return "professor/professorPageStudentSearch";
		
	}
	
	
	// 성적 조회
	@GetMapping("/professorPageStudentGrade")
	public String professorPageStudentGrade() {

		return "professor/professorPageStudentGrade";

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

}
