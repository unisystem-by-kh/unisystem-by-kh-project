package kh.finalpro.project.tuition.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalpro.project.tuition.model.dao.TuitionDAO;

@Service
public class TuitionServiceImpl implements TuitionService{
	
	
	@Autowired
	private TuitionDAO dao;

}
