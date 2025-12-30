<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch05_ex09</title>
</head>
<body>
	<p><% response.setHeader("Refresh", "5"); %></p>
	<p><%= new Date() %></p>
	<p><a href="response_data.jsp">Google 홈페이지로 이동하기</a></p>
</body>
</html>