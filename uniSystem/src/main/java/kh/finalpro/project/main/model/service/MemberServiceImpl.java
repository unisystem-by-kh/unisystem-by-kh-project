package kh.finalpro.project.main.model.service;

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
	
	

}
