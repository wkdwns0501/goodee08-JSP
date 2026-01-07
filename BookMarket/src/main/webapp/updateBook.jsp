<%@page import="java.sql.SQLException"%>
<%@page import="util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 수정</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 도서 수정 페이지 -->
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역 -->
    <%@ include file="menu.jsp" %>
    
    <!-- 중간 타이틀 영역 -->
    <jsp:include page="title.jsp">
			<jsp:param value="도서 수정" name="title"/>
			<jsp:param value="Book Updating" name="sub"/>
		</jsp:include>
		
		<%@ include file="dbconn.jsp" %>
		<%
			try {
				String bookId = request.getParameter("id");
				String sql = "SELECT * FROM book WHERE b_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
		%>
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch">
    
    	<div class="col-md-5">
				<img alt="도서이미지" src="<%= request.getContextPath() %>/images/<%= rs.getString("b_fileName") %>" 
						 style="width: 100%;">    	
    	</div>
    	
    	<div class="col-md-7">
    		<form name="updateBook" action="<%= request.getContextPath() %>/processUpdateBook" method="post" enctype="multipart/form-data">
    		<div class="mb-3 row">
					<label class="col-sm-2">도서코드</label>
					<div class="col-sm-3">
						<input type="text" id="bookId" name="bookId" class="form-control" value="<%= rs.getString("b_id") %>" readonly>
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">도서명</label>
					<div class="col-sm-3">
						<input type="text" id="name" name="name" class="form-control" value="<%= rs.getString("b_name") %>">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-3">
						<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%= rs.getString("b_unitPrice") %>">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">저자</label>
					<div class="col-sm-3">
						<input type="text" name="author" class="form-control" value="<%= rs.getString("b_author") %>">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">출판사</label>
					<div class="col-sm-3">
						<input type="text" name="publisher" class="form-control" value="<%= rs.getString("b_publisher") %>">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">출판일</label>
					<div class="col-sm-3">
						<input type="text" name="releaseDate" class="form-control" value="<%= rs.getString("b_releaseDate") %>">
					</div>
				</div>
		
				<div class="mb-3 row">
					<label class="col-sm-2">상세정보</label>
					<div class="col-sm-5">
						<textarea id="description" name="description" cols="50" rows="2"  
										  class="form-control" placeholder="100자 이상 적어주세요"><%= rs.getString("b_description") %></textarea>
					</div>
				</div>			
				<div class="mb-3 row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-3">
						<input type="text" name="category" class="form-control" value="<%= rs.getString("b_category") %>">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">재고수</label>
					<div class="col-sm-3">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%= rs.getString("b_unitsInStock") %>">
					</div>
				</div>
				<div class="mb-3 row">
					<label class="col-sm-2">상태</label>
					<div class="col-sm-5">
						<input type="radio" name="condition" value="New" 
							<%= "New".equals(rs.getString("b_condition")) ? "checked" : ""%>> 신규도서 
						<input type="radio" name="condition" value="Old" 
							<%= "Old".equals(rs.getString("b_condition")) ? "checked" : ""%>> 중고도서 
						<input type="radio" name="condition" value="EBook" 
							<%= "EBook".equals(rs.getString("b_condition")) ? "checked" : ""%>> E-Book
					</div>				
				</div>		
				
				<div class="mb-3 row">
					<label class="col-sm-2">이미지</label>
					<div class="col-sm-5">
						<input type="file" name="bookImage" class="form-control" value="<%= rs.getString("b_fileName") %>">
					</div>				
				</div>		
				
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-success" onclick="checkAddBook(event)">수정 완료</button>
					</div>
				</div>
    	</form>
    	</div>
    	
 		</div>
 		<%
				} // 조건문 종료
			} catch (SQLException e) {
				out.println("SQLException: " + e.getMessage());
			} finally {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}
 		%>
 		
 		<!-- 푸터(바닥글) 영역 -->
 		<%@ include file="footer.jsp" %>
	</div>
	
	<script type="text/javascript" src="resources/js/validation.js" defer></script>
</body>
</html>