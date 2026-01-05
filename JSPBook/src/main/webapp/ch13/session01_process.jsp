<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		
		if ("admin".equals(user_id) && "1234".equals(user_pw)){
			session.setAttribute("userId", user_id);
			session.setAttribute("userPw", user_pw);
			out.println("세션 설정 성공 <br>");
			out.println(user_id + "님 환영합니다.");
		} else {
			out.println("세션 설정 실패");
		}
	%>
</body>
</html>