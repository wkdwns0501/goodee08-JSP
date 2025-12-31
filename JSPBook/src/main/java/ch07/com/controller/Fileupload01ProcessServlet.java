package ch07.com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/fileupload01Process") // url 매핑 (폼-action 경로와 같아야함)

// 서블릿 3.0에서 도입된 파일 업로드(멀티파트 요청) 처리를 위한 어노테이션
// 이걸 선언하면 multipart/form-data 형식의 요청을 정상적으로 파싱 가능
@MultipartConfig(
//	location = "C:/wkdwns/temp", // 서버 내부 임시 폴더를 대체하는 사용자 정의 임시 폴더
	fileSizeThreshold = 1024 * 1024 * 1, 
	// 메모리 임시 저장 임계값(1MB) -> 파일을 메모리에 임시 저장할 최대 크기
	maxFileSize = 1024 * 1024 * 10, 
	// 업로드 최대 파일 크기(10MB) -> 업로드되는 개별 파일의 최대 크기
	maxRequestSize = 1024 * 1024 * 50 
	// 전체 요청 크기(50MB) -> 요청 전체(모든 파일 + 모든 일반 폼 필드)의 총합 크기
)
public class Fileupload01ProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Fileupload01ProcessServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8"); // 한글 처리를 위해 추가(생략 가능)
		response.setContentType("text/html; charset=UTF-8"); // 출력 HTML이 필요할 때 설정
		PrintWriter out = response.getWriter();
		// 서블릿이 클라이언트(브라우저)에게 HTML 응답을 직접 출력하기 위해 사용하는 객체
		
		// 1. 업로드 경로 설정(2가지 경로 실습)
		// 1) (톰캣 서버 내 프로젝트) 내부 폴더(보통 학습용/테스트용)
		// getServletContext(): 현재 웹 애플리케이션의 환경 정보를 제공하는 컨텍스트 객체를 반환
		// getRealPath("/"): 서버의 실제 디렉터리 위치의 "/" 루트 경로를 반환
//		String uploadPath = getServletContext().getRealPath("/upload");
		
		// 2) 외부 폴더(절대 경로 사용 권장, 내부 폴더보다 외부 폴더 경로 사용을 권장)
		String uploadPath = "C:/wkdwns/upload";
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		// 2-1. 일반 데이터 가져오기
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		
		// 2-2. 파일 데이터 가져오기
		// 서블릿 3.0 표준 API 사용
		// Part: 업로드된 파일 또는 폼 데이터를 표현하는 객체
		Part filePart = request.getPart("uploadFile");
		
		String fileName = filePart.getSubmittedFileName(); // 원본 파일 이름
		String contentType = filePart.getContentType(); // MIME 타입
		long fileSize = filePart.getSize(); // 파일 크기(byte)
		
		// 3. 파일 저장
//		filePart.write(uploadPath + "/" + fileName);
		filePart.write(uploadPath + File.separator + fileName); // OS에 맞는 경로를 안전하게 생성
		// fileName만 쓰면 location에 쓴 임시 경로에 저장
		
		// 4. 결과 출력
		out.println("<h2>업로드 성공(Servlet 3.0 표준)</h2>");
        out.println("<h3>업로드 결과</h3>");
        out.println("<p>이름: " + name + "</p>");
        out.println("<p>제목: " + subject + "</p>");
        out.println("<p>파일명: " + fileName + "</p>");
        out.println("<p>콘텐츠 유형: " + contentType + "</p>");
        out.println("<p>파일 크기: " + fileSize + " bytes</p>");
        out.println("<p>서버 저장 경로: " + uploadPath + "</p>");
	}

}
