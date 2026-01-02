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
		try {
		String num1 = request.getParameter("num1");
		String num2 = request.getParameter("num2");
		
		int number1 = Integer.parseInt(num1);
		int number2 = Integer.parseInt(num2);
		
		out.println(num1 + "/" + num2 + " = " + (number1 / number2) + "<br>");
		} catch (NumberFormatException e){
			// 예외 발생 시 오류 페이지로 이동하도록 작성
			RequestDispatcher dispatcher = request.getRequestDispatcher("tryCatch_error.jsp");
			dispatcher.forward(request, response);
			
			// 테스트: 리다이렉트 사용 시 데이터 유지X
			// response.sendRedirect("tryCatch_error.jsp");
		}
	%>
</body>
</html>