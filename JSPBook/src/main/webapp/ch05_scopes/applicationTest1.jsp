<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application Test</title>
</head>
<body>
	<!-- 
		application: 애플리케이션의 실행 환경 정보를 저장한 객체 
		1. 애플리케이션의 실행 환경 및 서버 자원에 대한 정보를 제공
		2. 웹 애플리케이션당 오직 하나의 객체만 생성되므로 
		   애플리케이션 전체에서 공유되는 데이터를 관리하는데 주로 사용
	-->
	
	<h2>application 테스트</h2>
	<table border="1">
		<tr>
			<td>JSP 버전</td>
			<td><%= application.getMajorVersion() %>.<%= application.getMinorVersion() %></td>			 
		</tr>
		<tr>
			<td>컨테이너 정보</td>
			<td><%= application.getServerInfo() %></td>			 
		</tr>
		<tr>
			<td>웹 애플리케이션의 실제 파일시스템 경로</td>
			<td><%= application.getRealPath("/") %></td> <!-- "/" 루트 경로 얻기 -->			 
		</tr>
	</table>
	
</body>
</html>