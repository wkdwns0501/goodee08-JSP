<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch03_ex10</title>
</head>
<body>
	<c:forEach var="i" begin="0" end="10" step="2">
		<c:out value="${i}"/>
	</c:forEach>
	
	<br>
	
	<c:forEach var="i" begin="0" end="10" step="1">
    <c:if test="${i % 2 == 0}">
      <c:out value="${i}"/>
    </c:if>
  </c:forEach>
  
  <br>
  
	<c:forEach var="i" begin="0" end="10">
    <c:if test="${i % 2 == 0}">
      ${i}
    </c:if>
  </c:forEach>
</body>
</html>