<%@page import="java.util.ArrayList"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장바구니 추가</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 장바구니에 등록 처리하는 페이지 만들기 -->
	<%
		// 1. 요청 파라미터 검증
		String id = request.getParameter("id"); // 쿼리 스트링으로 보낸 데이터
		String bookId = request.getParameter("bookId"); // hidden input으로 보낸 데이터
		if (id == null || id.isBlank()) { // id가 null인지 빈 문자열인지 검증
			response.sendRedirect("book.jsp");
			return;
		}
		
		// 2. 도서 조회
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
		if (book == null) {
			response.sendRedirect("exceptionNoBookId.jsp");
			return;
		}
		
		// 3. 세션에서 장바구니 정보 가져오기(없으면 새로 생성)
		ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
		if (cartList == null) {
			// 장바구니 정보를 세션에 저장
			cartList = new ArrayList<Book>();
			session.setAttribute("cartlist", cartList);
		}
		
		// 4. 장바구니에 동일 도서가 있으면 수량 +1, 없으면 새로 추가
		boolean found = false;
		for (Book item : cartList) {
			if (item.getBookId().equals(id)) {
				item.setQuantity(item.getQuantity() + 1);
				found = true;
				break;
			} 
		}
		
		if (!found) {
			// 새로운 객체로 복사해서 추가(직접 참조 방지)
			// 원본 데이터가 변경될 위험을 방지하기 위해 새 객체로 복사해서 장바구니에 넣는 것이 안전
			Book cartItem = new Book(book); // 복사 생성자 사용
			cartItem.setQuantity(1);
			cartList.add(cartItem);
		}
		
		// 5. 상세 페이지로 리다이렉트
		response.sendRedirect("book.jsp?id=" + id);
		
	%>
</body>
</html>