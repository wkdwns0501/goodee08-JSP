<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pageContext Test</title>
</head>
<body>
	<!-- 
		pageContext: JSP 페이지의 실행에 필요한 환경 정보를 저장한 객체
		핵심 역할 3가지
		1. JSP 실행 환경(Context) 정보 제공
		2. 다른 내장 객체들에 대한 접근을 제공
		3. Scope 관리(page scope)
		pageContext, request, session, application 네 가지의 영역 내장 객체는 
		각각의 영역(scope)과 관련된 자신의 속성(attribute)을 가질 수 있고,
		이를 통해 각각의 영역별로 속성 데이터를 공유할 수 있음
	-->
	
	<%
		pageContext.forward("pageContextTest2.jsp");
	%>
</body>
</html>