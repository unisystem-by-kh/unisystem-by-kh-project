package kh.finalpro.project.chatting.model.service;

import java.util.List;
import java.util.Map;

import kh.finalpro.project.chatting.model.dto.Message;
import kh.finalpro.project.main.model.dto.Member;

public interface ChattingService {

	int checkChattingNo();

	int createChattingRoom(Map<String, Object> map);

	int insertMessage(Message msg);

	List<Message> selectMessageList(Map<String, Object> paramMap);

}
