<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<!-- 파일 업로드 및 정보 출력하기 -->
	<!-- 참고: https://www.notion.so/JSP-Servlet-2d7ef6e7ff1c8073916de22fc1617ee3 -->
	
	<!-- context path: 웹 애플리케이션의 루트 경로를 의미 -->
	<!-- 
		예: 톰캣에서 주소가 
		http://localhost:8080/JSPBook/fileupload01Process 이면 /JSPBook을 의미
	-->
	<!-- context path 얻는 방법 -->
	<form action="<%= request.getContextPath() %>/fileupload01Process" method="post" enctype="multipart/form-data">
	<!-- <form action="/JSPBook/fileupload01Process" method="post" enctype="multipart/form-data"> -->
		<p>이름: <input type="text" name="name"></p>
		<p>제목: <input type="text" name="subject"></p>
		<p>파일: <input type="file" name="uploadFile"></p>
		<button type="submit">파일 올리기</button>
	</form>
</body>
</html>