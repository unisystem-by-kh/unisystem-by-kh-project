package kh.finalpro.project.main.model.service;

public interface EmailService {

	/** 비밀번호 찾기
	 * @param email
	 * @param string
	 * @return result
	 */
	int findPw(String email, String string);
	
	String createAuthKey();

}
