package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

// 필터 처리로 콘솔에 로그 기록하기
@WebFilter("/*")
public class LogFilter extends HttpFilter implements Filter {
       
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("BookMarket 필터 초기화...");
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("==========================================================");
		long start = System.currentTimeMillis();
		System.out.println("접속한 클라이언트 IP: " + request.getRemoteAddr());
		System.out.println("접근한 URL 경로: " + getURLPath(request));
		System.out.println("요청 처리 시작 시각: " + getCurrentTime());
		
		chain.doFilter(request, response);
		
		long end = System.currentTimeMillis();
		System.out.println("요청 처리 종료 시각: " + getCurrentTime());
		System.out.println("요청 처리 소요 시각: " + (end - start) + "ms");
		System.out.println("==========================================================");
	}
	
	
	private String getURLPath(ServletRequest request) {
		if (request instanceof HttpServletRequest req) {
			String currentPath = req.getRequestURI();
			String queryString = req.getQueryString();
			return (queryString == null) ? currentPath : currentPath + "?" + queryString;
		}
		return "";
	}
	
	private String getCurrentTime() {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		return dateTime.format(formatter);
	}

	public void destroy() {
		System.out.println("BookMarket 필터 해제...");
	}
	
    public LogFilter() {
        super();
    }

}
