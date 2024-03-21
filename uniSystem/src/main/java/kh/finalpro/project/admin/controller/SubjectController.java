package kh.finalpro.project.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.admin.model.dto.Subject;
import kh.finalpro.project.admin.model.service.SubjectService;
import kh.finalpro.project.main.model.dto.Member;

@Controller
@RequestMapping("/staff")
public class SubjectController {

	@Autowired
	private SubjectService service;

	// 교과목 조회 페이지
	@GetMapping("/subjectList")
	public String subjectList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp 
							 , @RequestParam Map<String, Object> paramMap
							 , Model model
							  ) {
		
		if(paramMap.get("query") == null) { // 검색어가 없을 때 (검색 X)
			
			// 게시글 목록 조회 서비스 호출
			Map<String, Object> map = service.selectSubjectList(cp);
			
			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map", map);
			
		} else { // 검색어가 있을 때 (검색 O)
			
			Map<String, Object> map = service.selectSubjectList(paramMap, cp); // 매개변수 타입 다름(오버로딩)
			
			model.addAttribute("map", map);
			
		}
		
		return "admin/subjectList";
	}

	// 교과목 등록 페이지 전환
	@GetMapping("/insert")
	public String insertSubject() {
		return "admin/insertSubject";
	}

	// 교과목 등록
	@PostMapping(value = "/insert", produces = "application/json; charset=UTF-8")
	public String insertSubject(Subject inputClass
			, @RequestHeader(value="referer") String referer
			, RedirectAttributes ra) {

		inputClass.setClassName(inputClass.getClassName().toUpperCase()); // 과목명 대문자 변환
		
		int result = service.insertSubject(inputClass);

		String path = "redirect:";
		String message = null;

		if(result > 0) {
			path += "subjectList";
			message = "등록되었습니다.";
		}else {
			path += referer;
			message = "등록 실패ㅠㅠ";
		}

		ra.addFlashAttribute("message", message);

		return path;
	}

	// 담당교수 실시간 검색
	@PostMapping(value="/professorSearch",produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Member> searchProfessor(@RequestBody String deptCode){
		return service.searchProfessor(deptCode);
	}
	
	// 강의 등록 시 교수 강의시간 체크
	@PostMapping(value = "/timeCheck", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int timeCheck(@RequestBody Map<String, Object> map) {
		//System.out.println(map);
		return service.timeCheck(map);
	}



}
