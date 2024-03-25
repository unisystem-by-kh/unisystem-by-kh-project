package kh.finalpro.project.main.model.service;

import java.util.Map;

public interface EmailService {

	/** 비밀번호 찾기
	 * @param email
	 * @param string
	 * @return result
	 */
	int findPw(String email, String string);
	
	String createAuthKey();

	/** 회원 가입 시 이메일 인증
	 * @param paramMap
	 * @return paramMap
	 */
	Map<String, String> checkAuthKey(String email, String title);

}
