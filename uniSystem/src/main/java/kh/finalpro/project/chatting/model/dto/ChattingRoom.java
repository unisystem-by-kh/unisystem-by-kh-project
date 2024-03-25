package kh.finalpro.project.chatting.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ChattingRoom {
	
	private int chattingNo; // 채팅방 번호
	private String chattingCreateDate; // 채팅방 생성일
	private String memberNo; // 채팅방 생성자

}
