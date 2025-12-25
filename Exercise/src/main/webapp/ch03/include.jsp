<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch03_ex09</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	현재 시간: <%= Calendar.getInstance().getTime() %>
</body>
</html>