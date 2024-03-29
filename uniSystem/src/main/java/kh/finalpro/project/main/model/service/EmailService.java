package kh.finalpro.project.main.model.service;

import java.util.List;
import java.util.Map;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.main.model.dto.Member;

public interface EmailService {

	/** 비밀번호 찾기
	 * @param email
	 * @param string
	 * @param string2 
	 * @return result
	 */
	int findPw(String email, String memberName, String title);
	
	String createAuthKey();

	/** 회원 가입 시 이메일 인증
	 * @param paramMap
	 * @return paramMap
	 */
	Map<String, String> checkAuthKey(String email, String title);

	/** 학과 공지 작성하면서 이메일 발송
	 * @param board
	 * @param memberList
	 */
	void emailShoot(Board board, List<Member> memberList);

}
