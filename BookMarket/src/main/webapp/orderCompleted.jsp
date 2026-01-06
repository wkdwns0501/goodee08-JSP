<%@page import="java.net.URLDecoder"%>
<%@page import="dao.BookRepository"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- session이 연결되는 동안 도서 데이터를 공유하기 위해 사용 -->
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"/> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 정보</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 로컬에서 직접 넣기(인터넷이 안되는 폐쇠망이나 내부망일때 파일을 직접 넣어 사용) -->
	<!-- <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
</head>
<body>
	<!-- 주문 정보 페이지 작성하기 -->
	<%
	String shipping_cartId = "";
	String shipping_shippingDate = "";
	
	// 요청에 담긴 모든 쿠키 가져와서 변수에 저장하기
	Cookie[] cookies = request.getCookies();
	
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			switch (cookie.getName()) {
				case "Shipping_cartId":
					shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
					break;
				case "Shipping_shippingDate":
					shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
					break;
			}
		}
	}
	%>
	
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역 -->
    <%@ include file="menu.jsp" %>
    
    <!-- 중간 타이틀 영역 -->
    <jsp:include page="title.jsp">
			<jsp:param value="주문 완료" name="title"/>
			<jsp:param value="Order Completed" name="sub"/>
		</jsp:include>
    
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch">
    	<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
			<p>주문은 <%= shipping_shippingDate %>에 배송될 예정입니다!</p>    	
			<p>주문번호: <%= shipping_cartId %></p>
 		</div>
    <div class="container">
			<p>
				<a href="books.jsp" class="btn btn-secondary">&laquo; 도서 목록</a>
			</p>    	
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
 		<%@ include file="footer.jsp" %>
	</div>
	
	<%
		// 세션에 저장된 장바구니 정보를 모두 삭제하도록 작성
		// 장바구니 정보만 제거하고 로그인은 유지하려면 특정 속성만 삭제
		session.removeAttribute("cartlist");
		
		// 쿠키에 저장된 배송 정보를 모두 삭제
		// 예: "Shipping_"으로 시작하는 쿠키들
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().startsWith("Shipping_")) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		}
	%>
	
</body>
</html>