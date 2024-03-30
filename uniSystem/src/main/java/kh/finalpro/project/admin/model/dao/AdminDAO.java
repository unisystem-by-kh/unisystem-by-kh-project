package kh.finalpro.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.admin.model.dto.Admin;
import kh.finalpro.project.admin.model.dto.Student;
import kh.finalpro.project.main.model.dto.Member;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Member> selectList(String input) {
		return sqlSession.selectList("");
	}

	/** 번호생성
	 * @param admin
	 * @return result
	 */
	public int saveUniqueNo(Admin admin) {
		
		int result = sqlSession.insert("adminmapper.saveUniqueNo", admin );
		
		
		return result;
	}
	

	/** 학생 정보 조회
	 * @return
	 */
	public List<Student> selectStudentList() {
		return sqlSession.selectList("adminmapper.selectStudentList");
	}


}
