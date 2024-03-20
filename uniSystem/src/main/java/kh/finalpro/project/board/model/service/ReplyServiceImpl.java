package kh.finalpro.project.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.board.model.dao.ReplyDAO;
import kh.finalpro.project.board.model.dto.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO dao;
	
	
	
	// 자유 게시판용 ---------------------------------------------------------------------------------------------------------------
	
	
	
	
	// 댓글 목록 조회
		@Override
		public List<Reply> select(int boardNo) {
			return dao.select(boardNo);
		}
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 1:1 문의 ---------------------------------------------------------------------------------------------------------------
	
	
	
	
	
}
