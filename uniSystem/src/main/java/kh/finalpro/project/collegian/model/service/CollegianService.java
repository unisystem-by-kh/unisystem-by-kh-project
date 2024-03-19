package kh.finalpro.project.collegian.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import kh.finalpro.project.collegian.model.dto.Member;

public interface CollegianService {

	Map<String, Object> selectClassList(Member mem, int cp);

	Map<String, Object> searchClassList(Map<String, Object> paramMap, int cp);

}
