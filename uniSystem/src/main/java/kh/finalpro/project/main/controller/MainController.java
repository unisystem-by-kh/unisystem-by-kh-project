package kh.finalpro.project.main.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

		//return "common/main"; // 메인페이지 확인

		return "login"; // 로그인 페이지
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
	
	@PostMapping("/login")
	public String login(Member inputMember
						,Model model
						,@RequestParam(value="saveId", required=false) String saveId
						,HttpServletResponse resp
						, RedirectAttributes ra) {
		
		Member loginMember = service.login(inputMember);
		
		String path = "";
		
		if(loginMember != null) {
			path += "common/main";
			
			model.addAttribute("loginMember", loginMember);
			
			Cookie c = new Cookie("saveId", loginMember.getMemberNo());
			
			if(c != null) {
				c.setMaxAge(60 * 60 * 24 * 30);
				
			}else {
				c.setMaxAge(0);
			}
			
			c.setPath("/");
			resp.addCookie(c);
			
		}else {
			path += "redirect:/";
		}
		
		
		return path;
	}
	

}
