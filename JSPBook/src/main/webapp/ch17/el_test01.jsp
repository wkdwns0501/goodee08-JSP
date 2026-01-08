<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체 사용 예제</title>
</head>
<body>
	<%
		session.setAttribute("test", "Session Test");
	%>
	<form action="el_test02.jsp">
		<p>이름: <input type="text" name="name" value="홍길동"></p>
		<button type="submit">입력</button>
	</form>
</body>
</html>