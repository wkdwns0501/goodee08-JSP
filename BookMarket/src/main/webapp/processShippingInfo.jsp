<%@page import="java.net.URLEncoder"%>
<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배송 정보 처리</title>
</head>
<body>
	<!-- 배송 정보 처리 페이지 만들기 -->
	<%
		// 사용자가 입력한 배송 정보를 쿠키에 저장
		// 쿠키는 원래 아스키 문자만 지원
		// 쿠키 값에 한글/공백/특수문자가 들어가면 URLEncoder.encode() 사용하는 것이 안전
		// 읽을 때는 URLDecoder.decode()로 원래 문자열 복원
		Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
		Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
		Cookie country = new Cookie("Shipping_country",	URLEncoder.encode(request.getParameter("country"), "utf-8"));
		Cookie zipCode = new Cookie("Shipping_zipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
		Cookie addressName = new Cookie("Shipping_addressName", URLEncoder.encode(request.getParameter("addressName"), "utf-8"));
		
		// 유효기간 24시간으로 설정
		cartId.setMaxAge(24 * 60 * 60);
		name.setMaxAge(24 * 60 * 60);
		shippingDate.setMaxAge(24 * 60 * 60);
		country.setMaxAge(24 * 60 * 60);
		zipCode.setMaxAge(24 * 60 * 60);
		addressName.setMaxAge(24 * 60 * 60);
		
		// 응답에 쿠키 추가
		response.addCookie(cartId);
		response.addCookie(name);
		response.addCookie(shippingDate);
		response.addCookie(country);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		
		// 주문 확인 페이지로 리다이렉트
		response.sendRedirect("orderConfirmation.jsp");
	%>
</body>
</html>