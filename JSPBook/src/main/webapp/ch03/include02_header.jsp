<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- 나중에 작업할때 여기서부터 -->
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag - include(header)</title>
</head>
<body> <!-- 여기 까지는 지우고 작업, 밑에도 -->
	<%!
		int pageCount = 0;
		void addCount() {
			pageCount++;
		}
	%>
	<%
		addCount();
	%>

	<header>
		<p>이 사이트 방문은 <%= pageCount %> 번째 입니다.</p>
	</header>
</body> <!-- 여기서부터 -->
</html> <!-- 여기까지 삭제 -->