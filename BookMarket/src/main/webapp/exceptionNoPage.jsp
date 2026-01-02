<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>페이지 오류</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container py-4">
    <!-- 헤더(메뉴) 영역 -->
    <%@ include file="menu.jsp" %>
    
    <div class="p-5 mb-4 bg-body-tertiary rounded-3">
    	<div class="container-fluid py-5">
    		<h1 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
    	</div>
    </div>
    
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch">
      <div class="col-md-12">
        <div class="h-100 p-5">
        	<p><%= request.getRequestURL() %></p>
        	<p><a href="books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a></p>
        </div>
      </div>
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
 		<%@ include file="footer.jsp" %>
	</div>

</body>
</html>