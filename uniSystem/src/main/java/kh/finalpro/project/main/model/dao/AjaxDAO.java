package kh.finalpro.project.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dto.Board;

@Repository
public class AjaxDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public int checkEmail(String email) {
		return sqlSession.selectOne("ajaxMapper.checkEmail" , email);
	}


	public String selectInfo(String number) {
		return sqlSession.selectOne("ajaxMapper.selectInfo", number);
	}


	public List<Board> selectAnnouncement() {
		return sqlSession.selectList("ajaxMapper.selectAnnouncement");
	}
	

}
