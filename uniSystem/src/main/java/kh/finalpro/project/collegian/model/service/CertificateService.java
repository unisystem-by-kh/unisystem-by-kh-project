package kh.finalpro.project.collegian.model.service;

import java.io.IOException;

import javax.servlet.http.HttpSession;


import com.lowagie.text.DocumentException;

import kh.finalpro.project.collegian.model.dto.Certificate;
import kh.finalpro.project.main.model.dto.Member;

public interface CertificateService {
	
	// 학생증 서비스
	Certificate certificateAction(Member loginMember, HttpSession session, int no, int upNo) throws IOException, DocumentException;

	//Certificate updateStudentID(Member loginMember, HttpSession session, int no) throws IOException, DocumentException;

	
	
	
	
}
