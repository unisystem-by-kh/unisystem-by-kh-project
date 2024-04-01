package kh.finalpro.project.admin.model.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;

import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;

import com.google.api.client.json.gson.GsonFactory;

//import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.calendar.model.Event;

import kh.finalpro.project.admin.model.dao.AdminDAO;
import kh.finalpro.project.admin.model.dto.Admin;
import kh.finalpro.project.admin.model.dto.Student;
import kh.finalpro.project.main.model.dto.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.FileInputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<Member> selectList(String input) {
		return dao.selectList(input);
	}

	@Override
	public int saveUniqueNo(Admin admin) {
		// TODO Auto-generated method stub
		return dao.saveUniqueNo(admin);
	}

	// 학생 정보 조회
	@Override
	public List<Student> selectStudentList() {
		
		return dao.selectStudentList();
	}

	// 학생 진급 승인
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int demotion(List<Student> memberNoArr) throws Exception{
		
		int totalResult = 0;
		
		for(Student memberNo : memberNoArr) {
			int result = dao.demotion(memberNo);	
			if (result <= 0) {
                throw new RuntimeException("진급 실패 : " + memberNo.getMemberNo()); // 진급 실패시 강제 예외 발생
            }
			totalResult += result;
			
			System.out.println(memberNo.getMemberNo());
			
		}
		
		return totalResult;
	}

	// 학생 세부 정보
	@Override
	public Student studentDetail(String memberNo) {
		
		Student student = dao.studentDetail(memberNo);
		
		return student;
	}

	@Override
	public List<Student> stuLecture(String memberNo) {
		return dao.stuLecture(memberNo);
	}
	
	
	
	
	
	

	
	


	

	
	
	
}
