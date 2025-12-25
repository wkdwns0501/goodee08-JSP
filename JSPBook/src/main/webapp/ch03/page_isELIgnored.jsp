<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 현재 페이지에서 표현 언어(EL)를 사용할 수 없도록 설정(기본값=false) -->    
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag - page isELIgnored</title>
</head>
<body>
	<!-- page 디렉티브 태그에 표현 언어를 사용할 수 없도록 설정하기 -->
	<%
		// 사용자(브라우저)가 서버에 요청을 하면 request 객체 생성
		// request 내장 객체에 속성과 값을 저장
		request.setAttribute("RequestAttribute", "request 내장 객체");
	%>
	
	<%= request.getAttribute("RequestAttribute") %>
	
	<!-- RequestAttribute 속성의 값을 출력하기 위해 표현 언어(EL) 사용 -->
	<!-- isELIgnored="true" 설정을 하면 문자열로 출력됨 -->
	${requestScope.RequestAttribute}
</body>
</html>