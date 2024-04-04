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
import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.professor.model.dto.Professor;

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
	@Transactional(rollbackFor = Exception.class)
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
			
			
		}
		
		return totalResult;
	}

	// 학생 세부 정보
	@Override
	public Student studentDetail(String memberNo) {
		
		Student student = dao.studentDetail(memberNo);
		
		return student;
	}

	// 학생 세부 조회 수강 과목 조회
	@Override
	public List<Student> stuLecture(String memberNo) {
		return dao.stuLecture(memberNo);
	}

	// 학생 재적 변경
	@Override
	public int studentUpdate(Student memberArr) {
		
		int result = dao.studentUpdate(memberArr);
		if(result > 0 && memberArr.getRequestType() != null) {
			result = dao.requestUpdate(memberArr);
		}
		
		return result;
	}

	
	// 학생 성적 조회
	@Override
	public Map<String, Object> selectStudentGrade() {

		// 현재 수강중인 학생 수 조회
		int listCount = dao.getListCount();
		
//		List<Professor> studentList = dao.selectStudent();
		
		// 현재 수강중인 학생 리스트 조회
		List<Member> lectureList = dao.lectureList();
		
		Map<String, Object> map = new HashMap<String, Object>();

//		map.put("studentList", studentList);
		map.put("lectureList", lectureList);
		
		return map;
		
	}

	
	// 수강 = 1학년 1학기 학생 목록 성적 조회 비동기 AJAX
	@Override
	public List<Member> memberListOneAndOne() {
		return dao.memberListOneAndOne();
	}
	
	// 수강 = 1학년 2학기 학생 목록 성적 조회 비동기 AJAX
	@Override
	public List<Member> memberListOneAndTwo() {
		return dao.memberListOneAndTwo();
	}

	@Override
	public List<Member> memberListTwoAndOne() {
		return dao.memberListTwoAndOne();
	}

	@Override
	public List<Member> memberListTwoAndTwo() {
		return dao.memberListTwoAndTwo();
	}

	@Override
	public List<Member> memberListThreeAndOne() {
		return dao.memberListThreeAndOne();
	}

	@Override
	public List<Member> memberListThreeAndTwo() {
		return dao.memberListThreeAndTwo();
	}

	@Override
	public List<Member> memberListFourAndOne() {
		return dao.memberListFourAndOne();
	}

	@Override
	public List<Member> memberListFourAndTwo() {
		return dao.memberListFourAndTwo();
	}

	@Override
	public List<Member> memberListNoPoint() {
		return dao.memberListNoPoint();
	}

	@Override
	public List<Member> memberListStatusY() {
		return dao.memberListStatusY();
	}

	@Override
	public List<Member> memberListAll() {
		return dao.memberListAll();
	}
	
	
	
	
	
	
	
	

	
	


	

	
	
	
}
