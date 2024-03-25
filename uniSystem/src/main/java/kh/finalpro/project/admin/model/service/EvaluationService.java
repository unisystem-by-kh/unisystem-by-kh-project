package kh.finalpro.project.admin.model.service;

import java.util.Map;

import kh.finalpro.project.main.model.dto.Member;

public interface EvaluationService {

	/** 평가 목록 조회(교직원)
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectLateList(int cp);

	/** 평가 목록 조회(교수)
	 * @param cp
	 * @param loginMember
	 * @return map
	 */
	Map<String, Object> selectLateList(int cp, Member loginMember);

	/** 평가 목록 조회(교수, 검색어)
	 * @param cp
	 * @param paramMap
	 * @return map
	 */
	Map<String, Object> selectLateList(int cp, Map<String, Object> paramMap);

}
