<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attribute Test</title>
</head>
<body>
	<!-- page 영역과 request 영역 비교 -->
	<%
		pageContext.setAttribute("pageScope", "pageValue");
		request.setAttribute("requestScope", "requestValue");
	%>
	
	pageValue = <%= pageContext.getAttribute("pageScope") %><br>
	requestValue = <%= request.getAttribute("requestScope") %>
</body>
</html>