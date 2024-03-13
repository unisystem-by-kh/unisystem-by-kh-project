package kh.finalpro.project.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/student")
@Controller
public class StudentController {
	
	@GetMapping("/selectStudentList")
	public String selectStudentList() {
		return "student/selectStudentList";
	}
	
	@GetMapping("/selectStudentDetail")
	public String selectStudentDetail() {
		
		return "student/selectStudentDetail";
	}
	
}
