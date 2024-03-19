package kh.finalpro.project.collegian.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/collegian")
@SessionAttributes("loginMemeber")
public class CollegianController {
	
	// 교과목 조회 페이지 전환
	@RequestMapping("/classList")
	public String selectClassList () {
		
		return "/collegian/classList";
	}
	
	// 수강신청 페이지 전환
	@RequestMapping("/myClass")
	public String myClass() {
		
		return "/collegian/myClass";
	}
	
	// 시간표 페이지 전환
	@RequestMapping("/schedule")
	public String schedule() {

		return "/collegian/schedule";
	}
	
	// 과제물 페이지 전환
	@RequestMapping("task")
	public String task() {
		
		return "/collegian/task";
	}
	
}
