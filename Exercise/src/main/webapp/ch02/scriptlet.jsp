<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch02_ex08</title>
</head>
<body>
	<%! Date date = new Date(); %>
	<% out.println(date); %>
</body>
</html>