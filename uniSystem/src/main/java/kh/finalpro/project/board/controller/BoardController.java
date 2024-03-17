package kh.finalpro.project.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.finalpro.project.board.model.service.BoardService;

@SessionAttributes({"loginMember"})
@RequestMapping("/board")
@Controller
public class BoardController {

	@Autowired
	private BoardService service;
	
	
	// 오시는길
	@GetMapping("/comeMap")
	public String comeMap() {

		return "board/comeMap";
	}
	
	// ---------------------------------- 게시판 ----------------------------------
	
	
	
	// ---------------------------------- 자유게시판 ---------------------------------- 

	// 자유게시판 목록
	@GetMapping("/{boardCode:[0-9]+}")
	public String selectFreeBoardList(
										@PathVariable("boardCode") int boardCode,
										@RequestParam(value="cp" , required=false, defaultValue="1") int cp,
										Model model,
										@RequestParam Map<String, Object> paramMap
										) {
		
//		Map<String, Object> map = null;
//		
//		map = service.selectFreeBoardList(boardCode, cp);
//		
//		model.addAttribute("map" , map);
//		
//		System.out.println("Controller-boardCode : " + boardCode);
//		System.out.println("Controller-cp : " + cp);
//		System.out.println("Controller-model : " + model);
//		System.out.println("Controller-paramMap : " + paramMap);
		
		

		return "board/freeBoardList";
	}

	// 자유게시판 상세
	@GetMapping("/freeBoardDetail")
	public String selectFreeBoardDetail() {

		return "board/freeBoardDetail";
	}

	// 자유게시판 삽입
	@GetMapping("/freeBoardInsert")
	public String selectFreeBoardInsert() {

		return "board/freeBoardInsert";
	}


	// 자유게시판 수정
	@GetMapping("/freeBoardUpdate")
	public String selectFreeBoardUpdate() {

		return "board/freeBoardUpdate";

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 자료실 목록 연결
	@GetMapping("/boardData")
	public String boardData() {
		return "board/boardData";

	}

	//공지사항 목록
	@GetMapping("/noticeBoardList")
	public String noticeBoard() {
		return "board/noticeBoardList";
	}

	//공지사항 작성페이지
	@GetMapping("/noticeBoardWrite")
	public String noticeWrite() {
		return "board/noticeBoardWrite";
	}

	//공지사항 상세페이지
	@GetMapping("/noticeBoardDetail")
	public String noticeDetail() {
		return "board/noticeBoardDetail";
	}

	// 1:1문의 목록
	@GetMapping("/inquiryBoardList")
	public String inquiryBoard() {
		return "board/inquiryBoardList";
	}

	// 1:1문의 상세페이지
	@GetMapping("/inquiryBoardDetail")
	public String inquiryBoardDetail() {
		return "board/inquiryBoardDetail";
	}

	// 1:1문의 작성페이지
	@GetMapping("/inquiryBoardWrite")
	public String inquiryBoardWrite() {
		return "board/inquiryBoardWrite";
	}


	// 학과공지 목록
	@GetMapping("/departmentBoardList")
	public String departmentBoardList() {
		return "board/departmentBoardList";
	}

	// 학과공지 상세페이지
	@GetMapping("/departmentBoardDetail")
	public String departmentBoardDetail() {
		return "board/departmentBoardDetail";
	}
	
	// 학과공지 작성페이지
	@GetMapping("/departmentBoardWrite")
	public String departmentBoardWrite() {
		return "board/departmentBoardWrite";
	}
	
	





}
