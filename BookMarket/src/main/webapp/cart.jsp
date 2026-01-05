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
	<title>장바구니</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 로컬에서 직접 넣기(인터넷이 안되는 폐쇠망이나 내부망일때 파일을 직접 넣어 사용) -->
	<!-- <link href="resources/css/bootstrap.min.css" rel="stylesheet"> -->
</head>
<body>
	<!-- 장바구니 뷰 페이지 작성하기 -->
	<%
		String cartId = session.getId(); // 세션 ID 얻기(장바구니 ID로 사용함)
	%>
	
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역 -->
    <%@ include file="menu.jsp" %>
    
    <!-- 중간 타이틀 영역 -->
    <jsp:include page="title.jsp">
			<jsp:param value="장바구니" name="title"/>
			<jsp:param value="Cart" name="sub"/>
		</jsp:include>
    
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch">
    	<div class="row">
    		<table style="width: 100%">
    			<tr>
    				<td align="left">
    					<a href="deleteCart.jsp?cartId=<%= cartId %>" class="btn btn-danger">삭제하기</a>
    				</td>
    				<td align="right">
    					<a href="deleteCart.jsp?cartId=<%= cartId %>" class="btn btn-success">주문하기</a>
    				</td>
    			</tr>
    		</table>
    	</div>
    	
    	<div style="padding-top: 50px">
    		<table class="table table-hover">
    			<tr>
    				<th>도서</th>
    				<th>가격</th>
    				<th>수량</th>
    				<th>소계</th>
    				<th>비고</th>
    			</tr>
    			<%
						ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
    				if (cartList == null) {
    					cartList = new ArrayList<Book>();
    				}
    				int sum = 0;
    				for (Book item : cartList) {
    					sum += item.getUnitPrice() * item.getQuantity();
    			%>
    			<tr>
    				<td><%= item.getBookId() %> - <%= item.getName() %></td>
    				<td><%= item.getUnitPrice() %>원</td>
    				<td><%= item.getQuantity() %>권</td>
    				<td><%= item.getUnitPrice() * item.getQuantity() %>원</td>
    				<td><a href="" class="btn btn-danger">삭제</a></td>
    			</tr>
    			<%
		    		}
		    	%>
    			<tr>
    				<th></th>
    				<th></th>
    				<th>총액</th>
    				<th><%= sum %>원</th>
    				<th></th>
    			</tr>
    		</table>
    	</div>
    	
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
 		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>