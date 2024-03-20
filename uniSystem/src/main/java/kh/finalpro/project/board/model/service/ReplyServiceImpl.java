package kh.finalpro.project.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalpro.project.common.util.Util;
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
	
	// 댓글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insert(Reply reply) {
		// XSS 방지 처리
		reply.setReplyContent(Util.XSSHandling(reply.getReplyContent()));
		
		return dao.insert(reply);
	}

	// 댓글 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int delete(int replyNo) {
		return dao.delete(replyNo);
	}
	
	// 댓글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int update(Reply reply) {
		reply.setReplyContent(Util.XSSHandling(reply.getReplyContent()));
		return dao.update(reply);
	}
	

	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 1:1 문의 ---------------------------------------------------------------------------------------------------------------
	
	
	
	
	
}
