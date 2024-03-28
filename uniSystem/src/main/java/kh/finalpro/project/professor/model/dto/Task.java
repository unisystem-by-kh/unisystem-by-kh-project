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
public class Task {
	
	// 필드명
//	TASK_NO, TASK_ROUTE, TASK_DATE, CLASS_NO, MEMBER_NO
	private int taskNo;
	private String taskRoute;
	private String taskDate;
	
	private int classNo;
	private int memberNo;

	private String classNm;
	private int classPoint;
	private String fileName;
	
	
	
}
