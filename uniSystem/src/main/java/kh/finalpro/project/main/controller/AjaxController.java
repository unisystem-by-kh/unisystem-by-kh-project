package kh.finalpro.project.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.main.model.service.AjaxService;

@Controller
public class AjaxController {
	
	@Autowired
	private AjaxService service;
	
	// 이메일 중복 검사
	@GetMapping("/dupCheck/email")
	@ResponseBody
	public int checkEmail (String email) {
		return service.checkEmail(email);
	}
	
	
	// 회원번호로 학과 조회
	@GetMapping(value="/selectInfo" , produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String selectInfo (String number) {
		return service.selectInfo(number);
	}
	
	
	// 공지사항 게시글 목록(최근 5개) 조회
	@GetMapping(value="/selectAnnouncement" , produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Board> selectAnnouncement () {
		return service.selectAnnouncement();
	}
	
	
	

}
