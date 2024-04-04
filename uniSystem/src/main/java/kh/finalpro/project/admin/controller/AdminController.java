package kh.finalpro.project.admin.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.admin.model.dto.Admin;
import kh.finalpro.project.admin.model.dto.Student;
import kh.finalpro.project.admin.model.service.AdminService;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Professor;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService; // AdminService 서비스 변수;

	// 교직원  교번/학번 번호생성 페이지
	@GetMapping("/UniqueNo")
	public String showUniqueNoForm() {
	    return "admin/UniqueNo";
	}
	
	// 번호 생성 처리
	@ResponseBody
	@PostMapping(value ="/UniqueNo", produces="application/json; charset=UTF-8")
	public int saveUniqueNo(@RequestBody Admin admin,
	                           RedirectAttributes ra) {

	    return adminService.saveUniqueNo(admin);
	}


	
	/** 교직원용 학생 조회
	 * @return
	 */
	@GetMapping("/selectStudentList")
	public String selectStudentList(Model model) {
		
		List<Student> studentList = adminService.selectStudentList();
		
		model.addAttribute("studentList", studentList);
		
		return "admin/student/selectStudentList";
	}
	
	// 학생 진급
	@PostMapping(value="/demotion"/* , produces="application/json; charset=UTF-8" */)
	@ResponseBody
	public int demotion(
			@RequestBody List<Student> memberNoArr) throws Exception {
		
		
		int result = adminService.demotion(memberNoArr);
		
		return result;
	}
	
	// 학생 검색
	@GetMapping("/selectList")
	public List<Member> selectList(@RequestBody String input) {
		return adminService.selectList(input);
	}
	
	// 학생 세부 정보 조회
	@GetMapping("/{memberNo}/selectStudentDetail")
	public String selectStudentDetail(Model model
			, @PathVariable("memberNo") String memberNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		Student student = adminService.studentDetail(memberNo);
		List<Student> stuLecture = adminService.stuLecture(memberNo);
		map.put("student", student);
		map.put("stuLecture", stuLecture);
		model.addAttribute("map", map);
		return "/admin/student/selectStudentDetail";
	}
	
	// 학생 재적 변경
	@PutMapping("/studentUpdate")
	@ResponseBody
	public int studentUpdate(@RequestBody Student memberArr) {
		
		
		int result = adminService.studentUpdate(memberArr);
		
		return result;
	}
	
	
	
	// 학생 성적 조회
	@GetMapping("/searchStudentGrade")
	public String searchStudentGrade(
			Model model,
			@RequestParam Map<String, Object> paramMap
			){
		
		Map<String, Object> map = null;
		
		if(paramMap.get("key") == null) {

			map = adminService.selectStudentGrade();

			model.addAttribute("map" , map);

		}else { // 검색어가 있을 때 (검색 O)

			// 이후 추가 예정
//			map = adminService.searchStudentGrade(paramMap);

			model.addAttribute("map" , map);
		}
		
		model.addAttribute("map" , map);
		
		
		return "/admin/student/searchStudentGrade";
	}
	
	
	// 수강 = 1학년 1학기 학생 목록 성적 조회 비동기 AJAX
	@GetMapping(value="/memberListOneAndOne" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListOneAndOne(){
		return adminService.memberListOneAndOne();
	}
	
	// 수강 = 1학년 2학기 학생 목록 성적 조회 비동기 AJAX
	@GetMapping(value="/memberListOneAndTwo" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListOneAndTwo(){
		return adminService.memberListOneAndTwo();
	}
	
	
	@GetMapping(value="/memberListTwoAndOne" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListTwoAndOne(){
		return adminService.memberListTwoAndOne();
	}
	
	
	@GetMapping(value="/memberListTwoAndTwo" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListTwoAndTwo(){
		return adminService.memberListTwoAndTwo();
	}
	
	
	@GetMapping(value="/memberListThreeAndOne" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListThreeAndOne(){
		return adminService.memberListThreeAndOne();
	}
	
	
	@GetMapping(value="/memberListThreeAndTwo" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListThreeAndTwo(){
		return adminService.memberListThreeAndTwo();
	}
	
	
	@GetMapping(value="/memberListFourAndOne" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListFourAndOne(){
		return adminService.memberListFourAndOne();
	}
	
	
	@GetMapping(value="/memberListFourAndTwo" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListFourAndTwo(){
		return adminService.memberListFourAndTwo();
	}
	
	@GetMapping(value="/memberListNoPoint" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListNoPoint(){
		return adminService.memberListNoPoint();
	}
	
	@GetMapping(value="/memberListStatusY" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListStatusY(){
		return adminService.memberListStatusY();
	}
	
	@GetMapping(value="/memberListAll" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> memberListAll(){
		return adminService.memberListAll();
	}
	
	
	
	
	
}





