<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이 설정을 해야 exception 메서드를 사용할 수 있음 -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<p>오류가 발생하였습니다.</p>
	<p>예외 유형(클래스명): <%= exception.getClass().getName() %></p>
	<p>예외 메시지: <%= exception.getMessage() %></p>
	<p>예외 유형 + 메시지: <%= exception.toString() %></p>
</body>
</html>