package kh.finalpro.project.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.main.model.service.MemberService;

@Controller
//@SessionAttributes({"loginMember"}) // 추후 사용 예정
public class MainController {
	
	@Autowired
	private MemberService service;
		
		// 로그인 / 메인페이지 이동
		@GetMapping("/")
		public String main() {
	
			 return "common/main"; // 메인페이지 확인
			
			// return "login"; // 로그인 페이지
		}
		
		
		
		
		
		// 회원가입 페이지 이동
		@GetMapping("/signUp")
		public String signUp(){
			return "common/signUp";
		}
		
		// 회원가입 진행
		@PostMapping("/signUp")
		public String signUp(Member inputMember
							
				) {
			
			
			int result = service.signUp(inputMember);
			
			System.out.println("Contoller : " + result);
			System.out.println("Contoller : " + inputMember);
			System.out.println("--------------------------------------------------------------------------");
			
			
			return "redirect:/";
		}
	
}
