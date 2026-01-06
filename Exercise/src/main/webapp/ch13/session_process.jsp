<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch13_ex09</title>
</head>
<body>
	<%
		String userId = request.getParameter("id");
		String userPw = request.getParameter("passwd");
		
		if ("admin".equals(userId) && "1234".equals(userPw)) {
			session.setAttribute("userId", userId);
			out.println("로그인 성공");
			response.sendRedirect("welcome.jsp");
		} else {
			out.println("로그인 실패");
		}
	%>
</body>
</html>