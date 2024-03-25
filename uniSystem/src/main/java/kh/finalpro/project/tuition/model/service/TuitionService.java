package kh.finalpro.project.tuition.model.service;

import org.springframework.beans.factory.annotation.Autowired;

import kh.finalpro.project.tuition.model.dto.Tuition;

public interface TuitionService {

	int tuitionInsert(Tuition tuition);

	int tuition(String memberNo);
	
	

}
