package kh.finalpro.project.main.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmailDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int updateMemberPw(Map<String, String> map) {
		return sqlSession.update("memberMapper.updateMemberPw", map);
	}

	public int insertMemberPw(Map<String, String> map) {
		return sqlSession.insert("memberMapper.insertMemberPw", map);
	}

}
