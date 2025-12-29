<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>attribute Test</title>
</head>
<body>
	<h2>영역과 속성 테스트</h2>
	
	<%
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		
		if (name != null && id != null) {
			application.setAttribute("name", name);
			application.setAttribute("id", id);
		}
	%>
	
	<h3>
		<%= name %> 님 반갑습니다.<br>
		<%= name %> 님의 아이디는 <%= id %>입니다.
	</h3>
	
	<form action="attributeTest2.jsp" method="post">
		<h3>Session 영역에 저장할 내용들</h3>
		<p>
			이메일: <input type="text" name="email">
		</p>
		<p>
			주소: <input type="text" name="address">
		</p>
		<p>
			전화번호: <input type="text" name="tel">
		</p>
		<button type="submit">전송</button>
	</form>
</body>
</html>