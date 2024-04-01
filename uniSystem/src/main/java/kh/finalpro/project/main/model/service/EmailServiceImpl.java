package kh.finalpro.project.main.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.main.model.dao.EmailDAO;
import kh.finalpro.project.main.model.dto.Member;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	private EmailDAO dao;

	@Autowired
	private JavaMailSender mailSender;

	private String fromEmail = "anycallshow1129@gmail.com";
	private String fromUsername = "UNI-SYSTEM 관리자";

	@Override
	public String createAuthKey() {
		String key = "";

		for(int i=0 ; i< 8 ; i++) {

			int sel1 = (int)(Math.random() * 3); // 0:숫자 / 1,2:영어

			if(sel1 == 0) {

				int num = (int)(Math.random() * 10); // 0~9
				key += num;

			}else {

				char ch = (char)(Math.random() * 26 + 65); // A~Z

				int sel2 = (int)(Math.random() * 2); // 0:소문자 / 1:대문자

				if(sel2 == 0) {
					ch = (char)(ch + ('a' - 'A')); // 소문자로 변경
				}

				key += ch;
			}

		}
		return key;
	}

	@Transactional
	@Override
	public int findPw(String email, String memberName, String title) {
		
		//6자리 난수 인증번호 생성
		String authKey = createAuthKey();
		try {
			//인증메일 보내기
			MimeMessage mail = mailSender.createMimeMessage();

			// 제목
			String subject = "[UNI-SYSTEM] " + title;

			// 문자 인코딩
			String charset = "UTF-8";

			// 메일 내용
			String mailContent 
			= "<div style='background-color: #f4f4f4; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);'>"
		        + "<h2 style='color: #333; text-align: center; font-family: Arial, sans-serif;'>UNI-SYSTEM " + title + "</h2>"
		        + "<hr style='border-top: 1px solid #ccc;'>"
		        + "<p style='font-size: 16px; text-align: center;'>안녕하세요, " + memberName + "님!</p>"
		        + "<p style='font-size: 16px; text-align: center;'>아래는 임시비밀번호입니다:</p>"
		        + "<h3 style='color: #007bff; font-size: 24px; text-align: center;'>" + authKey + "</h3>"
		        + "<p style='font-size: 16px; text-align: center;'>로그인 후 비밀번호를 변경해주시기 바랍니다.</p>"
		        + "<p style='font-size: 14px; text-align: center; margin-top: 20px;'>홈페이지 주소: [홈페이지 주소]</p>"
		        + "<p style='font-size: 14px; text-align: center; margin-top: 20px;'>이 이메일은 자동 발송되었습니다. 본인이 요청하지 않았다면 무시하셔도 됩니다.</p>"
		        + "</div>";



			// 송신자(보내는 사람) 지정
			mail.setFrom(new InternetAddress(fromEmail, fromUsername));
			
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			// 수신자(받는사람) 지정

			// 이메일 제목 세팅
			mail.setSubject(subject, charset);

			// 내용 세팅
			mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨

			mailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("authKey", authKey);
		map.put("email", email);
		map.put("memberName", memberName);

//		System.out.println(map);

		int result = dao.updateMemberPw(map);


		return result;
	}

	
	
	@Override
	public Map<String, String> checkAuthKey(String email, String title) {
		//6자리 난수 인증번호 생성
		String authKey = createAuthKey();
		try {
			//인증메일 보내기
			MimeMessage mail = mailSender.createMimeMessage();

			// 제목
			String subject = "[UNI-SYSTEM] "+title+" 인증코드";

			// 문자 인코딩
			String charset = "UTF-8";

			// 메일 내용
			String mailContent 
			= "<p>UNI-SYSTEM "+title+" 인증코드 입니다.</p>"
					+ "<h3 style='color:blue'>" + authKey + "</h3>";



			// 송신자(보내는 사람) 지정
			mail.setFrom(new InternetAddress(fromEmail, fromUsername));
			mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

			// 수신자(받는사람) 지정

			// 이메일 제목 세팅
			mail.setSubject(subject, charset);

			// 내용 세팅
			mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨

			mailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("authKey", authKey);
		map.put("email", email);
		
		return map;
	}

	@Override
	public void emailShoot(Board board, List<Member> memberList) {
		
		try {
			MimeMessage mail = mailSender.createMimeMessage();

			// 제목
			String subject = board.getBoardTitle();

			// 문자 인코딩
			String charset = "UTF-8";

			// 메일 내용
			String mailContent 
			= "<h3>"+board.getBoardContent()+ "</h3>";
			
			mail.setFrom(new InternetAddress(fromEmail, fromUsername));
			
			for(Member member : memberList) {
				
				mail.addRecipient(Message.RecipientType.TO, new InternetAddress(member.getMemberEmail()));
				
				// 이메일 제목 세팅
				mail.setSubject(subject, charset);

				// 내용 세팅
				mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨

				mailSender.send(mail);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	



}
