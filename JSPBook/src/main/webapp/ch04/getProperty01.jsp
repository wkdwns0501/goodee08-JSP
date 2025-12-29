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
	
	<!-- getProperty 액션 태그 사용 시 내부적으로 getId(), getName()을 호출 -->
	<p>아이디: <jsp:getProperty name="person" property="id"/></p>
	<p>이름: <jsp:getProperty name="person" property="name"/></p>
	
</body>
</html>