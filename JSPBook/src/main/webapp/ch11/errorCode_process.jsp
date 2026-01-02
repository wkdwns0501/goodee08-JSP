<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exception</title>
</head>
<body>
	<%
		// 나누기 연산 수행 후 결과 출력
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		
		int number1 = Integer.parseInt(num1);
		int number2 = Integer.parseInt(num2);
		
		out.println(num1 + "/" + num2 + " = " + (number1 / number2) + "<br>");
	%>
</body>
</html>