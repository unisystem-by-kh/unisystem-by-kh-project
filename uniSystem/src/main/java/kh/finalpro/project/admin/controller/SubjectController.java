package kh.finalpro.project.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.admin.model.dto.Subject;
import kh.finalpro.project.admin.model.service.SubjectService;

@Controller
@RequestMapping("/staff")
public class SubjectController {
	
	@Autowired
	private SubjectService service;
	
	// 교과목 조회 페이지
	@GetMapping("/subjectList")
	public String subjectList() {
		return "admin/subjectList";
	}
	
	// 교과목 등록 페이지
	@GetMapping("/insert")
	public String insertSubject() {
		return "admin/insertSubject";
	}
	
	@PostMapping(value = "/insert", produces = "application/json; charset=UTF-8")
	public String insertSubject(Subject inputClass
								, @RequestHeader(value="referer") String referer
								, RedirectAttributes ra) {
		
		int result = service.insertSubject(inputClass);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			path += "subjectList";
			message = "등록되었습니다.";
		}else {
			path += referer;
			message = "등록 실패ㅠㅠ";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}

}
