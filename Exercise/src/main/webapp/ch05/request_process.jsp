<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch05_ex08</title>
</head>
<body>
	getQueryString(): <%= request.getQueryString() %><br>
	
	아이디: <%= request.getParameter("id") %><br>
	비밀번호: <%= request.getParameter("passwd") %>
</body>
</html>