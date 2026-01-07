package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.BookRepository;
import dto.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.DBUtil;

@WebServlet("/processAddBook")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 10, // 10MB
	maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ProcessAddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProcessAddBookServlet() {
        super();
    }

//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		
		// 일반 텍스트 데이터 처리
		String bookId = request.getParameter("bookId");
		String name = request.getParameter("name");
		String unitPrice = request.getParameter("unitPrice");
		String author = request.getParameter("author");
		String publisher = request.getParameter("publisher");
		String releaseDate = request.getParameter("releaseDate");	
		String description = request.getParameter("description");	
		String category = request.getParameter("category");
		String unitsInStock = request.getParameter("unitsInStock");
		String condition = request.getParameter("condition");
		
		int price = 0;
		if (unitPrice != null && !unitPrice.isEmpty()) { 
			price = Integer.parseInt(unitPrice);
		}
		
		long stock = 0;
		if (unitsInStock != null && !unitsInStock.isEmpty()) {
			stock = Long.parseLong(unitsInStock);
		}
		
		// 파일 업로드 처리
		Part filePart = request.getPart("bookImage");
		String fileName = "";
		
		if (filePart != null && filePart.getSize() > 0) {
			// 파일 이름 가져오기
			fileName = filePart.getSubmittedFileName();
			
			// 업로드 폴더 경로
			// 외부 업로드 폴더 사용
			String uploadPath = "C:/wkdwns/upload";
			// JSP 페이지에서 /images/파일명으로 접근하려면 톰캣 설정(외부 폴더 매핑)을 추가해야함 
			// server.xml(서버 전역) 또는 context.xml(프로젝트 개별)에 설정
			
			// 업로드 폴더가 없으면 생성
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			
			// 파일 저장
			filePart.write(uploadPath + File.separator + fileName);
		}
		
		// Book 객체 생성 및 저장 (DB 없는 버전)
		/*
		 * Book newBook = new Book(); newBook.setBookId(bookId); newBook.setName(name);
		 * newBook.setUnitPrice(price); newBook.setAuthor(author);
		 * newBook.setPublisher(publisher); newBook.setReleaseDate(releaseDate);
		 * newBook.setDescription(description); newBook.setCategory(category);
		 * newBook.setUnitsInStock(stock); newBook.setCondition(condition);
		 * newBook.setFilename(fileName); // 이미지 이름 저장(상대 경로로 JSP 페이지에서 접근하기 위해)
		 * 
		 * BookRepository dao = BookRepository.getInstance(); dao.addBook(newBook);
		 */
		
		// 도서 등록 처리 DB 연동
//		Connection conn = null;
//		PreparedStatement pstmt = null;
		String sql = "INSERT INTO book (b_id, b_name, b_unitPrice, b_author, b_description, b_publisher, b_category, b_unitsInStock, b_releaseDate, b_condition, b_fileName) "
				+ "VALUES (?, ?, ?, ?, ? ,?, ?, ?, ? ,? ,?)";
		
//		try {
//			conn = DBUtil.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, bookId);
//			pstmt.setString(2, name);
//			pstmt.setInt(3, price);
//			pstmt.setString(4, author);
//			pstmt.setString(5, description);
//			pstmt.setString(6, publisher);
//			pstmt.setString(7, category);
//			pstmt.setLong(8, stock);
//			pstmt.setString(9, releaseDate);
//			pstmt.setString(10, condition);
//			pstmt.setString(11, fileName);
//			pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.close(pstmt, conn);
//		}
		
		// try-with-resources 적용
		try (Connection conn = DBUtil.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, bookId);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, author);
			pstmt.setString(5, description);
			pstmt.setString(6, publisher);
			pstmt.setString(7, category);
			pstmt.setLong(8, stock);
			pstmt.setString(9, releaseDate);
			pstmt.setString(10, condition);
			pstmt.setString(11, fileName);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		//등록 후 도서 목록 페이지로 리다이렉트
		response.sendRedirect("books.jsp");
	}

}
