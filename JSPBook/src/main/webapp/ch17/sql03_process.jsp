<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	core: 기본적인(핵심적인) 기능을 모아둔 파트 
	예: 변수 설정, 문자열 출력 기능, 조건문, 반복문 등
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<sql:setDataSource var="dataSource"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/jspbookdb"
		user="root"
		password="test1234"
	/>
	
	<sql:update var="result" dataSource="${dataSource}">
		UPDATE member SET name = ? WHERE id = ? AND passwd = ?
		<sql:param value="${param.name}"/>
		<sql:param value="${param.id}"/>
		<sql:param value="${param.passwd}"/>
	</sql:update>
	
	결과: <c:out value="${result}"/>
	
	<!-- JSTL 버전의 동적 include: 해당 JSP의 실행 결과(HTML 결과)를 가져와 붙임 -->
	<%-- <c:import url="sql01.jsp"/> --%> <!-- 바로 출력됨 -->
	
	<c:import var="content" url="sql01.jsp"/> <!-- 출력되지 않고 변수에 저장됨 -->
	${content}
</body>
</html>