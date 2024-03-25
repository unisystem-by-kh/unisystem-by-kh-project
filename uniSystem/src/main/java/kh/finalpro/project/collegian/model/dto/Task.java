package kh.finalpro.project.collegian.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Task {
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private String fileRename;
	private int fkindNo;
	private String memberNo;
	private int taskNo;

}
