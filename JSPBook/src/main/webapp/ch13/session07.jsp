<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<!-- 세션 유효 시간 출력하기 -->
	<h4>----- 세션 유효 시간 변경 전 -----</h4>
	<%
		int time = session.getMaxInactiveInterval() / 60; // (초 단위라서)분 단위로 환산
		
		out.println("세션 유효 시간: " + time + "분<br>");
	%>
	<h4>----- 세션 유효 시간 변경 후 -----</h4>
	<%
		session.setMaxInactiveInterval(60 * 60); // 초 단위 (60분으로 설정)
		// session.setMaxInactiveInterval(5); // 5초로 테스트
		time = session.getMaxInactiveInterval() / 60;
		
		out.println("세션 유효 시간: " + time + "분<br>");
	%>
</body>
</html>