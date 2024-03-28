package kh.finalpro.project.collegian.model.dto;

import groovy.transform.ToString;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Request {
	private int reqNo;
	private String reqType;
	private String reqReason;
	private String memberNo;
	private String confirmNo;
	private String reqState;
}
