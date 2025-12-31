package ch07.com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/fileuploadProcess")
@MultipartConfig(
//		location = "C:/upload",
		fileSizeThreshold = 1024 * 1024 * 1, 
		maxFileSize = 1024 * 1024 * 10, 
		maxRequestSize = 1024 * 1024 * 50 
)
public class FileuploadProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FileuploadProcessServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		String uploadPath = "c:/wkdwns/upload";
		
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) uploadDir.mkdirs();
		
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		
		Collection<Part> fileParts = request.getParts();
		for (Part part : fileParts) {
			String originalName = part.getSubmittedFileName();
			
			if (originalName == null || originalName.isEmpty()) continue;
			
			int extensionIdx = originalName.lastIndexOf(".");
			if (extensionIdx == -1) {
				out.println("파일 중 확장자가 없는 파일이 있어 업로드에 실패했습니다.");
				return;
			}
			String extension = originalName.substring(extensionIdx);
			
			String fileName = UUID.randomUUID().toString() + extension;
			
			part.write(uploadPath + File.separator + fileName);
			out.println("업로드된 파일: " + fileName + "<br>");
			
			// (참고) multiple 속성을 사용하여 하나의 input으로 여러 개의 파일을 업로드 시
			// 같은 name(예: uploadFiles)으로 서버에 전송됨
			// getParts()로 모든 Part를 받고, 파일 항목들을 순회하면서 저장
		}
	}

}
