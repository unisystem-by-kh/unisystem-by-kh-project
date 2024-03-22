package kh.finalpro.project.professor.model.dto;

import java.util.List;

import kh.finalpro.project.admin.model.dto.Subject;
import kh.finalpro.project.board.model.dto.BoardFile;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Professor {
	
	// 학생 관련
	private String memberNo;
	private String memberPw;
	private String memberAddr;
	private String memberEmail;
	private String memberPhone;
	private String memberGen; // 성별
	private String memberDate;
	private String memberGrade; // 학년
	private String memberTerm; // 학기
	private String memberStatus; // 재적여부
	private String memberName;
	private String memberProfile;
	private String memberSsn;
	
	// 성적관련으로 편하게 선언
	private String memberAge; // 나이 변환
	private int lecturePoint; // 성적
	
	// 학과 관련
	private int departmentNo; // 학과코드
	private String departmentName; // 학과이름
	
	// 학생 과목 관련(Class)
	private List<Subject> classList;
	
	private int lectureCount;
	private List<Lecture> lectureList;
	
//	CLASS_NO, CLASS_NM, CLASS_POINT, CLASS_MAX, CLASS_GRADE, CLASS_TREM, CLASS_DAY, CLASS_START, CLASS_END, DEPARTMENT_NO, MEMBER_NO
//	private int classNo;
//	private String classNm;
//	private int classPoint;
//	private int classMax;
//	private int classGrade;
//	private int classTerm;
//	private String classDay;
//	private int classStart;
//	private int classEnd;
	
}
