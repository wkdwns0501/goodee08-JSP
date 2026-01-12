<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Board</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container py-4">
		<jsp:include page="/menu.jsp" />
		
		<jsp:include page="/title.jsp">
			<jsp:param value="게시판" name="title"/>
			<jsp:param value="Board" name="sub"/>
		</jsp:include>
		
		<div class="row align-items-md-stretch text-center">
			<form method="post" action="<c:url value='/BoardUpdateAction.do?num=${board.num}&pageNum=${page}'/>">
				<div class="mb-3 row">
					<label class="col-sm-2 control-label">성명</label>
					<div class="col-sm-3">
						<input name="name" class="form-control" value="${board.name}" readonly/>
					</div>
				</div>
	
				<div class="mb-3 row">
					<label class="col-sm-2 control-label">제목</label>
					<div class="col-sm-5">
						<input name="subject" class="form-control" value="${board.subject}"/>
					</div>
				</div>
	
				<div class="mb-3 row">
					<label class="col-sm-2 control-label">내용</label>
					<div class="col-sm-8" style="word-break: break-all;">
						<textarea name="content" class="form-control" rows="5">${board.content}</textarea>
					</div>
				</div>
	
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
	
						<c:if test="${sessionScope.loginId == board.id}">
							<a href="<c:url value='/BoardDeleteAction.do?num=${board.num}&pageNum=${page}'/>" class="btn btn-danger">
								삭제
							</a>
							<input type="submit" class="btn btn-success" value="수정" />
						</c:if>
	
						<a href="<c:url value='/BoardListAction.do?pageNum=${page}'/>" class="btn btn-primary">
							목록
						</a>
					</div>
				</div>
			</form>
		</div>
	
		<jsp:include page="/footer.jsp" />
	</div>
</body>
</html>