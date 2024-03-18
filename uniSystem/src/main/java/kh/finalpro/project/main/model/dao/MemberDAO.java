package kh.finalpro.project.main.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.main.model.dto.Member;

@Repository
public class MemberDAO {

	
	@Autowired // 등록된 Bean 중에서 SqlSessionTemplate 타입의 Bean을 주입
	private SqlSessionTemplate sqlSession;

	
	
	/** 회원가입 DAO
	 * @param inputMember
	 * @return result
	 */
	public int signUp(Member inputMember) {
		
		
		System.out.println("dao : " + inputMember);
		// 추후 업데이트로 변경 예정
		return sqlSession.insert("memberMapper.signUp" , inputMember);
	}



	/** 로그인 DAO
	 * @param inputMember
	 * @return loginMember
	 */
	public Member login(Member inputMember) {
		return sqlSession.selectOne("memberMapper.login", inputMember);
	}



	/** 아이디 찾기 DAO
	 * @param inputMember
	 * @return memberId
	 */
	public String findMemberId(Member inputMember) {
		return sqlSession.selectOne("memberMapper.findMemberId", inputMember);
	}



	/** 비밀번호 찾기 DAO
	 * @param map
	 * @return memberEmail
	 */
	public String findMemberPw(Map<String, Object> map) {
		return sqlSession.selectOne("memberMapper.findMemberPw", map);
	}

}
