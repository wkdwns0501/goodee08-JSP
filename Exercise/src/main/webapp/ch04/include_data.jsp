<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch04_ex09</title>
</head>
<body>
	<% 
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("num", num);
	%>
	<c:forEach var="i" begin="1" end="9" step="1">
		${num} X ${i} = ${num*i} <br>
	</c:forEach>
</body>
</html>