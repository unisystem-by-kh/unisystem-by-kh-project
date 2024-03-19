package kh.finalpro.project.collegian.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Class {
	private int classNo;
	private String className;
	private int classPoint;
	private int classMax;
	private int classGrade;
	private int classTrem;
	private char classDay;
	private int classStart;
	private int classEnd;
	private int departmentNo;
	private int memberNo;
	private String departmentName;
	private String memberName;
}