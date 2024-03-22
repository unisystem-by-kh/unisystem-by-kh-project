package kh.finalpro.project.professor.model.service;

import java.util.List;

import kh.finalpro.project.professor.model.dto.Lecture;

public interface AjaxService {

	List<Lecture> selectLecture(String memberNo);

}
