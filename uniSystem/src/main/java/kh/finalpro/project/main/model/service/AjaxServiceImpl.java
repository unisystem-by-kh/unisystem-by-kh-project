package kh.finalpro.project.main.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	

}
