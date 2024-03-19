package kh.finalpro.project.admin.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Subject {
	
	private int classNo;
	private String className;
	private int classPoint;
	private int classMax;
	private int classGrade;
	private int classTrem;
	private String classDay;
	private int classStart;
	private int classEnd;
	
	private int departmentNo;
	private String memeberNo;
	
	private String professor;

}
