<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - Forward</title>
</head>
<body>
	<!-- forward 액션 태그로 현재 날짜와 시간을 출력하는 페이지로 이동하기 -->
	<!-- 
		현재 페이지의 요청과 응답에 관한 처리권을 이동할 페이지로 영구적으로 넘김
		=> 원래 페이지에서 생성된 request, response 객체가 그대로 넘어감
		=> request에 지정한 속성들은 포워딩된 페이지에서도 그대로 사용 가능
		   (request 객체를 공유)
	-->
	<!-- 
		이때 이동하기 전의 페이지에 대한 모든 출력 버퍼의 내용은 무시(버퍼의 내용이 버려짐)되며 
		이동한 페이지가 요청을 처리하여 응답이 완료되면 원래 페이지로 제어권이 돌아가지 않고 종료됨
	-->
	<h2>forward 액션 태그</h2>
	<jsp:forward page="forward_date.jsp"/>
	<p>-------------------------------</p>
</body>
</html>