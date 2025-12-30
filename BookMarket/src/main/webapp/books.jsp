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
	<title>도서 목록</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역 -->
    <%@ include file="menu.jsp" %>
    
    <!-- 중간 타이틀 영역 -->
    <jsp:include page="title.jsp">
			<jsp:param value="도서 목록" name="title"/>
			<jsp:param value="BookList" name="sub"/>
		</jsp:include>
    
    <%
    	// 자바빈 사용
    	// ArrayList<Book> listOfBooks = bookDAO.getAllBooks();
    
    	// BookRepository 공유 객체로 변경
    	// 이유: 자바빈을 쓰면 해당 객체가 scope 내에 존재하면 재사용하고
    	// 존재하지 않으면 새롭게 생성하기 때문에 객체 내 데이터 불일치 발생
    	BookRepository dao = BookRepository.getInstance();
    	ArrayList<Book> listOfBooks = dao.getAllBooks();
    %>
    
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch text-center">
    	<%
    		for (int i = 0; i < listOfBooks.size(); i++) {
    			Book book = listOfBooks.get(i);
    	%>
      <div class="col-md-4">
        <div class="h-100 p-2">
        	<!-- 도서 정보 -->
        	<h5><b><%= book.getName() %></b></h5>
        	<p>
        		<%= book.getAuthor() %>
        		<br>
        		<%= book.getPublisher() %> | <%= book.getReleaseDate() %>
        	</p>
        	<p><%= book.getDescription().substring(0, 60) %>...</p>
        	<p><%= book.getUnitPrice() %>원</p>
        	<p>
        		<a href="book.jsp?id=<%= book.getBookId() %>" class="btn btn-secondary" role="button">
        			상세 정보 &raquo;
        		</a>
        	</p>
        </div>
      </div>
      <%
    		} // 반복문 종료
      %>
      
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
 		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>