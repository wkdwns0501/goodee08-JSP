<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch06_ex08</title>
</head>
<body>paramValues
	<%
		String[] paramValues = request.getParameterValues("fruits");
	
		StringBuffer sb = new StringBuffer();
		sb.append("선택한 과일: ");
	
		if (paramValues != null) {
			for (int i = 0; i < paramValues.length; i++) {
				sb.append(paramValues[i]);
				if (i < paramValues.length - 1) {
					sb.append(", ");
				}
			}
		}
	%>
	<p><%= sb %></p>
</body>
</html>