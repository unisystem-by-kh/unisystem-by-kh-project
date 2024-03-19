package kh.finalpro.project.admin.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.finalpro.project.admin.model.dao.SubjectDAO;
import kh.finalpro.project.admin.model.dto.Subject;

@Service
public class SubjectServiceImpl implements SubjectService{
	
	@Autowired
	private SubjectDAO dao;
	
	// 교과목 등록
	@Override
	@Transactional
	public int insertSubject(Subject inputClass) {
		
		// 담당교수 번호 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberName", inputClass.getProfessor());
		map.put("departmentNo", inputClass.getDepartmentNo());
		
		String memberNo = dao.selectProfessor(map);
		
		if(memberNo != null) {
			inputClass.setMemeberNo(memberNo);
		}
		
		return dao.insertSubject(inputClass);
	}

}