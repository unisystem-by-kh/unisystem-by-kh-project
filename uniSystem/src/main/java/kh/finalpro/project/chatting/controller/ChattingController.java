package kh.finalpro.project.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.finalpro.project.chatting.model.dto.Message;
import kh.finalpro.project.chatting.model.service.ChattingService;
import kh.finalpro.project.main.model.dto.Member;

@SessionAttributes("loginMember")
@RequestMapping("/chatting")
@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService service;
	
	// 채팅방 입장
	@GetMapping("/enter")
	@ResponseBody
	public int chattingEnter(@SessionAttribute("loginMember") Member loginMember) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("loginMemberNo", loginMember.getMemberNo());
		
		int chattingNo = service.checkChattingNo();
		
		if(chattingNo == 0) {
			System.out.println(map.get("loginMemberNo"));
			chattingNo = service.createChattingRoom(map);
		}
		
		return chattingNo;
	}
	
	// 메세지 목록 조회
	@GetMapping(value = "/selectMessage", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Message> selectMessageList(@RequestParam Map<String, Object> paramMap){
		return service.selectMessageList(paramMap);
	}
	
	
	
	
	

}
