<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - Forward</title>
</head>
<body>
	<h2>포워딩 된 페이지(forwardTest2.jsp)</h2>
	<p>
		이름: <%= request.getParameter("name") %>
	</p>
	<p>
		나이: <%= request.getParameter("age") %>
	</p>
	<p>
		주소: <%= request.getParameter("address") %>
	</p>
	<p>
		번호: <%= request.getParameter("tel") %>
	</p>
</body>
</html>