<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니 제거</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 장바구니에 등록된 전체 도서 삭제 처리하는 페이지 만들기 -->
	<%
		// 1. 요청 파라미터 검증
		String id = request.getParameter("cartId"); // 쿼리 스트링으로 보낸 데이터
		if (id == null || id.isBlank()) { // id가 null인지 빈 문자열인지 검증
			response.sendRedirect("cart.jsp");
			return;
		}
		
		// 2. 모든 도서 삭제
		// session.invalidate(); 
		// (주의) 위 코드는 세션에 저장된 모든 데이터를 삭제하고 세션 자체도 무효화
		// 예: 로그인 시 로그인도 풀림
		
		// 장바구니 비우기: "cartlist"만 삭제
		session.removeAttribute("cartlist");
		
		// 또는 장바구니 내용만 비우기: 세션에 저장된 리스트는 유지, 내용만 삭제
		/* ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
		if (cartList != null) {
			cartList.clear(); // 리스트의 모든 요소 삭제
		} */
		
		// 5. 장바구니 페이지로 리다이렉트
		response.sendRedirect("cart.jsp");
		
	%>
</body>
</html>