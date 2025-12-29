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
	<!-- 
		page 영역과 request 영역 비교 
		포워드 기능을 이용해서 다른 페이지로 이동
		=> 기존 page 영역은 소멸하고 request 영역은 유지
	-->
	<%
		pageContext.setAttribute("pageScope", "pageValue");
		request.setAttribute("requestScope", "requestValue");
	%>
	
	<jsp:forward page="attributeTest5_result.jsp"/>
</body>
</html>