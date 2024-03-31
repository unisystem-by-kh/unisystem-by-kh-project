package kh.finalpro.project.admin.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Student {
	
	private String memberNo; // 학생 학번
	private String memberName; // 학생 이름
	private int memberGrade; // 학생 학년
	private int memberTerm; // 학생 학기
	private String deptName; // 학생의 학과 이름
	private String memberStatus; // 학생 재적 상태(재적 상태(Y:휴학중 / N:재학중 / P:졸업 / D:중퇴))
	private int classPoint; // 이수 학점
	private String requestType; // 학생 재정 변경 요청(Y:휴학신청 / N:재학신청 / D:자퇴신청)
	private String requestReason; // 학생 재정 변경 사유
	
	private String pay; // 등록금 납부 여부
	private String memberDate; // 생년월일
}
