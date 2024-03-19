package kh.finalpro.project.collegian.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.collegian.model.dto.Member;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.collegian.model.dto.Class;

@Repository
public class CollegianDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
		
	public int getListCount(Member mem) {
		
		return sqlSession.selectOne("collegianMapper.getListCount", mem);
		
	}

	public List<Class> selectClassList(Member mem, Pagination pagination) {
		
		// RowBounts 객체
		// - 마이바티스에서 페이징 처리를 위해 제공하는 객체
		// - offset만큼 건너 뛰고
		// 그 다음 지정된 행 개수(limit) 만큼 조회

		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		// 3) selectList("namespace.id" , 파라미터 , RowBounds) 호출
		return sqlSession.selectList("collegianMapper.selectClassList", mem, rowBounds);
		
	}

	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("collegianMapper.getListCount_search", paramMap);
	}

	
	
	public List<Class> selectClassList(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		// 2) RowBounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());

		// 3) selectList("namespace.id" , 파라미터 , RowBounds) 호출
		return sqlSession.selectList("collegianMapper.selectClassList_search", paramMap, rowBounds);
		
	}
	
	
	
	

}
