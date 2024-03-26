package kh.finalpro.project.admin.model.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;

import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;

import com.google.api.client.json.gson.GsonFactory;

//import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.CalendarScopes;
import com.google.api.services.calendar.model.Event;

import kh.finalpro.project.admin.model.dao.AdminDAO;
import kh.finalpro.project.admin.model.dto.Admin;
import kh.finalpro.project.main.model.dto.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	@Override
	public List<Member> selectList(String input) {
		return dao.selectList(input);
	}

	@Override
	public int saveUniqueNo(Admin admin) {
		// TODO Auto-generated method stub
		return dao.saveUniqueNo(admin);
	}

	
	


	

	
	// 추후 수정 예정
	
	/*
	private final String APPLICATION_NAME = "Your Application Name"; // 애플리케이션 이름
    private final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance(); // JSON Factory
    		// JacksonFactory.getDefaultInstance(); // 더이상 사용되지 않는 코드여서 위의 코드로 교체
     
    
    private final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport(); // HTTP Transport
    private final String CALENDAR_ID = "primary"; // 캘린더 ID

    // Google Calendar 서비스를 초기화하여 반환
    private Calendar getService() throws GeneralSecurityException, IOException {
        GoogleCredential credential = GoogleCredential.fromStream(
                new FileInputStream("path/to/your/credentials.json")) // 자격 증명 파일의 경로
                .createScoped(Collections.singletonList(CalendarScopes.CALENDAR));
        return new Calendar.Builder(HTTP_TRANSPORT, JSON_FACTORY, credential)
                .setApplicationName(APPLICATION_NAME)
                .build();
    }
	
	// 이벤트 생성
    public void createEvent(Event event) throws IOException, GeneralSecurityException {
        getService().events().insert(CALENDAR_ID, event).execute();
    }
    */
	
}
