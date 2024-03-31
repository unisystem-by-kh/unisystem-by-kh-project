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

	// 학생 진급, 등록금 테이블에 납부 정보 삭제
	public int demotion(Student memberNo) {
		int result = 0;
		
		if(memberNo.getMemberGrade() == 4 && memberNo.getMemberTerm() == 2) { // 회원이 4학년 2학기 일 때
			result = sqlSession.update("adminmapper.graduation", memberNo);
		}else {
			
			result = sqlSession.update("adminmapper.demotion", memberNo);
			if(result > 0) {
				result = sqlSession.delete("adminmapper.deletePay", memberNo);
			}
		}
		
		
		return result;
	}

	public Student studentDetail(String memberNo) {
		return sqlSession.selectOne("adminmapper.studentDetail", memberNo);
	}


}
