<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "SELECT passwd FROM member WHERE id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next()) {
				out.println("member 테이블에 일치하는 아이디가 없습니다.");
			} else {
				String dbPasswd = rs.getString("passwd");
				if (passwd.equals(dbPasswd)) {
					sql = "UPDATE member SET name = ? WHERE id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
					out.println("member 테이블의 데이터를 수정 성공했습니다.");
				} else {
					out.println("일치하는 비밀번호가 아닙니다.");
				}
				
			}
		} catch (SQLException e) {
			out.println("member 테이블의 데이터를 수정 실패했습니다.<br>");
			out.println("SQLException: " + e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	%>
</body>
</html>