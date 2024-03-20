package kh.finalpro.project.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalpro.project.main.model.dao.MemberDAO;
import kh.finalpro.project.main.model.dto.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO dao;
	
	// 회원 가입 서비스
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public int signUp(Member inputMember) {
		
		int result = dao.signUp(inputMember);
		
		System.out.println("serviceImpl : " + inputMember);
		System.out.println("serviceImpl : " + result);
		
		return result;
	}
	
	// 로그인 서비스
	@Override
	public Member login(Member inputMember) {
		
		Member loginMember = dao.login(inputMember);
		
		return loginMember;
	}
	
	// 아이디 찾기 서비스
	@Override
	public String findMemberId(Member inputMember) {
		return dao.findMemberId(inputMember);
	}
	
	// 비번 찾기 서비스
	@Override
	public String findMemberPw(Member inputMember) {
		return dao.findMemberPw(inputMember);
	}
	

}
