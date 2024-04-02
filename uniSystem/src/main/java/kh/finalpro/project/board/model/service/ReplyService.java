package kh.finalpro.project.board.model.service;

import java.util.List;

import kh.finalpro.project.board.model.dto.Reply;

public interface ReplyService {
	
	
	
	// 자유 게시판용 ---------------------------------------------------------------------------------------------------------------
	
	/** 댓글 목록 조회
	 * @param boardNo
	 * @return cList
	 */
	List<Reply> select(int boardNo);
	
	/** 댓글 삽입
	 * @param comment
	 * @return reslt
	 */
	int insert(Reply reply);
	
	/** 댓글 삭제
	 * @param commentNo
	 * @return result
	 */
	int delete(int commentNo);
	
	/** 댓글 수정
	 * @param comment
	 * @return result
	 */
	int update(Reply reply);


	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 1:1 문의 ---------------------------------------------------------------------------------------------------------------
	
	
	
	
	
}
