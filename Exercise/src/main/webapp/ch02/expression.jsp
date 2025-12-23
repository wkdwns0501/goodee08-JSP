<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch02_ex09</title>
</head>
<body>
	<%! 
		Calendar now = Calendar.getInstance(); 
		int hour = now.get(Calendar.HOUR);
		int minute = now.get(Calendar.MINUTE);
		int second = now.get(Calendar.SECOND);
	%>
	<%= hour + "시 " + minute + "분 " + second + "초"%>
</body>
</html>