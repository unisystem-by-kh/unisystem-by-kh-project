package kh.finalpro.project.board.model.exception;

public class FileUploadException extends RuntimeException{
	
	public FileUploadException() {
		super("파일 업로드 중 예외 발생");
	}
	
	public FileUploadException(String message) {
		super(message);
	}

}
