package kh.finalpro.project.admin.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.api.services.calendar.model.Event;

import kh.finalpro.project.admin.model.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private AdminService adminService; // AdminService 서비스 변수;

	//교직원  교번/학번 번호생성 페이지
	@GetMapping("/UniqueNo")
	public String uniqueNo() {
		return "admin/UniqueNo";
	}
	
	
	// 추후 수정 예정
	/*
	// 캘린더 API 컨트롤러
	@RequestMapping("/calender")
	public class CalendarController {
		// 생성자를 통해 GoogleCalendarService를 주입받음
	    public CalendarController(AdminService calendarService) {
	        adminService = calendarService;
	    }

	 // POST 메소드를 통해 이벤트를 생성하는 엔드포인트
	    @PostMapping
	    public ResponseEntity<?> createEvent(@RequestBody Event event) {
	        try {
	        	// GoogleCalendarService를 통해 이벤트를 생성
	        	adminService.createEvent(event); 
	            // 성공 응답 반환
	            return ResponseEntity.ok().build();
	        } catch (IOException | GeneralSecurityException e) {
	        	// 오류 반환
	            e.printStackTrace();
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	        }
	    }

	    // 이벤트 업데이트 및 삭제를 위한 다른 엔드포인트를 구현할 수 있음
	}
	*/
	
	
	
}
