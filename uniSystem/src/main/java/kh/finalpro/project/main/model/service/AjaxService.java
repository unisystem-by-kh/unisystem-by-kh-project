package kh.finalpro.project.main.model.service;

import java.util.List;

import kh.finalpro.project.board.model.dto.Board;

public interface AjaxService {

	
	/** 이메일 중복 검사
	 * @param memberEmail
	 * @return count
	 */
	int checkEmail(String email);

	/** 회원 번호로 미리 생성되어 있는 정보 가져오기
	 * @param number
	 * @return infoList
	 */
	String selectInfo(String number);

	
	/** 메인페이지 공지사항 목록 노출
	 * @return list
	 */
	List<Board> selectAnnouncement();

}
