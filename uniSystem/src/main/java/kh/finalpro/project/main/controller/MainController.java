package kh.finalpro.project.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

		@RequestMapping("/")
		public String main() {
	
			return "common/main"; // 메인페이지 확인
			
//			return "login"; // 로그인 페이지
		}
	
}
