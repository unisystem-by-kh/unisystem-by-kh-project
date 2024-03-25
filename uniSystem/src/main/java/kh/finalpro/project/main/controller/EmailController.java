package kh.finalpro.project.main.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.finalpro.project.main.model.service.EmailService;

@Controller
@RequestMapping("/sendEmail")
public class EmailController {
	
	@Autowired
	private EmailService service;
	
	@GetMapping("/findPw")
	@ResponseBody
	public int findPw(String email) {
		return service.findPw(email, "비밀번호 찾기");
	}
	
	// 회원가입시 이메일 인증
    @GetMapping("/signUp")
    @ResponseBody
    public Map<String, String> checkAuthKey(String email){
        return service.checkAuthKey(email, "인증번호 확인");
    }
    
    

}
