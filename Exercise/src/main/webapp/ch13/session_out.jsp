<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch13_ex09</title>
</head>
<body>
	<%
		session.invalidate();
		response.sendRedirect("session.jsp");
	%>
</body>
</html>