package kh.finalpro.project.collegian.model.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {
	
	// 학생:01- ; 교수:02- ; 관리자:03-
    private String memberNo;

    // 회원 비밀번호
    private String memberPw;

    // 회원 주소
    private String memberAddr;

    // 회원 이메일
    private String memberEmail;

    // 회원 전화번호
    private String memberPhone;

    // 회원 성별
    private String memberGen;

    // 회원 가입 일자
    private Date memberDate;

    // 학생은 회원 가입 시 1로 삽입
    private int memberGrade;

    // 학생은 회원 가입 시 1로 삽입
    private int memberTerm;

    // 재적 상태(Y:휴학중 ; N:재학중 ; P:졸업 ; D:중퇴), 교수와 관리자는 N고정
    private String memberStatus;

    // 회원 이름
    private String memberName;

    // 학과 코드
    private int departmentNo;

    // 회원 생년월일
    private String memberSsn;

    // 회원 프로필 이미지
    private String memberProfile;

}
