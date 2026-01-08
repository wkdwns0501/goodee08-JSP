<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	core: 기본적인(핵심적인) 기능을 모아둔 파트 
	예: 변수 설정, 문자열 출력 기능, 조건문, 반복문 등
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- SELECT 쿼리문 실행하기 -->
	<sql:setDataSource var="dataSource"
		driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/jspbookdb"
		user="root"
		password="test1234"
	/>
	
	<sql:query var="resultSet" dataSource="${dataSource}">
		SELECT * FROM member
	</sql:query>
	<!-- (참고) JSTL이 제공하는 Result 객체 -->
	
	<table border="1">
		<tr>
			<!-- items: 자바의 for-each문과 같은 역할 -->
			<c:forEach var="columnName" items="${resultSet.columnNames}">
				<th style="width: 100px">
					<c:out value="${columnName}"></c:out>
				</th>
			</c:forEach>
		</tr>
	
		<c:forEach var="row" items="${resultSet.rowsByIndex}">
			<tr>
				<c:forEach var="column" items="${row}">
					<td>
						<c:if test="${column != null}">
							<c:out value="${column}"/>
						</c:if>
						<c:if test="${column == null}">
							&nbsp;
						</c:if>
					</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>