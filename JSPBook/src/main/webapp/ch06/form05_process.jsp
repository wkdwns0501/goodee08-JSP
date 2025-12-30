<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
</head>
<body>
	<!-- 전송받은 form 데이터 출력하기 -->
	<%
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		String comment = request.getParameter("comment");
	%>
	<p>아이디: <%= id %></p>
	<p>비밀번호: <%= passwd %></p>
	<p>이름: <%= name %></p>
	<p>연락처: <%= tel1 %>-<%= tel2 %>-<%= tel3 %></p>
	<p>성별: <%= gender %></p>
	<p>취미: 
		<%
			if (hobby != null) {
				for (int i = 0; i < hobby.length; i++) {
					out.println(" " + hobby[i]);
				}
			}
		%>
	</p>
	<p>가입인사: <%= comment %></p>
</body>
</html>