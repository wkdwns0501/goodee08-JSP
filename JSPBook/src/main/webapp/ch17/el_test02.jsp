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
		session.getAttribute("test");
		request.getParameter("name");
	%>
	
	<h3>${sessionScope.test}</h3>
	<h3>${param.name}</h3>
	
	<!-- 테스트: 스코프 미지정 시 -->
	<!-- EL 검색 순서: page -> request -> session -> application -->
	<!-- 순서대로 찾다가 찾으면 바로 출력 후 뒤에는 검색X -->
	<h3>${test}</h3>
	<h3>${name}</h3> <!-- 값이 없어서 안나옴 -->
	
</body>
</html>