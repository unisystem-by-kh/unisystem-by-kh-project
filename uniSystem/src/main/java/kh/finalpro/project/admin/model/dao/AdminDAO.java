package kh.finalpro.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.admin.model.dto.Admin;
import kh.finalpro.project.admin.model.dto.Student;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Lecture;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Member> selectList(String input) {
		return null;
	}

	/** 번호생성
	 * @param admin
	 * @return result
	 */
	public int saveUniqueNo(Admin admin) {
		return sqlSession.insert("adminmapper.saveUniqueNo", admin );
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

	// 학생 세부 조회 수강 과목 조회
	public List<Student> stuLecture(String memberNo) {
		return sqlSession.selectList("adminmapper.stuLecture", memberNo);
	}

	// 학생 재적 변경
	public int studentUpdate(Student memberArr) {
		return sqlSession.update("adminmapper.studentUpdate", memberArr);
	}

	public int requestUpdate(Student memberArr) {
		return sqlSession.update("adminmapper.requestUpdate", memberArr);
	}

	// 현재 수강중인 학생 수 조회
	public int getListCount() {
		return sqlSession.selectOne("adminmapper.getListCount");
	}

	// 현재 수강중인 학생 성적 목록 가져오기
	public List<Member> lectureList() {
		return sqlSession.selectList("adminmapper.lectureList");
	}

	// 수강 = 1학년 1학기 학생 목록 성적 조회 비동기 AJAX
	public List<Member> memberListOneAndOne() {
		return sqlSession.selectList("adminmapper.memberListOneAndOne");
	}

	public List<Member> memberListOneAndTwo() {
		return sqlSession.selectList("adminmapper.memberListOneAndTwo");
	}

	public List<Member> memberListTwoAndOne() {
		return sqlSession.selectList("adminmapper.memberListTwoAndOne");
	}

	public List<Member> memberListTwoAndTwo() {
		return sqlSession.selectList("adminmapper.memberListTwoAndTwo");
	}

	public List<Member> memberListThreeAndOne() {
		return sqlSession.selectList("adminmapper.memberListThreeAndOne");
	}

	public List<Member> memberListThreeAndTwo() {
		return sqlSession.selectList("adminmapper.memberListThreeAndTwo");
	}

	public List<Member> memberListFourAndOne() {
		return sqlSession.selectList("adminmapper.memberListFourAndOne");
	}

	public List<Member> memberListFourAndTwo() {
		return sqlSession.selectList("adminmapper.memberListFourAndTwo");
	}

	public List<Member> memberListNoPoint() {
		return sqlSession.selectList("adminmapper.memberListNoPoint");
	}

	public List<Member> memberListStatusY() {
		return sqlSession.selectList("adminmapper.memberListStatusY");
	}

	public List<Member> memberListAll() {
		return sqlSession.selectList("adminmapper.memberListAll");
	}



}
