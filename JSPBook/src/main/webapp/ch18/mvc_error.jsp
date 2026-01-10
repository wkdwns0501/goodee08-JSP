<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<p>로그인 실패!</p>
	<p>${requestScope.error}</p>
	<%@ include file="mvc.jsp" %>
</body>
</html>