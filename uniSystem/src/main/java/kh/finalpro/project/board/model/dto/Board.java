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
	private int boardSt;
	private int replyCount;
	private int memberNo;
	private String memberName;
	private int category;
	private int replyCount;

	
	// 이미지 목록
	private List<BoardFile> fileList;

	// 댓글 목록
	private List<Reply> replyList;

}
