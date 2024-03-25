package kh.finalpro.project.chatting.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Message {
	
	private int messageNo; // 메세지 번호
	private String messageContent; // 메세지 내용
	private String sendTime; // 보낸 시간
	private int chattingNo; // 채팅방 번호
	private String senderNo; // 보낸 사람 번호

}
