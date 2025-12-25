<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page info="Date 클래스를 이용한 날짜 출력하기" %>
<!-- 
	(참고)
	JSP 컨테이너는 info 속성에 대응하여 getServletInfo() 메소드를 생성
	return "Date 클래스를 이용한 날짜 출력하기";
	(JSP 컨테이너는 JSP 코드를 Java코드로 바꿔주는데 info 속성은 메소드로 바꿔줌)
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag - page info</title>
</head>
<body>
	<!-- page 디렉티브 태그에 현재 웹 페이지의 설명 작성하기(거의 안씀) -->
	Today is: <%= new Date() %> <br>
</body>
</html>