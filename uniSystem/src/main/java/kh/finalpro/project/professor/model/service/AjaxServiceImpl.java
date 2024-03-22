package kh.finalpro.project.professor.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.professor.model.dao.AjaxDAO;
import kh.finalpro.project.professor.model.dto.Lecture;

@Service
public class AjaxServiceImpl implements AjaxService{

	@Autowired
	private AjaxDAO dao;

	@Override
	public List<Lecture> selectLecture(String memberNo) {
		return dao.selectLecture(memberNo);
	}
	
}
