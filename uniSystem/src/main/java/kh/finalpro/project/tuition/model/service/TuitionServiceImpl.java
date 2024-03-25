package kh.finalpro.project.tuition.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.tuition.model.dao.TuitionDAO;
import kh.finalpro.project.tuition.model.dto.Tuition;

@Service
public class TuitionServiceImpl implements TuitionService{
	
	
	@Autowired
	private TuitionDAO dao;

	@Override
	public int tuitionInsert(Tuition tuition) {
		return dao.tuitionInsert(tuition);
	}

	@Override
	public int tuition(String memberNo) {
		return dao.tuition(memberNo);
	}

}
