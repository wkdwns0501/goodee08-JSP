<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - Include</title>
</head>
<body>
	<!-- include 시 동족으로 데이터를 넘길 수 있음 -->
	<h2>include 액션 테스트</h2>
	<jsp:include page="includeTest2.jsp">
		<jsp:param value="홍길동" name="name"/>
	</jsp:include>
</body>
</html>