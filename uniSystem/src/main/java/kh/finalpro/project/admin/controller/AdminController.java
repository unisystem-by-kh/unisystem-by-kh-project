package kh.finalpro.project.admin.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.admin.model.dto.Admin;
import kh.finalpro.project.admin.model.service.AdminService;
import kh.finalpro.project.main.model.dto.Member;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private AdminService adminService; // AdminService 서비스 변수;

	//교직원  교번/학번 번호생성 페이지
	@GetMapping("/UniqueNo")
	public String showUniqueNoForm() {
	    return "admin/UniqueNo";
	}
	//번호 생성 처리
	@PostMapping("/UniqueNo")
	public String generateUniqueNoAndSave(Admin admin,
	                                      RedirectAttributes ra) {
	    // 서비스를 통해 번호 생성 및 저장 메소드를 호출하고, 반환값을 받습니다.
		System.out.println(admin);
		
	    int result = adminService.saveUniqueNo(admin);

	    if (result == 1) {
	        // 성공 시 메시지를 Flash 속성에 추가합니다.
	        ra.addFlashAttribute("successMessage", "번호가 성공적으로 생성되었습니다.");
	    } else {
	        // 실패 시 메시지를 Flash 속성에 추가합니다.
	        ra.addFlashAttribute("errorMessage", "번호 생성에 실패하였습니다.");
	    }

	    // 결과에 상관없이 UniqueNo 페이지로 리다이렉트합니다.
	    return "redirect:/admin/UniqueNo";
	}


	
	@GetMapping("/selectStudentList")
	public String selectStudentList() {
		return "admin/student/selectStudentList";
	}
	
	@GetMapping("/selectStudentDetail")
	public String selectStudentDetail() {
		return "admin/student/selectStudentDetail";
	}
	
	@GetMapping("/selectList")
	public List<Member> selectList(@RequestBody String input) {
		System.out.println(input);
		return adminService.selectList(input);
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
