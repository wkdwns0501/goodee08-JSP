<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<!-- 선언문 태그로 전역 메소드 사용하기1 -->	
	<%!
		int sum(int a, int b) {
			return a + b;
		}
	%>
	
	<%
		out.println("2 + 3 = " + sum(2, 3));
	%>
	
</body>
</html>