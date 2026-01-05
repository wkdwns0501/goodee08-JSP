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

//@WebFilter("/InitParamFilter")
public class InitParamFilter extends HttpFilter implements Filter {
    private FilterConfig filterConfig = null;   
	
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("InitParamFilter 초기화...");
		this.filterConfig = fConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("InitParamFilter 수행...");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		String param1 = filterConfig.getInitParameter("param1");
		String param2 = filterConfig.getInitParameter("param2");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		String message;
		
		if (id.equals(param1) && passwd.equals(param2)) {
			message = "로그인 성공";
		} else {
			message = "로그인 실패";
		}
		
		writer.println(message);
		
		chain.doFilter(request, response);
	}
	
	public void destroy() {
		System.out.println("InitParamFilter 해제...");
	}

}
