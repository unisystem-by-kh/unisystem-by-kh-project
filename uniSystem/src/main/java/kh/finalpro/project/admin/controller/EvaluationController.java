package kh.finalpro.project.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.admin.model.service.EvaluationService;
import kh.finalpro.project.main.model.dto.Member;

@SessionAttributes("loginMember")
@Controller
public class EvaluationController {
	
	@Autowired
	private EvaluationService service;
	
	@GetMapping("/late")
	public String lateList(
			  Model model
			, @RequestParam(value = "cp", required = false, defaultValue = "1") int cp 
			, RedirectAttributes ra 
			, @SessionAttribute(value = "loginMember", required = false) Member loginMember 
			, @RequestParam Map<String, Object> paramMap) {
		
		String memberNo = loginMember.getMemberNo().substring(0,2); // 교수면 02 | 교직원은 03
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(paramMap.get("key") == null) {
			
			if(memberNo.equals("02")) {
				// 해당 교수 평가만 가져오기
				map = service.selectLateList(cp, loginMember);
				
			} else {
				
				// 평가 목록 전부 가져오기
				map = service.selectLateList(cp);
			}
			
		} else {
			// 검색어가 있으면서 교수일때
			if(memberNo.equals("02")) {
				
				paramMap.put("memberNo", loginMember.getMemberNo());
				map = service.selectLateList(cp, paramMap);
				
			} else {
				
				// 평가 목록 전부 가져오기(검색어)
				map = service.selectLateList(cp, paramMap);
			}
		}
		
		
		model.addAttribute("map", map);
		
		
		return "/admin/subjectEvaluation";
	}
	
	// 오시는길
	@GetMapping("/comeMap")
	public String comeMap() {

		return "board/comeMap";
	}

}
