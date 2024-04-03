package kh.finalpro.project.collegian.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.collegian.model.dto.Request;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Lecture;
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
	
	// 수강 신청 페이지 비동기 띄우기
	
	@PostMapping("/myClass")
	@ResponseBody
	public Map<String, Object> selectMyClass(@RequestBody Map<String, Object> paramMap) {
		return service.searchLecture(paramMap);
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
	@GetMapping("task")
	public String task(Model model
			,@SessionAttribute(value="loginMember", required = false) Member loginMember) {
		
		
		Map<String,Object> map = service.selectTaskList(loginMember);
		
		model.addAttribute("map",map);

		return "/collegian/task";
	}
	
	
	@PostMapping("/insertTask")
	public String insertTask(Model model,
				@RequestParam(value="taskFile", required =false) MultipartFile file,
				@SessionAttribute(value="loginMember") Member loginMember
				,@RequestParam(value="taskNo", required = false) int taskNo
				, RedirectAttributes ra
				, HttpSession session)throws IllegalStateException, IOException {
		
		String webPath = "/resources/files/task/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int result = service.insertTask(loginMember,taskNo,file,webPath,filePath);
		
		if(result > 0) {
			
			Map<String,Object> map = service.selectTaskList(loginMember);
			
			model.addAttribute("map",map);
			
		}else { // 과제 제출 실패
			
		}
		
		return "redirect:/collegian/task";
	}
	
	// 학적 변동 신청 페이지 전환
	@GetMapping("/change")
	public String changeState( Model model
			,@SessionAttribute(value="loginMember") Member loginMember
			) {
		
		Request req = new Request();
		
		req.setMemberNo(loginMember.getMemberNo());
		
		List<Request> reqList = service.selectRequest(req);
		
		model.addAttribute("reqList",reqList);
		
		return "/collegian/change";
	}
	
	// 학적 변동 신청
	@PostMapping("/insertState")
	public String insertRequest( Model model
			,@SessionAttribute(value="loginMember") Member loginMember
			,String content
			,char st
			) {
		
		Request req = new Request();
		
		req.setMemberNo(loginMember.getMemberNo());
		req.setReqType(st+"");
		req.setReqReason(content);
		
		int result = service.insertRequest(req);
		
		if(result > 0) {
			List<Request> reqList = service.selectRequest(req);
			
			model.addAttribute("reqList",reqList);
		}
		
		return "redirect:/collegian/change";
	}
	
	// 학점 조회 페이지 전환
	@GetMapping("/score")
	public String selectScore(Model model
			,@SessionAttribute(value="loginMember") Member loginMember) {
		
		
		List<Lecture> score = service.selectScore(loginMember);
		
		
		model.addAttribute("score",score);
		
		
		return "/collegian/scorePage";
	}
	
	// 개인 정보 수정 페이지 전환
	@GetMapping("/info")
	public String myInfo(Model model
			,@SessionAttribute(value="loginMember") Member loginMember
			
			) {
		return "/collegian/info";
	}
	
	@PostMapping("/changeProfile")
	public String changeProfile(
			Model model
			,@SessionAttribute(value="loginMember") Member loginMember,
			@RequestParam(value="profileImg", required =false) MultipartFile file
			, HttpSession session) throws IllegalStateException, IOException {
		
		// System.out.println(file);
		
		String webPath = "/resources/files/profileImage/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int result = service.changeProfile(loginMember,file,webPath,filePath);
		
		if(result > 0) {
			
			if(file.getSize()==0) {
				loginMember.setMemberProfile(null);
			}else {
				loginMember.setMemberProfile(webPath+file.getOriginalFilename());
			}
			
			model.addAttribute("loginMember", loginMember);
		}
		
		return "redirect:/collegian/info"; 
	}
	
	
	@PostMapping("/updateInfo")
	public String updateInfo(
			Model model
			,@SessionAttribute(value="loginMember") Member loginMember,
			Member inputMember) {
		
		inputMember.setMemberNo(loginMember.getMemberNo());
		
		int result = service.updateInfo(inputMember);
		
		if(result > 0) {
			
			loginMember.setMemberEmail(inputMember.getMemberEmail());
			
			loginMember.setMemberPhone(inputMember.getMemberPhone());
			
			loginMember.setMemberAddr(inputMember.getMemberAddr());
		}
		
		return "redirect:/collegian/info";
	}
	
	
	

}
