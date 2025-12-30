<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch06_ex10</title>
</head>
<body>
	<form action="form03_process.jsp">
		<p>과일:
			<label>
				<input type="checkbox" name="fruits" value="오렌지"> 오렌지
			</label>
			<label>
				<input type="checkbox" name="fruits" value="사과"> 사과
			</label>
			<label>
				<input type="checkbox" name="fruits" value="바나나"> 바나나
			</label>
		</p>
		<p><button type="submit">전송</button></p>
	</form>
</body>
</html>