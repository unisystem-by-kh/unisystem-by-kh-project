package kh.finalpro.project.main.model.service;

public interface AjaxService {

	
	/** 이메일 중복 검사
	 * @param memberEmail
	 * @return count
	 */
	int checkEmail(String email);

}
