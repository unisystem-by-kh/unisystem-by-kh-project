package kh.finalpro.project.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import kh.finalpro.project.main.model.dto.Member;

public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Member> selectList(String input) {
		return sqlSession.selectList("");
	}

}
