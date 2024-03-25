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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.main.model.dto.Member;
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
			@RequestParam Map<String, Object> paramMap
			,@SessionAttribute(value="loginMember", required = false) Member loginMember) {


		Member mem = loginMember;

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
	public String myClass(Model model, @RequestParam Map<String, Object> paramMap
			,@SessionAttribute(value="loginMember", required = false) Member loginMember) {

		Member mem = loginMember;
		
//		mem.setMemberNo("01-2412345");
//		mem.setDepartmentNo(departmentNo);
//		mem.setMemberGrade(memberGrade);
//		mem.setMemberTerm(memberTerm);

		Map<String, Object> map = null;

		if (paramMap.get("query") != null) {
			paramMap.put("mem", mem);

			paramMap.put("query", ((String) paramMap.get("query")).toUpperCase()); // 검색어 대문자로 변환

			map = service.searchLecture(paramMap);

		} else {
			map = service.selectLecture(mem);
		}
		
		// 수강 신청 내역 조회
		List<Class> myClassList = service.selectMyClasses(mem);
		
		//System.out.println("수강 신청 내역"+myClassList);
		
		map.put("myClassList", myClassList);

		model.addAttribute("map", map);

		return "/collegian/myClass";
	}
	
	// 수강 신청 비동기
	@PostMapping("/insertLecture")
	@ResponseBody
	public int insertMyClass(@RequestBody Map<String, Object> paramMap) {
		
		String classes = (String) paramMap.get("classes");
		
		String[] classNoList = classes.replace(" ","").split("\\s*/\\s*");
		
		// System.out.println(Arrays.toString(classNoList));
		
		Member mem = new Member();

		mem.setMemberNo((String)paramMap.get("memberNo"));
		
		int result = service.insertMyClass(classNoList,mem);
		
		return result;
		
	}
	
	// 수강 과목 삭제 비동기
	@PostMapping(value="/deleteLecture" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int deleteMyClass(@RequestBody Map<String, Object> paramMap) {
		
//		System.out.println("연결");
//		
//		String classNo = (String) paramMap.get("classNo");
//		
//		int memberNo = (int) paramMap.get("memberNo");
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("classNo", classNo);
//		map.put("memberNo", memberNo);
		
		int result = service.deleteMyClass(paramMap);
		
		return result;
	}
	
	

	// 시간표 페이지 전환
	@GetMapping("/schedule")
	public String schedule(Model model
			,@SessionAttribute(value="loginMember", required = false) Member loginMember) {
		
		Map<String,Object> map = new HashMap<String, Object>();
				
		// 수강 신청 내역 조회
		List<Class> myClassList = service.selectMyClasses(loginMember);
		
		map.put("myClassList", myClassList);

		model.addAttribute("map", map);
		
		return "/collegian/schedule";
	}

	// 과제물 페이지 전환
	@RequestMapping("task")
	public String task() {

		return "/collegian/task";
	}

}
