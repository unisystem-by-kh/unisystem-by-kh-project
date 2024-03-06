package kh.finalpro.project.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

		@RequestMapping("/")
		public String main() {
	
			return "common/main"; // 메인페이지 확인
			
			
			// test
			// test2
			
			
			
			// 교수 로그인시 페이지
//			return "professor/professorPage-StudentSearch"; // 학생 조회
//			return "professor/professorPage-StudentGrade"; // 성적 조회
//			return "professor/professorPage-StudentGradeInsert"; // 성적 등록
//			return "professor/professorPage-StudentGradeUpadte"; // 성적 수정
//			return "professor/professorPage-professorCardIssue"; // 교원증 발급
			
//			return "board/freeBoardList"; // 자유게시판 목록
//			return "board/freeBoardDetail"; // 자유게시판 상세
//			return "board/freeBoardInsert"; // 자유게시판 수정
//			return "board/freeBoardUpdate"; // 자유게시판 등록
			
			
//			return "login"; // 로그인 페이지
		}
	
}
