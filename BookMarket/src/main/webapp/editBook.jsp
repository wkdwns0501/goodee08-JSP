<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>도서 편집</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<script type="text/javascript">
		function deleteConfirm(id) {
			if (confirm('해당 도서를 삭제하시겠습니까?')) {
				location.href = 'deleteBook.jsp?id=' + id;
			}
		}
	</script>
	
</head>
<body>
	<!-- 도서 편집 페이지 -->
	<%
		String edit = request.getParameter("edit");
	%>
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역 -->
    <%@ include file="menu.jsp" %>
    
    <!-- 중간 타이틀 영역 -->
    <jsp:include page="title.jsp">
			<jsp:param value="도서 편집" name="title"/>
			<jsp:param value="Book Edit" name="sub"/>
		</jsp:include>
		
		<%@ include file="dbconn.jsp" %>
    
    
    <!-- 본문 영역 -->
    <div class="row align-items-md-stretch text-center">
    	<%
    		// book 테이블의 모든 데이터를 가져오도록 SELECT문 작성
    		try {
	    		String sql = "SELECT * FROM book ORDER BY b_releaseDate DESC";
	    		pstmt = conn.prepareStatement(sql);
	    		rs = pstmt.executeQuery();
   				// 가져온 레코드들을 반복하며 동적 바인딩
       		while (rs.next()) {
      %>
      <div class="col-md-4">
        <div class="h-100 p-2">
        	<!-- 도서 정보 -->
					<img alt="도서이미지" src="<%= request.getContextPath() %>/images/<%= rs.getString("b_fileName") %>" style="width: 250px; height:350px;">        	
        	
        	<h5><b><%= rs.getString("b_name") %></b></h5>
        	<p>
        		<%= rs.getString("b_author") %>
        		<br>
        		<%= rs.getString("b_publisher") %> | <%= rs.getString("b_releaseDate") %>
        	</p>
        	<p><%= rs.getString("b_description").substring(0, 60) %>...</p>
        	<p><%= rs.getInt("b_unitPrice") %>원</p>
        	<p>
        		<% if ("update".equals(edit)) { %>
        		<a href="updateBook.jsp?id=<%= rs.getString("b_id") %>" class="btn btn-success" role="button">
        			수정 &raquo;
        		</a>
        		<% } else if ("delete".equals(edit)) { %>
        		<a href="javascript:void(0)" class="btn btn-danger" role="button"
        			 onclick="deleteConfirm('<%= rs.getString("b_id") %>')">
        			삭제 &raquo;
        		</a>
        		<% } %>
        	</p>
        </div>
      </div>
      <%
    			} // 반복문 종료
				} catch (SQLException e) {
					out.println("SQLException: " + e.getMessage());
				} finally {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				}
			%>
 		</div>
 		
 		<!-- 푸터(바닥글) 영역 -->
 		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>