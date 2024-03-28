package kh.finalpro.project.professor.model.dto;

import java.util.List;

import kh.finalpro.project.admin.model.dto.Subject;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Lecture {
	
	// 필드명
//	CLASS_NO, MEMBER_NO, LECTURE_POINT, LECTURE_GRADE, LECTURE_TERM
	private int classNo;
	private String classNm;
	
	private int classPoint;
	
	
	private String memberNo;
	private String classType;
	
	private int lecturePoint;
	private int lectureGrade;
	private int lectureTerm;
	
	private String realPoint;

	/*
	 * @Override public String toString() { // 성적 증명서 출력 오류 때문에 toString 오버라이딩함
	 * return lectureGrade+"-"+lectureTerm
	 * +" | "+classType+" | "+classNm+" | "+classPoint+" | "+realPoint ; }
	 */
}
