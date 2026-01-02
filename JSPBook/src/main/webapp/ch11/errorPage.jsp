<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage_error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<!-- page 디렉티브 태그에 errorPage 속성을 이용하여 오류 페이지 호출하기 -->
	<!-- 서버(웹 컨테이너)가 제공하는 기본 오류 페이지는 일반 사용자가 보기에 적합하지 않음 -->
	name 파라미터: <%= request.getParameter("name").toUpperCase() %><!-- NPE 발생 -->
</body>
</html>