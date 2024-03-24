package kh.finalpro.project.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.finalpro.project.main.model.service.AjaxService;

@Controller
public class AjaxController {
	
	@Autowired
	private AjaxService service;
	
	// 이메일 중복 검사
	@GetMapping("/dupCheck/email")
	@ResponseBody
	public int checkEmail (String email) {
		return service.checkEmail(email);
	}
	
	
	
	

}
