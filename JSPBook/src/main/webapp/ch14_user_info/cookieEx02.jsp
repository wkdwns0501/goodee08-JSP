<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie를 이용한 화면 설정 예제</title>
</head>
<body>
	<%
		Cookie cookie = new Cookie("language", request.getParameter("language"));
		cookie.setMaxAge(60 * 60 * 24); // 유효 시간을 24시간으로
		response.addCookie(cookie);
		response.sendRedirect("cookieEx01.jsp");
	%>
	
</body>
</html>