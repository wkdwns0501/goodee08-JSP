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
	<c:forEach var="i" begin="1" end="10" step="2">
		${i}
	</c:forEach>
	
	<br>
	
	<!-- 자바의 for문 StringTokenizer 객체를 결합한 것과 유사 -->
	<c:forTokens var="alphabet" items="a,b,c,d,e,f,g,h,i,j,k,l,m,n" delims=",">
		${alphabet}
	</c:forTokens>
	
	<br>
	
	<c:set var="data" value="홍길동,김길동,고길동"/>
	<c:forTokens var="varData" items="${data}" delims=",">
		${varData}
	</c:forTokens>
	
</body>
</html>