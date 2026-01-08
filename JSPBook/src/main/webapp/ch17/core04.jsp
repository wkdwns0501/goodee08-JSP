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
<body>
	<!-- test 변수에 Hello JSTL! 저장-->
	<c:set var="test" value="Hello JSTL!"/>
	<h3>set 사용 후: <c:out value="${test}"/></h3>
	<c:remove var="test"/>
	<h3>remove 사용 후: <c:out value="${test}"/></h3>
	
	<c:catch var="err">
		<%= 10 / 0 %>
	</c:catch>
	<h3>catch로 잡아낸 오류: <c:out value="${err}"></c:out></h3>
	
	<c:if test="${5 < 10}">
		<h3>5는 10보다 작다</h3>
	</c:if>
	<c:if test="${6 + 3 == 9}">
		<h3>6 + 3은 9이다</h3>
	</c:if>
	
	<c:choose>
		<c:when test="${5 + 10 == 50}">
			<h3>5 + 10은 50이다</h3>
		</c:when>
		<c:otherwise>
			<h3>5 + 10은 50이 아니다</h3>
		</c:otherwise>
	</c:choose>
	
</body>
</html>