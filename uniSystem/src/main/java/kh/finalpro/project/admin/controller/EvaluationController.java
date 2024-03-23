package kh.finalpro.project.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.admin.model.service.EvaluationService;
import kh.finalpro.project.main.model.dto.Member;

@SessionAttributes("loginMember")
@Controller
public class EvaluationController {
	
	@Autowired
	private EvaluationService service;
	
	@GetMapping("/late")
	public String lateList(
			  Model model
			, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp 
			, RedirectAttributes ra 
			, @SessionAttribute(value = "loginMember", required = false) Member loginMember ) {
		
		String memberNo = loginMember.getMemberNo().substring(0,2); // 교수면 02 | 교직원은 03
		
		// 평가 목록 전부 가져오기
		Map<String, Object> map = service.selectLateList(cp);
		
		model.addAttribute("map", map);
		
		
		return "/admin/subjectEvaluation";
	}

}
