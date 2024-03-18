package kh.finalpro.project.board.model.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardCDate;
	private String boardUDate;
	private int boardCount;
	private String boardSt;
	private String memberName;
	private int memberNo;
	private int category;
	private int replyCount;

	
	// 이미지 목록
	private List<BoardImage> imageList;

	// 댓글 목록
	private List<Reply> commentList;

}
