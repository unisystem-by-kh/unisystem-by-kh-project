package kh.finalpro.project.main.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.admin.model.dto.Subject;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.main.model.service.MemberService;

@Controller
@SessionAttributes({"loginMember"})
public class MainController {

	@Autowired
	private MemberService service;

	// 첫화면 (로그인 페이지)
	@GetMapping("/")
	public String login() {

		return "login"; // 로그인 페이지
	}
	
	// 메인 페이지 이동
	@GetMapping("/main")
	public String main() {
		return "common/main";
	}

	// 회원가입 페이지 이동
	@GetMapping("/signUp")
	public String signUp(Model model){
		
		Map<String, Object> map = null;
		
		map = service.memberList();

		model.addAttribute("map", map);
		
		System.out.println(map);
		
		return "common/signUp";
	}

	// 회원가입 진행
	@PostMapping("/signUp")
	public String signUp(Member inputMember
						,RedirectAttributes ra
			) {
		
		int result = service.signUp(inputMember);

		String path = "redirect:";
		
		if(result > 0) { // 가입 성공
			path += "/"; // 로그인페이지로 이동
			ra.addFlashAttribute("message", "회원가입을 성공했습니다.");
			
		}else { //가입 실패
			path += "/member/signUp"; // 회원가입페이지로 이동
			ra.addFlashAttribute("message", "회원가입을 실패했습니다.");
		}
		
		return "redirect:/";
		
	}

	// 로그인
	@PostMapping("/login")
	public String login(Member inputMember
			,Model model
			,@RequestParam(value="saveId", required=false) String saveId
			,HttpServletResponse resp
			, RedirectAttributes ra) {

		Member loginMember = service.login(inputMember);

		String path = "";

		if(loginMember != null) {

			path += "redirect:main";

			model.addAttribute("loginMember", loginMember);

			Cookie c = new Cookie("saveId", loginMember.getMemberNo());

			if(saveId != null) {
				c.setMaxAge(60 * 60 * 24 * 30);

			}else {
				c.setMaxAge(0);
			}

			c.setPath("/");
			resp.addCookie(c);

		}else {
			path += "redirect:/";
			ra.addFlashAttribute("message", "학번 또는 비밀번호가 일치하지 않습니다.");
		}


		return path;
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {

		status.setComplete();

		return "redirect:/";

	}

	// 아이디 찾기
	@GetMapping(value = "/findMemberId", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String findMemberId(Member inputMember) {
		return service.findMemberId(inputMember);
	}

	// 비밀번호 찾기
	@PostMapping(value = "/findMemberPw", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String findMemberPw(@RequestBody Member inputMember) {
		return service.findMemberPw(inputMember);
	}

	


}
