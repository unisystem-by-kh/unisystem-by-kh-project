package kh.finalpro.project.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.admin.model.dao.EvaluationDAO;
import kh.finalpro.project.admin.model.dto.Evaluation;
import kh.finalpro.project.collegian.model.dto.Pagination;

@Service
public class EvaluationServiceImpl implements EvaluationService{
	
	@Autowired
	private EvaluationDAO dao;

	// 교수 평가 목록 조회
	@Override
	public Map<String, Object> selectLateList(int cp) {
		
		int listCount = dao.getListCount();
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Evaluation> lateList = dao.selectLateList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lateList", lateList);
		map.put("pagination", pagination);
		
		return map;
	}
	
	
}
