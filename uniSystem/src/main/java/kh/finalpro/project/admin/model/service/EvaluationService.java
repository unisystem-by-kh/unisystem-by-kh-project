package kh.finalpro.project.admin.model.service;

import java.util.Map;

public interface EvaluationService {

	/** 평가 목록 조회
	 * @param cp
	 * @return map
	 */
	Map<String, Object> selectLateList(int cp);

}
