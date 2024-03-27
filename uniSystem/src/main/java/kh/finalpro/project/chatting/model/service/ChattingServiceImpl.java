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

		// 채팅방에 메세지 가져오기
		List<Message> messageList = dao.selectMessageList(Integer.parseInt(String.valueOf(paramMap.get("chattingNo"))));

		// 익명 이름을 생성하고, senderNo와 매핑하여 유일한 익명 이름 부여
		Map<String, String> senderNoToAnonymousName = new HashMap<>();
		
		for (Message m : messageList) {
			String senderNo = m.getSenderNo();
			
			if (!senderNoToAnonymousName.containsKey(senderNo)) {
				
				// 새로운 senderNo에 대한 익명 이름 생성
				Random random = new Random();
				int randomNum = random.nextInt(9000) + 1000; 
				senderNoToAnonymousName.put(senderNo, "익명" + randomNum);
			}
			
			// 해당 senderNo에 대한 익명 이름 설정
			m.setMemberName(senderNoToAnonymousName.get(senderNo));
		}

		System.out.println(messageList);

		return messageList;

	}
	
}
