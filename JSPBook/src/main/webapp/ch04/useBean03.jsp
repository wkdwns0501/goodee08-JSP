<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - useBean</title>
</head>
<body>
	<!-- useBean 액션 태그에 Person 클래스를 사용하여 아이디, 이름 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request"/>
	
	<p>아이디: <%= person.getId() %></p>
	<p>이름: <%= person.getName() %></p>
</body>
</html>