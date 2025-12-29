<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session Test</title>
</head>
<body>
	<!-- 
		- session 
		  HTTP 프로토콜은 요청/응답의 구조로 되어 있어 서버가 요청에 대한 응답을
		  전송하고 나면 연결이 끊어짐 (Stateless), 클라이언트의 정보가 유지되어야 할
			필요가 있는 경우를 위해 클라이언트별 상태 정보를 서버에 저장하는 세션이 등장
			클라이언트마다 고유 세션 ID 부여 -> 요청 간 상태 유지 가능
	-->
	
	<%
		// 클라이언트의 요청이 없을 시 해당 세션을 유지한 시간을 지정(초 단위)
		session.setMaxInactiveInterval(10); // 세션 유지 타이머
	%>
	
	<h2>세션 테스트</h2>
	isNew(): <%= session.isNew() %><br>
	생성 시간: <%= session.getCreationTime() %><br>
	최종 접속(요청) 시간: <%= session.getLastAccessedTime() %><br>
	세션ID: <%= session.getId() %><br>
</body>
</html>