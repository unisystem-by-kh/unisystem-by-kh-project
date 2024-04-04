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
	int demotion(List<Student> memberNoArr) throws Exception;

	// 학생 세부 정보
	Student studentDetail(String memberNo);

	// 학생 세부 정보 수강 과목 조회
	List<Student> stuLecture(String memberNo);

	// 학생 재적 변경
	int studentUpdate(Student memberArr);

	// 학생 성적 조회
	Map<String, Object> selectStudentGrade();

	// 수강 = 1학년 1학기 학생 목록 성적 조회 비동기 AJAX
	List<Member> memberListOneAndOne();

	List<Member> memberListOneAndTwo();

	List<Member> memberListTwoAndOne();

	List<Member> memberListTwoAndTwo();

	List<Member> memberListThreeAndOne();

	List<Member> memberListThreeAndTwo();

	List<Member> memberListFourAndOne();

	List<Member> memberListFourAndTwo();

	List<Member> memberListNoPoint();

	List<Member> memberListStatusY();

	List<Member> memberListAll();



	// 추후 수정 예정
//	void createEvent(Event event) throws IOException, GeneralSecurityException;

}
