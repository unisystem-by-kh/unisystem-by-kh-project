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

	private int memberNo;
	private String memberPw;
	private String memberAddr;
	private String memberEmail;
	private String memberPhone;
	private String memberGen; // 성별
	private String memberGrade; // 학년
	private String memberTerm; // 학기
	private String memberStatus; // 재적여부
	private String memberName;
	
	
	private int departmentNo; // 학과코드
	
}
