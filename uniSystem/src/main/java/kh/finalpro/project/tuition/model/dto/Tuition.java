package kh.finalpro.project.tuition.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Tuition {
	
	private String memberNo;
	private String payMethod;
	private int departmentPrice;
}
