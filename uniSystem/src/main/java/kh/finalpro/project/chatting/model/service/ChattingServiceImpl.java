package kh.finalpro.project.chatting.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import kh.finalpro.project.common.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalpro.project.chatting.model.dao.ChattingDAO;
import kh.finalpro.project.chatting.model.dto.Message;
import kh.finalpro.project.main.model.dto.Member;

@Service
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	private ChattingDAO dao;

	// 오늘 만들어진 채팅방 조회
	@Override
	public int checkChattingNo() {
		return dao.checkChattingNo();
	}

	// 채팅방 생성
	@Override
	@Transactional
	public int createChattingRoom(Map<String, Object> map) {
		return dao.createChattingRoom(map);
	}

	// 메세지 삽입
	@Override
	public int insertMessage(Message msg) {
		msg.setMessageContent(Util.XSSHandling(msg.getMessageContent()));
		return dao.insertMessage(msg);
	}

	/*// 메세지 목록 조회
	@Override
	public List<Message> selectMessageList(Map<String, Object> paramMap) {

		// 채팅방에 메세지 가져오기
		List<Message> messageList = dao.selectMessageList( Integer.parseInt( String.valueOf(paramMap.get("chattingNo") ))); 

		// 채팅한 학생들의 이름 바꿔주기
		Random random = new Random();
        int randomNum = random.nextInt(9000) + 1000;

		for (Message m : messageList) {
			m.setMemberName( m.getMemberName().replaceAll(m.getMemberName(), "익명"+randomNum) );
		}
		System.out.println(messageList);

		return null;
	}*/

	// 메세지 목록 조회
	@Override
	public List<Message> selectMessageList(Map<String, Object> paramMap) {
		return dao.selectMessageList(Integer.parseInt(String.valueOf(paramMap.get("chattingNo"))));
	}


}
