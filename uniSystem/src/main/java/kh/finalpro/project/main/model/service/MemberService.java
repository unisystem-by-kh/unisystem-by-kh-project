package kh.finalpro.project.main.model.service;

import kh.finalpro.project.main.model.dto.Member;

public interface MemberService {

	
	/**
	 * 회원가입 서비스
	 * @param inputMember
	 * @return result
	 */
	int signUp(Member inputMember);

}
