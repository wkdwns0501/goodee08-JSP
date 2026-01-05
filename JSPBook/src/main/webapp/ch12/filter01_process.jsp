<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter</title>
</head>
<body>
	<p>입력된 이름: <%= request.getParameter("name") %></p>
	<p>입력된 이름: ${param.name}</p>
</body>
</html>