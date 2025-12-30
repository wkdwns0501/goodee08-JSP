<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<!-- response 내장 객체 사용 예: 페이지 이동하기 -->
	<!-- redirect(리다이렉션): 클라이언트(브라우저)에게 다른 페이지를 재요청할 것을 응답으로 보냄 -->
	<%
		/* Header - Response Headers - Location에 아래 주소가 들어감 */
		response.sendRedirect("https://www.google.com");
	%>
</body>
</html>