<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<script type="text/javascript">
		function checkForm() {
			console.log('${sessionScope.loginId}');
			console.log(${empty sessionScope.loginId});
			
			if (${empty sessionScope.loginId}) {
				alert("로그인 해주세요.");
				return;
			}
	
			location.href = "./BoardWriteForm.do?id=${sessionScope.loginId}";
		}
	</script>
</head>
<body>
	<div class="container py-4">
		<jsp:include page="/menu.jsp" />
		
		<jsp:include page="/title.jsp">
			<jsp:param value="게시판" name="title"/>
			<jsp:param value="Board" name="sub"/>
		</jsp:include>
	
		<div class="row align-items-md-stretch text-center">
			<form action="<c:url value='/BoardListAction.do' />" method="get">
				<div class="text-end">
					<span class="badge text-bg-success">
						전체 ${total_record}건
					</span>
				</div>
	
				<div style="padding-top: 20px">
					<table class="table table-hover text-center">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성일</th>
							<th>조회</th>
							<th>글쓴이</th>
						</tr>
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td>${board.num}</td>
								<td>
									<a href="<c:url value='BoardViewAction.do?num=${board.num}&pageNum=${pageNum}'/>">
										${board.subject}
									</a>
								</td>
								<td>${board.registDay}</td>
								<td>${board.hit}</td>
								<td>${board.name}</td>
							</tr>
						</c:forEach>
						<c:if test="${empty boardList}">
							<tr>
								<td colspan="5">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
					</table>
				</div>
	
				<!-- 페이지 네비게이션 -->
				<div align="center">
					<c:forEach var="i" begin="1" end="${total_page}">
						<a class="btn btn-primary" href="<c:url value='/BoardListAction.do?pageNum=${i}'/>">
							<c:choose>
								<c:when test="${pageNum == i}">
									<b>${i}</b>
								</c:when>
								<c:otherwise>
									${i}
								</c:otherwise>
							</c:choose>
						</a>
					</c:forEach>
				</div>
	
				<div class="py-3" align="right">
					<a href="javascript:void(0)" onclick="checkForm()" class="btn btn-primary">
						&laquo; 글쓰기
					</a>
				</div>
	
				<!-- 검색 -->
				<div align="left">
					<select name="items" class="txt">
						<option value="subject">제목에서</option>
						<option value="content">본문에서</option>
						<option value="name">글쓴이에서</option>
					</select>
					<input name="text" type="text" />
					<input type="submit" class="btn btn-primary" value="검색" />
				</div>
			</form>
		</div>
		
		<jsp:include page="/footer.jsp" />
	</div>
</body>
</html>