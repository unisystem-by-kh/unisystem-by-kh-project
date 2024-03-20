package kh.finalpro.project.common.intercepter;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kh.finalpro.project.admin.model.service.SubjectService;

public class DeptCodeInterceptor implements HandlerInterceptor{
	
	@Autowired
	private SubjectService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		ServletContext application = request.getServletContext();
		
		if(application.getAttribute("deptCodeList") == null) {
			
			System.out.println("학과 코드 조회 서비스 호출");
			
			List<Map<String, Object>> deptCodeList = service.selectDeptCodeList();
			
			System.out.println(deptCodeList);
			
			application.setAttribute("deptCodeList", deptCodeList);
			
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	

}
