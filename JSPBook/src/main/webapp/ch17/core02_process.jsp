<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	core: 기본적인(핵심적인) 기능을 모아둔 파트 
	예: 변수 설정, 문자열 출력 기능, 조건문, 반복문 등
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>										<!-- param 넘어올때는 무조건 String 타입 -->
	<c:set var="number" value="${param.number}"/>
	<!-- 다중 조건문: 자바의 if-else if-else 문과 유사 -->
	<!-- 연산 시 EL이 자동으로 형변환 -->
	<c:choose>
		<c:when test="${number % 2 == 0}">
			<c:out value="${number}"/>은 짝수입니다
		</c:when>
		<c:when test="${number % 2 == 1}">
			<c:out value="${number}"/>은 홀수입니다
		</c:when>
		<c:otherwise> <!-- 문자를 넣으면 NFE -->
			숫자가 아닙니다
		</c:otherwise>
	</c:choose>
</body>
</html>