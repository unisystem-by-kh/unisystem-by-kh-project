package kh.finalpro.project.tuition.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.tuition.model.service.TuitionService;

@SessionAttributes({"loginMember"})
@Controller
public class TuitionController {
	
	@Autowired
	private TuitionService service;
	
	// 등록금 
	@RequestMapping("/tuition")
	public String tuition(
			Model model,
			RedirectAttributes ra,
			@SessionAttribute(value="loginMember", required = false) Member loginMember,
			HttpServletRequest req,
			HttpServletResponse resp) {
		
		
		
		
		
		return "tuition/tuition";
	}
	

}
