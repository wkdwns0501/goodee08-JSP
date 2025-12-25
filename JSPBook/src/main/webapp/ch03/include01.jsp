<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag - include</title>
</head>
<body>
	<!-- include 디렉티브 태그로 외부 파일 내용 포함하기 -->
	<!-- 
		사용 목적? 공통 레이아웃(예: 헤더, 푸터), 공통 로직(예: DB 연결)
		코드의 재사용성 + 유지보수성
		중복 코드를 줄이고 외부 파일 한 곳만 수정하면 됨
	-->
	<!-- 지금한건 정적 include -->
	<%@ include file="include01_header.jsp" %>
	<h4>---------------- 현재 페이지 영역 ----------------</h4>
	
	<!-- 
		(동적 include : 이동 -> 실행 -> 컴파일 -> 원래 파일로 가져옴)
		이때 포함되는 파일은 실제 컴파일 과정을 거쳐서 그 결과가 해당 JSP 페이지에 포함되는 것이 
		아니라
		(정적 include)
		JSP 소스 코드 자체가 해당 JSP 페이지에 복사되어 더해지고 합쳐진 결과가 서블릿으로 변환됨
		그 결과 include되는 파일의 개수가 아무리 많아도 단 한 번만 컴파일이 이루어지게 됨
	-->
	
</body>
</html>