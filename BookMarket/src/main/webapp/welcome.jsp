<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 북마켓 프로젝트 만들기 -->
	<!-- <h1>Welcome to Book Shopping Mall</h1>
	<h3>Welcome to Web Market!</h3> -->
	
	<%!
		String greeting = "도서 쇼핑몰에 오신것을 환영합니다.";
		String tagline = "Welcome to Web Market!";
	%>
	
	<div class="container py-4">
    <!-- 헤더(메뉴) 영역 -->
    <%@ include file="menu.jsp" %>
    
    <!-- 중간 타이틀 영역 -->
    <jsp:include page="title.jsp">
				<jsp:param value="<%= greeting %>" name="title"/>
				<jsp:param value="BookMarket" name="sub"/>
			</jsp:include>
    
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch text-center">
      <div class="col-md-12">
        <div class="h-100 p-5">
        	<h3><%= tagline %></h3>
        	
        	<!-- 현재 접속 시간 출력하기 -->
        	<%-- <% 
        		LocalDateTime now = LocalDateTime.now();
        		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("hh:mm:ss a");
        		
        		String CT = now.format(formatter);
        		out.println("현재 접속 시각: " + CT);
        	%> --%>
        	<!-- 실시간 시간 출력하기 -->
        	<div id="clock"></div>
        </div>
      </div>
 		</div>
 		
 		<div class="">
 			<p>
				<a href="books.jsp" class="btn btn-secondary">도서 목록 &raquo;</a>
			</p>
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
 		<%@ include file="footer.jsp" %>
	</div>
	
<script>
  setInterval(() => {
    document.getElementById("clock").innerText =
      "현재 접속 시각: " + new Date().toLocaleTimeString('ko-KR', { second: undefined });
  }, 1000);
</script>

</body>
</html>