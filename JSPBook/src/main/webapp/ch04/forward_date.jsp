<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - Forward</title>
</head>
<body>
	<p>오늘의 날짜 및 시간</p>
	<p><%= LocalDateTime.now() %></p>
</body>
</html>