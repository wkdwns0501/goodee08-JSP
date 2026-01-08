<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 삭제</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 도서 삭제 페이지 만들기 -->
	<%@ include file="dbconn.jsp" %>
	<%
		String bookId = request.getParameter("id");
		String sql = "DELETE FROM book WHERE b_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			int result = pstmt.executeUpdate();
			if (result == 0) {
				out.println("일치하는 도서가 없습니다.");
			} else {
				response.sendRedirect("editBook.jsp?edit=delete");
			}
		} catch (SQLException e) {
			out.println("SQLException: " + e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	%>
</body>
</html>