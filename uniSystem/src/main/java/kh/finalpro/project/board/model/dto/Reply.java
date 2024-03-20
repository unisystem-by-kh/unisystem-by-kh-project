package kh.finalpro.project.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Reply {

	private int replyNo;
	private String replyContent;
	private String replyDate;
	private String replySt;
	private String memberName;
	private String memberNo;
	private int boardNo;
	private String memberProfile;
	
	
	// REPLY_NO, REPLY_CONTENT, REPLY_DATE, REPLY_ST, BOARD_NO, MEMBER_NO

}
