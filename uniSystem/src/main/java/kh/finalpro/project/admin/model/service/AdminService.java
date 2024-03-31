package kh.finalpro.project.admin.model.service;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Map;

import com.google.api.services.calendar.model.Event;

import kh.finalpro.project.admin.model.dto.Admin;
import kh.finalpro.project.admin.model.dto.Student;
import kh.finalpro.project.main.model.dto.Member;

public interface AdminService {

	List<Member> selectList(String input);

	int saveUniqueNo(Admin admin);

	// 학생 정보 조회
	List<Student> selectStudentList();

	// 학생 진급 승인
	int demotion(List<Student> memberNoArr);



	// 추후 수정 예정
//	void createEvent(Event event) throws IOException, GeneralSecurityException;

}
