package kh.finalpro.project.chatting.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.chatting.model.dto.Message;
import kh.finalpro.project.main.model.dto.Member;

@Repository
public class ChattingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 채팅방 조회
	 * @param loginMember
	 * @return chattingNo
	 */
	public int checkChattingNo() {
		return sqlSession.selectOne("chattingMapper.checkChattingNo");
	}
 
	/** 채팅방 생성
	 * @param map
	 * @return chattingNo
	 */
	public int createChattingRoom(Map<String, Object> map) {
		int result = sqlSession.insert("chattingMapper.createChattingRoom", map);
		int chattingNo = 0;
		if(result > 0) chattingNo = (int)map.get("chattingNo");
		return chattingNo;
	}

	/** 메세지 삽입
	 * @param msg
	 * @return result
	 */
	public int insertMessage(Message msg) {
		return sqlSession.insert("chattingMapper.insertMessage", msg);
	}

	/** 메세지 목록 조회
	 * @param parseInt
	 * @return messageList
	 */
	public List<Message> selectMessageList(int chattingNo) {
		return sqlSession.selectList("chattingMapper.selectMessageList", chattingNo);
	}

	/** 채팅방에서 사용할 익명이름 업데이트
	 * @param senderNo
	 * @param string
	 * @return 
	 */
	public int updateMessageSecretName(String senderNo, String secretName) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("senderNo", senderNo);
		map.put("secretName", secretName);
		
		return sqlSession.update("chattingMapper.updateMessageSecretName", map);
	}

}
