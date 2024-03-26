package kh.finalpro.project.chatting.model.service;

import java.util.List;
import java.util.Map;
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
	
	// 메세지 목록 조회
	@Override
	public List<Message> selectMessageList(Map<String, Object> paramMap) {
		return dao.selectMessageList( Integer.parseInt( String.valueOf(paramMap.get("chattingNo") )));
	}

}
