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
	
	<!-- value: 값을 지정하여 직접 저장 -->
	<jsp:setProperty name="person" property="id" value="20251229"/>	
	<jsp:setProperty name="person" property="name" value="김재현"/>	
	<p>아이디: <% out.println(person.getId()); %></p>
	<p>이름: <%= person.getName() %></p>
	
	<p>아이디(getProperty 사용): <jsp:getProperty name="person" property="id"/></p>
	<p>이름(getProperty 사용): <jsp:getProperty name="person" property="name"/></p>
	
	<!-- EL 표현 언어 -->
	<p>아이디(EL 사용): ${person.id}</p>
	<p>이름(EL 사용): ${person.name}</p>
	
</body>
</html>