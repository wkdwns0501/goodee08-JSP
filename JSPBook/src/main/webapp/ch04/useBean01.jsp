<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag - useBean</title>
</head>
<body>
	<!-- 
		자바빈(JavaBean) 
		데이터 표현을 목적으로 하는 자바 클래스로
		데이터 전달용 객체(VO, DTO)를 JSP에서 다룰 때 주로 사용
		JSP에서는 디자인(HTML)과 비즈니스 로직(Java)을 분리하기 위해 
		이 자바빈을 데이터 바구니(DTO/VO)처럼 활용
	-->
	
	<!-- useBean 액션 태그에 Date 클래스를 사용하여 현재 날짜와 시각 출력하기 -->
	<!-- 이 방법은 굳이 쓸 필요 없음 -> import 사용 -->
	<jsp:useBean id="date" class="java.util.Date"/> <!-- scope="page" (기본값) -->
	
	<p>오늘의 날짜 및 시각</p>
	<%= date %>
	
	<!-- 
		scope 속성: 자바빈 객체가 저장될 영역을 의미 = 객체의 생존 범위 
		
		page(기본값): 자바빈 객체 공유 범위가 현재 페이지의 범위에만 한정, 
									페이지가 변경되면 공유가 유지되지 않는 scope
		request: request 요청을 받고 처리를 완료할 때까지 생존하는 scope
		session: 클라이언트당 하나씩 할당되는 영역, 
						 클라이언트가 브라우저를 종료하기 전까지 유지되는 scope
		application: 사이트 전체의 범위를 가지며, 서버가 종료되기 전에는 계속 유지되는 scope
		
		스코프별 "재사용" 가능 범위
		------------------------------------------------------------------------------------------
		scope	       생존 기간	                   재사용 가능 조건	                         예시
		------------------------------------------------------------------------------------------
		page	       JSP 페이지 내 한정	         	 동일 JSP 페이지 안에서만	                 한 페이지 내에서만 사용
		request	     하나의 요청/응답 주기 동안	   같은 요청 안에서 forward 시 재사용 가능	 모델2 방식으로 요청을 처리할 때
		session	     브라우저 세션 유지 기간 동안	 동일 사용자(세션) 요청 간 재사용	         장바구니, 로그인 정보
		application	 서버 실행 중 전체	           모든 사용자와 요청에서 재사용	           전역 설정, 전체 방문자수 계산
		
		결론적으로 데이터 처리 목적의 자바빈에서는 request scope가 표준 / 가장 많이 사용
  -->
</body>
</html>