package kh.finalpro.project.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kh.finalpro.project.board.model.dto.Reply;
import kh.finalpro.project.board.model.service.ReplyServiceImpl;

@RestController
public class ReplyController {

	@Autowired
	private ReplyServiceImpl service;
	
	
	
	// 자유 게시판용 ---------------------------------------------------------------------------------------------------------------
	
	
	
	// 댓글 목록 조회
		@GetMapping(value="/comment", produces="application/json; charset=UTF-8")
		public List<Reply> select(int boardNo) {
			return service.select(boardNo); // HttpMessageConverter List -> JSON 변환
		}
	
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 1:1 문의 ---------------------------------------------------------------------------------------------------------------
	
	
	
	
	
}
