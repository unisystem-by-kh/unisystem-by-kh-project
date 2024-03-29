package kh.finalpro.project.admin.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Evaluation {

	private int rateNo;
	private String rateContent;
	private int rateLike;
	private int classNo;
	private String memberNo;
	
	private String className; // 과목 이름
	private String memberName; // 교수 이름
	
}
