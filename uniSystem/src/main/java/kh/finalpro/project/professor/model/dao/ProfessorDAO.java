package kh.finalpro.project.professor.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.board.model.dao.BoardDAO;
import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.main.model.dto.Member;
import kh.finalpro.project.professor.model.dto.Lecture;
import kh.finalpro.project.professor.model.dto.Professor;
import kh.finalpro.project.professor.model.dto.Task;

@Repository
public class ProfessorDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 재학중인 학생 수 조회
	public int getListCount() {
		return sqlSession.selectOne("professorMapper.getListCount");
	}

	// 재학중인 학생 목록 조회
	public List<Professor> selectStudent() {
		return sqlSession.selectList("professorMapper.selectStudent");
	}

	// 재학중인 학생 수 조회 - 검색
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("professorMapper.getListCount_search", paramMap);
	}
	
	// 재학중인 학생 목록 조회 - 검색
	public List<Professor> searchStudent(Map<String, Object> paramMap) {
		return sqlSession.selectList("professorMapper.searchStudent", paramMap);
	}

	// 학생이 수강중인 수강 목록 조회
	public List<Lecture> lectureList() {
		return sqlSession.selectList("professorMapper.lectureList");
	}

	// 모든 학생 조회
	public List<Professor> selectMemberList() {
		return sqlSession.selectList("professorMapper.selectMemberList");
	}

	public List<Professor> searchMemberList(Map<String, Object> paramMap) {
		return sqlSession.selectList("professorMapper.searchMemberList", paramMap);
	}

	public List<Professor> searchMember(Map<String, Object> paramMap) {
		return sqlSession.selectList("professorMapper.searchMember", paramMap);
	}

	public List<Professor> departmentList() {
		return sqlSession.selectList("professorMapper.departmentList");
	}

	public List<Professor> classList() {
		return sqlSession.selectList("professorMapper.classList");
	}

	public int updateGrades(List<Map<String, Object>> gradesList) {
		
		int result = 0;
		
		for (Map<String, Object> gradeMap : gradesList) {
			
		    String memberNo = (String)gradeMap.get("memberNo");
		    String lectureGrade = (String)gradeMap.get("lectureGrade");
		    String lectureTerm = (String)gradeMap.get("lectureTerm");
		    String classNo = (String)gradeMap.get("classNo");
		    String lecturePoint = (String)gradeMap.get("lecturePoint");
		    
		    result = sqlSession.update("professorMapper.updateGrades" , gradeMap);
		    
		}
		
		return result;
	}

	public List<Task> selectTaskList(Member loginMember) {
		
		return sqlSession.selectList("professorMapper.selectTaskList", loginMember);
	}

	public List<Class> selectClassList(Member loginMember) {
		return sqlSession.selectList("professorMapper.selectClassList", loginMember);
	}

	// 과제 등록
	public int insertTask(Task task, Member loginMember) {
		
		task.setMemberNo(loginMember.getMemberNo());
		
		return sqlSession.insert("professorMapper.insertTask", task);
	}

	// 과제 파일 등록
	public int uploadTask(Task task) {
		System.out.println(task);
		return sqlSession.insert("professorMapper.uploadTask", task);
	}

	// 과제 목록 삭제
	public int taskListDelete(int taskNo) {
		return sqlSession.delete("professorMapper.taskListDelete", taskNo);
	}

	// 과제 파일 삭제
	public int taskFileDelete(int taskNo) {
		return sqlSession.delete("professorMapper.taskFileDelete", taskNo);
	}


	
	
	
	
	
}
