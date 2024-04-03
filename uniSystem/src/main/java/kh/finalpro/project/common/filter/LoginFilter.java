package kh.finalpro.project.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.finalpro.project.main.model.dto.Member;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter(filterName = "loginFilter",
		   urlPatterns = {"/board/*", "/admin/*", "/main", "/tuition/*", "/professor/*", "/staff/*", "/rate", "/collegian/*"})
public class LoginFilter implements Filter{

	public void init(FilterConfig filterConfig) throws ServletException {
		// 서버가 켜질 때, 필터 코드가 변경 되었을 때 필터가 생성됨
		// -> 생성 시 초기화 용도로 사용하는 메소드
//		System.out.println("--- 로그인 필터 생성 ---");
		log.info("--- 로그인 필터 생성 ---");
		
	}

	public void destroy() {
		// 필터 코드가 변경 되었을 때

		// 변경 이전 필터를 파괴하는 메소드
//		System.out.println("--- 이전 로그인 필터 파괴 ---");
		log.info("--- 이전 로그인 필터 파괴 ---");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 필터링 코드를 작성하는 메소드

		// 1) ServletRequest, ServletResponse 다운캐스팅
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;

		// 2) HttpServletRequest를 이용해서 HttpSession 얻어오기
		HttpSession session = req.getSession();
		
		// 3) session에서 "loginMember" key를 가진 속성을 얻어와
		//	  null인 경우 메인페이지로 redirect 시키기
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember != null) {
			
			switch (loginMember.getMemberNo().substring(0,2)) {
			case "01" :
				if(req.getRequestURI().startsWith("/admin/") || req.getRequestURI().startsWith("/professor/") 
						|| req.getRequestURI().startsWith("/professor/") || req.getRequestURI().startsWith("/professor/")) {
					session.setAttribute("filterMessage", "접근 제한이 없습니다.");
					resp.sendRedirect("/main");
					return;
				}
				break;

			default:
				break;
			}
			
			
		} else {
			session.setAttribute("filterMessage", "로그인 후 이용해주세요.");
			resp.sendRedirect("/");
		}

		/* 응용
				Member loginMember = (Member)session.getAttribute("loginMember");
				if(loginMember.getAuthority() != 2) { // 관리자가 아니면 메인페이지로
					resp.sendRedirect("/");
				}
		 */

		// 4) 로그인 상태인 경우 다음 필터 또는
		//	  DispatcherServlet으로 전달
		chain.doFilter(request, response);
	}

}
