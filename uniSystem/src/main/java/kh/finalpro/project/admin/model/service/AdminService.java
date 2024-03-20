package kh.finalpro.project.admin.model.service;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;

import com.google.api.services.calendar.model.Event;

import kh.finalpro.project.main.model.dto.Member;

public interface AdminService {

	List<Member> selectList(String input);

	// 추후 수정 예정
//	void createEvent(Event event) throws IOException, GeneralSecurityException;

}
