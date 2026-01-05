package ch12.com.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet Filter implementation class AuthenFilter
 */
//@WebFilter("/AuthenFilter") // 웹필터 어노테이션: xml 파일 쓸때는 사용X
public class AuthenFilter extends HttpFilter implements Filter {
       
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("AuthenFilter 초기화...");
	}
	
	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("filter01_process.jsp 처리 전 필터 수행...");
		
		String name = request.getParameter("name");
		
		if (name == null || name.isBlank()) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			writer.println("입력된 name 값은 null 입니다.");
			return; // 차단 목적일 때는 반드시 return
		}
		
		// 연속적으로 필터가 있으면 다음 필터로 제어를 넘기도록 작성
		// 마지막 필터이면 리소스(JSP/서블릿)를 호출
		chain.doFilter(request, response);
		
		System.out.println("filter01_process.jsp 처리 후 필터 수행...");
	}
	
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// 서버 정상 종료나 웹 애플리케이션 재배포 시 호출됨
		System.out.println("AuthenFilter 해제...");
		// 사용 예: DB 연결 해제, 파일 스트림 닫기 등
	}
	
    /**
     * @see HttpFilter#HttpFilter()
     */
    public AuthenFilter() {
        super();
    }

	

	

	

}
