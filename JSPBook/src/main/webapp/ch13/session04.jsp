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
	<!-- 세션에 저장된 속성 삭제하기1 -->
	<h4>----- 세션을 삭제하기 전 -----</h4>
	<%
		String user_id = (String) session.getAttribute("userId");
		String user_pw = (String) session.getAttribute("userPw");
		
		out.println("설정된 세션: " + user_id + "<br>");
		out.println("설정된 세션: " + user_pw + "<br>");	
		
		session.removeAttribute("userId");
	%>
	<h4>----- 세션을 삭제한 후 -----</h4>
	<%
		user_id = (String) session.getAttribute("userId");
		user_pw = (String) session.getAttribute("userPw");
		
		out.println("설정된 세션: " + user_id + "<br>");
		out.println("설정된 세션: " + user_pw + "<br>");	
	%>
	
</body>
</html>