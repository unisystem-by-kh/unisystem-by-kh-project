package kh.finalpro.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.finalpro.project.board.model.service.FreeBoardService;

@RequestMapping("/board")
@Controller
public class BoardController {


	// 오시는길
	@GetMapping("/comeMap")
	public String comeMap() {

		return "board/comeMap";
	}

	// �옄�쑀寃뚯떆�뙋 紐⑸줉 �뿰寃�ㅁㄴㅇ
	@GetMapping("/freeBoardList")
	public String selectFreeBoardList() {

		return "board/freeBoardList";
	}

	// �옄�쑀寃뚯떆�뙋 �긽�꽭 �뿰寃�
	@GetMapping("/freeBoardDetail")
	public String selectFreeBoardDetail() {

		return "board/freeBoardDetail";
	}

	// �옄�쑀寃뚯떆�뙋 �벑濡� �뿰寃�
	@GetMapping("/freeBoardInsert")
	public String selectFreeBoardInsert() {

		return "board/freeBoardInsert";
	}


	// �옄�쑀寃뚯떆�뙋 �벑濡� �뿰寃�
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
