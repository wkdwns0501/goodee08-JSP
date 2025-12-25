<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - Forward</title>
</head>
<body>
	<!-- 클라이언트에서 전송되어 오는 요청 파라미터 값들에 대한 한글 처리(톰캣10+ 생략 가능) -->
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<jsp:forward page='<%= request.getParameter("forwardPage") %>'>
		<jsp:param value="010-1234-5678" name="tel"/>		
	</jsp:forward>
</body>
</html>