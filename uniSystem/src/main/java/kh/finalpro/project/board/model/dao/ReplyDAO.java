package kh.finalpro.project.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dto.Reply;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	// 자유 게시판용 ---------------------------------------------------------------------------------------------------------------
	
	
	
	/** 댓글 목록 조회
	 * @param boardNo
	 * @return cList
	 */
	public List<Reply> select(int boardNo) {
		return sqlSession.selectList("boardMapper.selectCommentList", boardNo);
	}

	/** 댓글 삽입
	 * @param reply
	 * @return result
	 */
	public int insert(Reply reply) {
		return sqlSession.insert("replyMapper.insert" , reply);
	}

	/** 댓글 삭제
	 * @param replyNo
	 * @return result
	 */
	public int delete(int replyNo) {
		return sqlSession.update("replyMapper.delete", replyNo);
	}

	/** 댓글 수정
	 * @param comment
	 * @return result
	 */
	public int update(Reply reply) {
		return sqlSession.update("replyMapper.update", reply);
	}
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 1:1 문의 ---------------------------------------------------------------------------------------------------------------
	
	
	
	
	
}
