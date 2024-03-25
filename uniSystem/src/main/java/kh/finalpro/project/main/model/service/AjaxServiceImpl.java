package kh.finalpro.project.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.board.model.dto.Board;
import kh.finalpro.project.main.model.dao.AjaxDAO;

@Service
public class AjaxServiceImpl implements AjaxService{
	
	@Autowired
	private AjaxDAO dao;

	// 이메일 중복 검사
	@Override
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}

	// 회원 번호로 미리 생성되어 있는 정보 가져오기
	@Override
	public String selectInfo(String number) {
		return dao.selectInfo(number);
	}

	@Override
	public List<Board> selectAnnouncement() {
		return dao.selectAnnouncement();
	}
	
	

}
