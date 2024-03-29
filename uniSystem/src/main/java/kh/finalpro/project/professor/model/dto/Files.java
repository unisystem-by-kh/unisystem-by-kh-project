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
public class Files {
	
	// 필드명
//	FILE_NO, FILE_PATH, FILE_NAME, FILE_RENAME, FKIND_NO, MEMBER_NO, CLASS_NO, TASK_NO
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private String fileRename;
	private int memberNo;
	private String classNo;
	private int taskNo;
	
	
}
