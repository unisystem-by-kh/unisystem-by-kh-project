package kh.finalpro.project.collegian.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.collegian.model.dto.Member;

public interface CollegianService {

	Map<String, Object> selectClassList(Member mem, int cp);

	Map<String, Object> searchClassList(Map<String, Object> paramMap, int cp);

	Map<String, Object> searchLecture(Map<String, Object> paramMap, int cp);

	Map<String, Object> selectLecture(Member mem, int cp);

	int insertMyClass(String[] classNoList, Member mem);

	List<Class> selectMyClasses(Member mem);

}
