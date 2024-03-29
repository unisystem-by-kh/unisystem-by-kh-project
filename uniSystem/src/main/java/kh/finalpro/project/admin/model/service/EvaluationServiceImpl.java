package kh.finalpro.project.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.admin.model.dao.EvaluationDAO;
import kh.finalpro.project.admin.model.dto.Evaluation;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.main.model.dto.Member;

@Service
public class EvaluationServiceImpl implements EvaluationService{
	
	@Autowired
	private EvaluationDAO dao;

	// 교수 평가 목록 조회(교직원)
	@Override
	public Map<String, Object> selectRateList(int cp) {
		
		int listCount = dao.getListCount();
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Evaluation> lateList = dao.selectRateList(pagination);
		
		List<Evaluation> classList = dao.selectclassList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lateList", lateList);
		map.put("pagination", pagination);
		map.put("classList", classList);
		
		return map;
	}
	
	// 교수 평가 목록 조회(교수)
	@Override
	public Map<String, Object> selectRateList(int cp, Member loginMember) {
		
		int listCount = dao.getListCount(loginMember);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Evaluation> lateList = dao.selectRateList(pagination, loginMember);
		
		// 교수가 가지고 있는 과목 가져오기
		List<Evaluation> classList = dao.selectClassList(loginMember);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lateList", lateList);
		map.put("pagination", pagination);
		map.put("classList", classList);
		
		return map;
	}
	
	// 교수 평가 목록 조회 (교수, 검색)
	@Override
	public Map<String, Object> selectRateList(int cp, Map<String, Object> paramMap) {
		
		int listCount = dao.getListCount(paramMap);
		
		Pagination pagination = new Pagination(cp, listCount);
		
		List<Evaluation> lateList = dao.selectRateList(pagination, paramMap);
		
		List<Evaluation> classList; 
				
		if(paramMap.get("memberNo") != null) {
			
			// 교수가 가지고 있는 과목 가져오기
			classList = dao.selectClassList(paramMap);
			
		}else {
			
			classList = dao.selectclassList();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lateList", lateList);
		map.put("pagination", pagination);
		map.put("classList", classList);
		
		
		return map;
	}
	
	
}
