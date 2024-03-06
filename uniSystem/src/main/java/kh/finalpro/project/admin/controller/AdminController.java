package kh.finalpro.project.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@GetMapping("/subjectList")
	public String subjectList() {
		// 교과목 조회 페이지
		return "admin/subjectList";
	}

}
