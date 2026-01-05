package ch12.com.filter;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpFilter;

//@WebFilter("/LogFileFilter")
public class LogFileFilter extends HttpFilter implements Filter {
	PrintWriter writer;
	
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("LogFileFilter 초기화...");
		
		String filename = fConfig.getInitParameter("filename");
//		System.out.println(filename); // c:\\wkdwns\\logs\\monitor.log
		
		String folderpath = filename.substring(0,filename.lastIndexOf("\\"));
//		System.out.println(folderpath); // c:\\wkdwns\\logs\
		
		File file = new File(folderpath);
		if (!file.exists()) file.mkdirs();
		
		if (filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");
		}
		
		try {					 
			// 파일에 쓸 수 있는 문자 스트림을 만들고, 그 위에 출력 편의 기능을 덧씌움
								 // 보조 스트림  // 메인 스트림
			writer = new PrintWriter(new FileWriter(filename, true)); 
												// true: 기존 파일 끝에 새로운 내용 추가
		} catch (IOException e) {				// false: 새롭게 덮어쓰기 (기본값)
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("LogFileFilter 수행...");
		
		writer.println("현재일시: " + getCurrentTime());
		
		String clientAddr = request.getRemoteAddr();
		writer.println("클라이언트 주소: " + clientAddr);
		
		chain.doFilter(request, response);
		
		String contentType = response.getContentType();
		writer.println("문서의 콘텐츠 유형: " + contentType);
		writer.println("---------------------------------------------------------");
		writer.flush();
	}
	
	private String getCurrentTime() {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		return dateTime.format(formatter);
	}

	public void destroy() {
		System.out.println("LogFileFilter 해제...");
		writer.close();
	}

}
