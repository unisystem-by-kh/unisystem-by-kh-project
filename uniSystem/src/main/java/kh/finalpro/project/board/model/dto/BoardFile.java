package kh.finalpro.project.board.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardFile {

	private int boardFileNo;
	private String boardFilePath;
	private String boardFileOriginal;
	private String boardFileRename;
	
	private int boardFileCategoryNo;
	private int boardNo;
	
	private int categoryNo;
	
	
	
// BOARD_FILE_NO, BOARD_FILE_PATH, BOARD_FILE_ORIGINAL, BOARD_FILE_RENAME, BOARD_FILE_CATEGORY_NO, BOARD_NO

}
