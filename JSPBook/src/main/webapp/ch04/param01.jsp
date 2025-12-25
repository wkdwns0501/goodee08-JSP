<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - Param</title>
</head>
<body>
	<!-- param 액션 태그로 아이디와 이름 전달하기 -->
	<h3>param 액션 태그</h3>
	<jsp:forward page="param01_data.jsp">
		<jsp:param value="admin" name="id"/>
		<jsp:param value="관리자" name="name"/>
	</jsp:forward>
	<p>Jakarta Server Page</p>
	
	<!-- 사용 예: 주문 완료 후 주문 확인 페이지로 이동 시 주문번호 및 주문 정보들 전달 -->
</body>
</html>