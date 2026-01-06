<%@page import="java.net.URLDecoder"%>
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
	<!-- 주문 취소 페이지 작성하기 -->
	
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역 -->
    <%@ include file="menu.jsp" %>
    
    <!-- 중간 타이틀 영역 -->
    <jsp:include page="title.jsp">
			<jsp:param value="주문 취소" name="title"/>
			<jsp:param value="Order Cancellation" name="sub"/>
		</jsp:include>
    
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch">
    	<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
 		</div>
    <div class="container">
			<p>
				<a href="books.jsp" class="btn btn-secondary">&laquo; 도서 목록</a>
				<a href="cart.jsp" class="btn btn-secondary">&laquo; 장바구니</a>
			</p>    	
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
 		<%@ include file="footer.jsp" %>
	</div>
	
	<%
		// 쿠키에 저장된 배송 정보를 모두 삭제
		// 예: "Shipping_"으로 시작하는 쿠키들
		Cookie[] cookies = request.getCookies();
			
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