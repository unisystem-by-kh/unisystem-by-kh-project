package kh.finalpro.project.tuition.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.tuition.model.dto.Tuition;
import kh.finalpro.project.tuition.model.service.TuitionService;

@SessionAttributes({"loginMember"})
@Controller
public class TuitionController {
	
	@Autowired
	private TuitionService service;
	
	// 등록금 
	@RequestMapping("/tuition")
	public String tuition(
			@SessionAttribute(value="loginMember", required = false) Member loginMember,
			Model model
			) {
		
		
		int result = service.tuition(loginMember.getMemberNo());
		
		model.addAttribute("result", result);
		
		return "tuition/tuition";
	}
	
	// 등록금 결제 후 인서트
	@ResponseBody
	@PostMapping("/tuition/insert")
	public int tuitionInsert(@RequestBody Tuition tuition) {
		System.out.println(tuition);
		return service.tuitionInsert(tuition);
	}
	

}
