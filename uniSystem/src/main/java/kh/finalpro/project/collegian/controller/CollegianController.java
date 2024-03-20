package kh.finalpro.project.collegian.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.collegian.model.dto.Member;
import kh.finalpro.project.collegian.model.service.CollegianService;

@Controller
@RequestMapping("/collegian")
@SessionAttributes("loginMember")
public class CollegianController {

	@Autowired
	private CollegianService service;

	// 교과목 조회 페이지 전환
	@GetMapping("/classList")
	public String selectClassList(Model model, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam Map<String, Object> paramMap) {

		// 테스트

		int departmentNo = 10;
		int memberGrade = 1;
		int memberTerm = 1;
		// 까지

		Member mem = new Member();

		mem.setDepartmentNo(departmentNo);
		mem.setMemberGrade(memberGrade);
		mem.setMemberTerm(memberTerm);

		Map<String, Object> map = null;

		if (paramMap.get("query") != null) {
			paramMap.put("mem", mem);
			
			paramMap.put("query", ((String) paramMap.get("query")).toUpperCase()); // 검색어 대문자로 변환

			map = service.searchClassList(paramMap, cp);

		} else {
			map = service.selectClassList(mem, cp);
		}

		model.addAttribute("map", map);

		return "/collegian/classList";
	}

	// select 체크시 비동기 통신
	@PostMapping(value = "/selectClassList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> selectClassList(@RequestBody Map<String, Object> paramMap, 
											@RequestParam(value = "cp", required = false, defaultValue = "1") int cp) {
		return service.searchClassList(paramMap, cp);
	}
	

	// 수강신청 페이지 전환
	@GetMapping("/myClass")
	public String myClass(Model model, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			@RequestParam Map<String, Object> paramMap) {

		// 테스트

		int departmentNo = 10;
		int memberGrade = 1;
		int memberTerm = 1;
		// 까지

		Member mem = new Member();
		
		mem.setMemberNo("01-2412345");
		mem.setDepartmentNo(departmentNo);
		mem.setMemberGrade(memberGrade);
		mem.setMemberTerm(memberTerm);

		Map<String, Object> map = null;

		if (paramMap.get("query") != null) {
			paramMap.put("mem", mem);

			paramMap.put("query", ((String) paramMap.get("query")).toUpperCase()); // 검색어 대문자로 변환

			map = service.searchLecture(paramMap, cp);

		} else {
			map = service.selectLecture(mem, cp);
		}

		model.addAttribute("map", map);

		return "/collegian/myClass";
	}
	
	@PostMapping("/insertLecture")
	@ResponseBody
	public int insertMyClass(@RequestBody String classes) {
		
		String[] classNoList = classes.replace(" ","").split("\\s*/\\s*");
		
		System.out.println(Arrays.toString(classNoList));
		
		// 테스트

		int departmentNo = 10;
		int memberGrade = 1;
		int memberTerm = 1;
		// 까지

		Member mem = new Member();

		mem.setMemberNo("01-2412345");
		mem.setDepartmentNo(departmentNo);
		mem.setMemberGrade(memberGrade);
		mem.setMemberTerm(memberTerm);
		
		
		int result = service.insertMyClass(classNoList,mem);
		
		
		return result;
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
