package kh.finalpro.project.collegian.model.service;


import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import com.lowagie.text.DocumentException;

import kh.finalpro.project.collegian.model.dao.CertificateDAO;
import kh.finalpro.project.collegian.model.dto.Certificate;
import kh.finalpro.project.common.util.Util;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Lecture;

@Service
public class CertificateServiceImpl implements CertificateService{
	
	@Autowired
	private  TemplateEngine templateEngine;
	
	@Autowired
	private CertificateDAO dao;
	
	private String webPath = "/resources/files/certificate/"; // 서버 저장 경로
	
	// 학생증 서비스
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Certificate certificateAction(Member loginMember, HttpSession session, int no,int upNo)
			throws IOException, DocumentException {
		
		Certificate certificate = new Certificate();
		
		certificate.setMemberNo(loginMember.getMemberNo());
		certificate.setFkindNo(no); // 증명서 카테고리 번호
		
		int result = 0;
		
		if(upNo == 0) result = dao.selectCertificateCount(certificate); // (조회)생성된 중명서가 있는지 확인
		
		if(result == 0) { // 생성된 중명서가 없다면 학생증 생성
			Context context = new Context();
			String htmlContent = null;
			String originPdfName = null;
			
			if(no == 4) { // 학생증
				
				String state = null;
				
				switch (loginMember.getMemberStatus()) {
					case "N":  state = "재학생"; break;
					case "Y":  state = "휴학생"; break;
					case "P":  state = "졸업생"; break;
					case "D":  state = "중퇴"; break;
				}
				context.setVariable("name", loginMember.getMemberName());
				context.setVariable("memberNo", loginMember.getMemberNo());
				context.setVariable("department", loginMember.getDepartmentName());
				context.setVariable("state", state);
				context.setVariable("profile", loginMember.getMemberProfile());
				
				htmlContent = templateEngine.process("studentID", context); // pdfTemplate == html 양식 명
				
				originPdfName = loginMember.getMemberNo()+"_"+loginMember.getMemberName()+"_학생증.pdf";
			}
			
			if(no == 1) { // 학적 증명서
				
				LocalDate currentDate = LocalDate.now();
		        
		        // 년월일 형식으로 포맷하기
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 ");
		        String formattedDate = currentDate.format(formatter);
		        
				
				String state = null;
				
				switch (loginMember.getMemberStatus()) {
					case "N":  state = "재학"; break;
					case "Y":  state = "휴학"; break;
					case "P":  state = "졸업"; break;
					case "D":  state = "중퇴"; break;
				}
				
				context.setVariable("name", loginMember.getMemberName());
				context.setVariable("memberNo", loginMember.getMemberNo());
				context.setVariable("department", loginMember.getDepartmentName());
				context.setVariable("state", state);
				context.setVariable("date", loginMember.getMemberDate());
				context.setVariable("grade", loginMember.getMemberGrade()+"학년");
				context.setVariable("term", loginMember.getMemberTerm()+"학기");
				context.setVariable("ssn", loginMember.getMemberSsn());
				context.setVariable("sysdate", formattedDate);
				
				
				htmlContent = templateEngine.process("state", context); // pdfTemplate == html 양식 명
				
				
				originPdfName = loginMember.getMemberNo()+"_"+loginMember.getMemberName()+"_학적증명서.pdf";
				
			}
			
			if(no == 2) { // 성적 증명서
				
				
				List<Lecture> scoreList = dao.selectScore(loginMember); // 성적 목록
				
				
				LocalDate currentDate = LocalDate.now();
		        
		        // 년월일 형식으로 포맷하기
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 ");
		        String formattedDate = currentDate.format(formatter);
				
				
				context.setVariable("name", loginMember.getMemberName());
				context.setVariable("memberNo", loginMember.getMemberNo());
				context.setVariable("department", loginMember.getDepartmentName());
				context.setVariable("date", loginMember.getMemberDate());
				context.setVariable("ssn", loginMember.getMemberSsn());
				context.setVariable("sysdate", formattedDate);
				
				context.setVariable("scoreList", scoreList);
				
				htmlContent = templateEngine.process("score", context); // pdfTemplate == html 양식 명
				
				originPdfName = loginMember.getMemberNo()+"_"+loginMember.getMemberName()+"_성적증명서.pdf";
				
			}
			
			String baseUrl = session.getServletContext().getRealPath(webPath);
			
			String fileReName =  Util.convertHtmlToPdf(htmlContent, session, originPdfName, baseUrl); 
			
			certificate.setFileRename(fileReName);
			certificate.setFileName(originPdfName);
			certificate.setFilePath(webPath);
			
			if(upNo == 0) result = dao.insertCertificate(certificate); // fileZIP 테이블에 삽입
			else result = dao.updateCertificate(certificate); // fileZIP 테이블에 업데이트
			
		}
		if(result > 0) { // 조회 또는 삽입 완료 후
			certificate = dao.selectCertificate(certificate);
		}
        
		return certificate;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * @Override public Certificate updateStudentID(Member loginMember, HttpSession
	 * session, int no) throws IOException, DocumentException { Certificate
	 * certificate = new Certificate();
	 * 
	 * certificate.setMemberNo(loginMember.getMemberNo());
	 * certificate.setFkindNo(no); // 증명서 카테고리 번호
	 * 
	 * // HTML 생성 Context context = new Context(); context.setVariable("name",
	 * loginMember.getMemberName()); context.setVariable("memberNo",
	 * loginMember.getMemberNo()); context.setVariable("department",
	 * loginMember.getDepartmentName()); context.setVariable("state",
	 * loginMember.getMemberStatus());
	 * 
	 * String htmlContent = templateEngine.process("studentID", context); //
	 * pdfTemplate == html 양식 명
	 * 
	 * String originPdfName = loginMember.getMemberNo() + "_" +
	 * loginMember.getMemberName() + "_학생증.pdf";
	 * 
	 * String baseUrl = session.getServletContext().getRealPath(webPath);
	 * 
	 * String fileReName = Util.convertHtmlToPdf(htmlContent, session,
	 * originPdfName, baseUrl);
	 * 
	 * certificate.setFileRename(fileReName);
	 * certificate.setFileName(originPdfName); certificate.setFilePath(webPath);
	 * 
	 * int result = dao.updateCertificate(certificate); // fileZIP 테이블에 삽입
	 * 
	 * if (result > 0) { // 조회 또는 삽입 완료 후 certificate =
	 * dao.selectCertificate(certificate); }
	 * 
	 * return certificate; }
	 */
	

}
