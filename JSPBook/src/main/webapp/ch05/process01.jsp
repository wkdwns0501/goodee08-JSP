<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<%
		// 폼(입력양식)에서 입력한 한글을 처리하도록 문자 인코딩 설정
		request.setCharacterEncoding("UTF-8"); // 톰캣10+ 생략 가능
		String name = request.getParameter("name");
	%>
	<p>이름: <%= name %></p>
</body>
</html>