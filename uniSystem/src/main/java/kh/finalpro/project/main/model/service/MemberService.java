package kh.finalpro.project.main.model.service;

import java.util.List;
import java.util.Map;

import kh.finalpro.project.main.model.dto.Member;

public interface MemberService {

	
	/**
	 * 회원가입 서비스
	 * @param inputMember
	 * @return result
	 */
	int signUp(Member inputMember);

	/** 로그인 서비스
	 * @param inputMember
	 * @return loginMember
	 */
	Member login(Member inputMember);

	/** 아이디 찾기 비동기
	 * @param inputMember
	 * @return memberId
	 */
	String findMemberId(Member inputMember);

	/** 비밀번호 찾기 비동기
	 * @param inputMember
	 * @return memberEmail
	 */
	String findMemberPw(Member inputMember);



}
