<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
		<p>아이디: <% out.println(request.getParameter("id")); %></p>
		<p>비밀번호: <%= request.getParameter("passwd") %></p>
		
		<!-- EL 표현 언어 사용 시 -->
		<p>아이디: ${param.id}</p>
		<p>비밀번호: ${param.passwd}</p>
</body>
</html>