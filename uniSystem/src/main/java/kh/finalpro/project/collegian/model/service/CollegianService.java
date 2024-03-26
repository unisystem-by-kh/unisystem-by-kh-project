package kh.finalpro.project.collegian.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.finalpro.project.collegian.model.dto.Class;
import kh.finalpro.project.main.model.dto.Member;

public interface CollegianService {

	Map<String, Object> selectClassList(Member mem, int cp);

	Map<String, Object> searchClassList(Map<String, Object> paramMap, int cp);

	Map<String, Object> searchLecture(Map<String, Object> paramMap);

	Map<String, Object> selectLecture(Member mem);

	int insertMyClass(String[] classNoList, Member mem);

	List<Class> selectMyClasses(Member mem);

	int deleteMyClass(Map<String, Object> map);

	Map<String,Object> selectTaskList(Member loginMember);

	int insertTask(Member loginMember, int taskNo, MultipartFile file, String webPath, String filePath) throws IllegalStateException, IOException  ;

}
