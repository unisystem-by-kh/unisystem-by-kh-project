package kh.finalpro.project.main.model.dao;

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

}
