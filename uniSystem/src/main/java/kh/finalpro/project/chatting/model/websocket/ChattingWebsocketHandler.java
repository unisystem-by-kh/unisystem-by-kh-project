package kh.finalpro.project.chatting.model.websocket;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import kh.finalpro.project.chatting.model.dto.Message;
import kh.finalpro.project.chatting.model.service.ChattingService;
import kh.finalpro.project.main.model.dto.Member;

public class ChattingWebsocketHandler extends TextWebSocketHandler{

	private Logger logger = LoggerFactory.getLogger(ChattingWebsocketHandler.class);

	@Autowired
	private ChattingService service;

	// WebSocketSession : 클라이언트 - 서버간 전이중통신을 담당하는 객체 (JDBC Connection과 유사)
	// 클라이언트의 최초 웹소켓 요청 시 생성
	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());
	// synchronizedSet : 동기화된 Set 반환(HashSet은 기본적으로 비동기)
	// -> 멀티스레드 환경에서 하나의 컬렉션에 여러 스레드가 접근하여 의도치 않은 문제가 발생되지 않게 하기 위해
	//    동기화를 진행하여 스레드가 여러 순서대로 한 컬렉션에 순서대로 접근할 수 있게 변경.


	// afterConnectionEstablished - 클라이언트와 연결이 완료되고, 통신할 준비가 되면 실행. 
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 연결 요청이 접수되면 해당 클라이언트와 통신을 담당하는 WebSocketSession 객체가 전달되어져 옴.
		// 이를 필드에 선언해준sessions에 저장
		sessions.add(session);

		//logger.info("{}연결됨", session.getId());
		//System.out.println(session.getId() + "연결됨");
	}

	//handlerTextMessage - 클라이언트로부터 텍스트 메세지를 받았을때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info("전달받은 내용 : " + message.getPayload());
		
		// Jackson에서 제공하는 객체
        // JSON String -> VO Object
        // 전달받은 내용 : {"senderNo":"5","targetNo":"1","chattingNo":"3","messageContent":"ㅎㅇ\n"}
        ObjectMapper objectMapper = new ObjectMapper();
        
        Message msg = objectMapper.readValue( message.getPayload(), Message.class);
        // Message 객체 확인
        System.out.println("msg::" + msg); 
        
        int result = service.insertMessage(msg);
        
        if(result > 0) {
        	
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
        	msg.setSendTime( sdf.format(new Date()) );
        	
        	for (WebSocketSession s : sessions) {
        		
        		String loginMemberNo = ((Member)s.getAttributes().get("loginMember")).getMemberNo();
        		logger.debug("loginMemberNo : " + loginMemberNo);
        		
        		
        		/*if(loginMemberNo.equals(msg.getSenderNo())) {
        			s.sendMessage(new TextMessage(new Gson().toJson(msg)));
        		}else {
        			s.sendMessage(new TextMessage(new Gson().toJson(msg)));
        		}*/
        		s.sendMessage(new TextMessage(new Gson().toJson(msg)));
				
			}
        }
        
		
	}

	// afterConnectionClosed - 클라이언트와 연결이 종료되면 실행된다.
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessions.remove(session);
        //logger.info("{}연결끊김",session.getId());
    }



}
