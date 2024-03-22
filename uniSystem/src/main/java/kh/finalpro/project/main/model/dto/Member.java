package kh.finalpro.project.main.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Member {

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
	
	private int departmentNo; // 학과코드
	private String departmentName; // 학과이름

	private int departmentPrice; // 등록금

	
	// 성적관련으로 편하게 선언
	private String memberAge; // 나이 변환
	private int lecturePoint; // 성적
	private int lectureCount; // 수강 수

}
