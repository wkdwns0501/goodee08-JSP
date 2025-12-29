<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - useBean</title>
</head>
<body>
	<!-- useBean: 자바빈 객체를 생성하기 위한 액션 태그 -->
	<!-- ch04.com.dao 패키지에 있는 BeanTest라는 자바 클래스를 beantest라는 이름으로 자바빈 객체 생성 -->
	<jsp:useBean id="beantest" class="ch04.com.dao.BeanTest" scope="page"/>
	
	<b>자바빈 사용 예제</b>
	<!-- beantest 객체에 있는 name 값을 출력 -->
	<h3><%= beantest.getName() %></h3>
	
	<!-- 
		beantest 자바빈 객체의 name 속성 값을 설정
		name 속성은 private 접근 제한이므로 직접 변경이 안됨
		=> 내부적으로 Setter 메소드를 호출하여 수정함 
	-->
	<jsp:setProperty name="beantest" property="name" value="BeanTest!"/>
	<h3><%= beantest.getName() %></h3>
	
	<!-- 
		beantest 자바빈 객체의 name 속성 값을 읽음
		=> 내부적으로 Getter 메소드를 호출하여 가져옴
	-->
	<h3><jsp:getProperty name="beantest" property="name"/></h3>
</body>
</html>