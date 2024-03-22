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
	private String memberNo;
	
	private int lecturePoint;
	private int lectureGrade;
	private int lectureTerm;

}
