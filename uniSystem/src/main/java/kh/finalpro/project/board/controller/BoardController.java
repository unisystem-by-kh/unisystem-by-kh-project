package kh.finalpro.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.finalpro.project.board.model.service.FreeBoardService;

@RequestMapping("/board")
@Controller
public class BoardController {

	
	// 자유게시판 목록 연결
	@GetMapping("/freeBoardList")
	public String selectFreeBoardList() {
		
		return "board/freeBoardList";
	}
	
	// 자유게시판 상세 연결
	@GetMapping("/freeBoardDetail")
	public String selectFreeBoardDetail() {
		
		return "board/freeBoardDetail";
	}
	
	// 자유게시판 등록 연결
	@GetMapping("/freeBoardInsert")
	public String selectFreeBoardInsert() {
		
		return "board/freeBoardInsert";
	}
	
	// 자료실 목록 연결
	@GetMapping("/boardData")
	public String boardData() {
		return "board/boardData";
	}
	
}
