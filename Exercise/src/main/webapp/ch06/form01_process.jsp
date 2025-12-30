<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch06_ex08</title>
</head>
<body>
	<%
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		StringBuffer sb = new StringBuffer();
		sb.append("이름: " + name + "<br>")
			.append("주소: " + address + "<br>")
			.append("이메일: " + email + "<br>");
	%>
	<p><%= sb %></p>
</body>
</html>