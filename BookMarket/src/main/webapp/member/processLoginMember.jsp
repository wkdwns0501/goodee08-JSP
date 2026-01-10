<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 처리</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/bookmarketdb"
		user="root"
		password="test1234"
	/>
		
	<sql:query var="resultSet" dataSource="${dataSource}">
		SELECT * FROM member WHERE id = ? AND password = ?
		<sql:param value="${param.id}"/>
		<sql:param value="${param.password}"/>
	</sql:query>
	
	<c:choose>
		<c:when test="${not empty resultSet.rows}">
			<c:set var="loginId" value="${param.id}" scope="session"/> <!-- 세션에 로그인한 아이디 저장 -->
			<c:redirect url="resultMember.jsp?msg=2" /> <!-- msg=2는 로그인 성공을 의미 -->
		</c:when>
		<c:otherwise>
			<c:redirect url="loginMember.jsp?error=1" /> <!-- msg=2는 로그인 성공을 의미 -->
		</c:otherwise>
	</c:choose>
</body>
</html>