package kh.finalpro.project.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.finalpro.project.admin.model.dto.Evaluation;
import kh.finalpro.project.collegian.model.dto.Pagination;
import kh.finalpro.project.main.model.dto.Member;

@Repository
public class EvaluationDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 평가 목록 갯수 카운트(교직원)
	 * @return listCount
	 */ 
	public int getListCount() {
		return sqlSession.selectOne("evaluationMapper.getListCount");
	}

	/** 평가 목록 조회(교직원)
	 * @param pagination
	 * @return map
	 */
	public List<Evaluation> selectRateList(Pagination pagination) {

		int offset
		= (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("evaluationMapper.selectRateList", pagination, rowBounds);
	}

	/** 평가 목록 갯수 카운트 (교수)
	 * @param loginMember
	 * @return listCount
	 */
	public int getListCount(Member loginMember) {
		return sqlSession.selectOne("evaluationMapper.listCount", loginMember);
	}

	
	/** 평가 목록 조회 (교수)
	 * @param pagination
	 * @param loginMember
	 * @return
	 */
	public List<Evaluation> selectRateList(Pagination pagination, Member loginMember) {
		
		int offset
		= (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("evaluationMapper.RateList",loginMember, rowBounds);
	}

	/** 교수가 가지고 있는 교과목 조회
	 * @param loginMember
	 * @return classList
	 */
	public List<Evaluation> selectClassList(Member loginMember) {
		return sqlSession.selectList("evaluationMapper.selectClassList", loginMember);
	}

	/** 평가 목록 조회(교수, 검색어) 갯수 조회
	 * @param paramMap
	 * @return listCount
	 */
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("evaluationMapper.searchListCount", paramMap);
	}

	/** 평가 목록 조회(교수, 검색어)
	 * @param pagination
	 * @param paramMap
	 * @return rateList
	 */
	public List<Evaluation> selectRateList(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset
		= (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("evaluationMapper.searchRateList",paramMap, rowBounds);
	}

	/** 교수가 가지고 있는 과목 목록 조회
	 * @param paramMap
	 * @return classList
	 */
	public List<Evaluation> selectClassList(Map<String, Object> paramMap) {
		return sqlSession.selectList("evaluationMapper.selectClassList", paramMap);
	}

	/** 과목 평가가 있는 과목 목록 조회
	 * @return classList
	 */
	public List<Evaluation> selectclassList() {
		return sqlSession.selectList("evaluationMapper.classList");
	}

}
