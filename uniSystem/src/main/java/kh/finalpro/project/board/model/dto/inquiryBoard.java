package kh.finalpro.project.board.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class inquiryBoard {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardCreateDate;
	private String boardUpdateDate;
	private int readCount;
	private int boardCode;
	private int likeCount;    
	private String memberName; 
	private int memberNo;
	private String profileImage;
	

	// 이미지 목록
//	private List<BoardImage> imageList;

	// 댓글 목록
//	private List<Comment> commentList;
	
}
