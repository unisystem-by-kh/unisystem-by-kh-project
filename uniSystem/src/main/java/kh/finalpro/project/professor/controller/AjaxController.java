package kh.finalpro.project.professor.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.professor.model.service.AjaxService;

@SessionAttributes({"loginMember"})
@RequestMapping("/professor")
@Controller
public class AjaxController {
	
	@Autowired
	private AjaxService service;
	
	
	@GetMapping(value="/selectLecture" , produces = "application/text; charset=UTF-8")
	@ResponseBody
	public List<Lecture> selectLecture (String memberNo) {
		
		return service.selectLecture(memberNo);
	}

}
