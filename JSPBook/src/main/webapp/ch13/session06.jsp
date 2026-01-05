<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<!-- 세션에 저장된 모든 속성 삭제하기(+참조가 끊김) -->
	<h4>----- 세션을 삭제하기 전 -----</h4>
	<%
		String user_id = (String) session.getAttribute("userId");
		String user_pw = (String) session.getAttribute("userPw");
		
		out.println("설정된 세션: " + user_id + "<br>");
		out.println("설정된 세션: " + user_pw + "<br>");	
		
		// 클라이언트가 쿠키에 담아보낸 세션ID가 
		// 현재 서버에서 유효한지(그 ID에 대응되는 세션 객체가 존재하는지) 확인하는 메소드
		if (request.isRequestedSessionIdValid() == true){
			out.print("세션이 유효합니다.");
		} else {
			out.print("세션이 유효하지 않습니다.");
		}
		
		// 모든 세션 속성 삭제 및 세션 무효화
		// 세션 객체 내부의 모든 속성을 먼저 제거하고, 세션 자체에 대한 참조를 끊음
		// 이후 기존 세션 ID로 해당 세션 객체에 접근 불가
		session.invalidate();
	%>
	<h4>----- 세션을 삭제한 후 -----</h4>
	<%
		if (request.isRequestedSessionIdValid() == true){
			out.print("세션이 유효합니다.");
		} else {
			out.print("세션이 유효하지 않습니다.");
		}
	%>
</body>
</html>