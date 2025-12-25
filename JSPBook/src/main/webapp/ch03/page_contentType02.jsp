<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        <!-- text/xml -->
<!-- 
	(참고)
	pageEncoding: 서버에서 JSP 파일을 처리할 때 UTF-8로 해석
	contentType: 클라이언트(브라우저)에게 "응답은 UTF-8이야" 라고 알려줌
 -->
<!DOCTYPE html>
<html>
<head>
<title>Directives Tag - xml</title>
</head>
<body>
	<!-- page 디렉티브 태그에 콘텐츠 유형을 마이크로소프트 XML 문서로 설정하기 -->
	<!-- xml 설정 시 JSP 오류 때문에 써보기만하고 다시 html로 설정한 상태 -->
	<h2>contentType 디렉티브 태그</h2>
	<h4>text/xml: XML 출력</h4>
	<h4>charset=UTF-8: 문자 인코딩</h4>
</body>
</html>