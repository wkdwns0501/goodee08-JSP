<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - Forward</title>
</head>
<body>
	<h2>forward 액션 테스트</h2>
	<form action="forwardTest1.jsp" method="post">
		<!-- hidden 타입: 특정 이름의 파라미터 값을 코드상에서 직접 지정하여 전송하는 경우 사용 -->
		<input type="hidden" name="forwardPage" value="forwardTest2.jsp">
		<p>
			이름: <input type="text" name="name"> 
		</p>
		<p>
			나이: <input type="text" name="age"> 
		</p>
		<p>
			주소: <input type="text" name="address"> 
		</p>
		<button type="submit">전송</button>
	</form>
</body>
</html>