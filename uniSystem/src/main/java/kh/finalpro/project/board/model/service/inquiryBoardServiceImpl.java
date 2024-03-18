package kh.finalpro.project.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kh.finalpro.project.board.model.dao.inquiryBoardDAO;

@Service
public class inquiryBoardServiceImpl implements inquiryBoardService{
	
	private inquiryBoardDAO dao;

	@Override
	public List<Map<String, Object>> selectBoardType() {
		return dao.selectBoardType();
	}
	
}
