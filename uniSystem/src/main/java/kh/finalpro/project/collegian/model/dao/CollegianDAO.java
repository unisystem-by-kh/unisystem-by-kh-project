package kh.finalpro.project.collegian.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.collegian.model.dto.Department;

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

	public List<Department> selectDepartmentList() {
		return sqlSession.selectList("collegianMapper.selectDepartmentList");
	}

	public List<Class> selectLecture(Member mem) {
		
//		// 1) offset 계산
//		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
//
//		// 2) RowBounds 객체 생성
//		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("collegianMapper.selectLecture",mem);
	}

	public List<Class> searchLecture( Map<String, Object> paramMap) {
		
		return null;
	}

	public int insertMyClass(Map<String, Object> map) {
		
		return sqlSession.insert("collegianMapper.insertMyClass",map);
	}

	public List<Class> selectMyClasses(Member mem) {
		
		return sqlSession.selectList("collegianMapper.selectMyClasses",mem);
	}

	public int deleteMyClass(Map<String, Object> map) {
		return sqlSession.delete("collegianMapper.deleteMyClass", map);
	}

	public int checkClassMax(Map<String, Object> map) {
		return sqlSession.selectOne("collegianMapper.checkClassMax", map);
	}
	

}
