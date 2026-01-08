<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	core: 기본적인(핵심적인) 기능을 모아둔 파트 
	예: 변수 설정, 문자열 출력 기능, 조건문, 반복문 등
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<h3>구구단</h3>
	<table>
		<!-- 자바의 for문과 유사 -->
		<c:forEach var="i" begin="2" end="9">
			<tr>
				<c:forEach var="j" begin="1" end="9">
					<td style="width: 100px">${i} X ${j} = ${i*j}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	
	<!-- 
		(참고) varStatus 속성: 반복 상태를 담는 특별한 객체
		- 반복문이 몇번째 반복인지, 마지막 반복인지, 
		  혹은 인덱스 정보 등 반복 관련 정보를 얻고 싶을 때 사용
	-->
	<c:forEach var="i" begin="2" end="5" varStatus="loop">
		i=${i},
		index=${loop.index},
		count=${loop.count},
		first=${loop.first},
		last=${loop.last}
		<br>
	</c:forEach>
</body>
</html>