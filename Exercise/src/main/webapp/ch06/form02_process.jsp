<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch06_ex08</title>
</head>
<body>
	<%
		StringBuffer sb = new StringBuffer();
		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String name = paramNames.nextElement();
			String[] paramValues = request.getParameterValues(name);
			for (int i = 0; i < paramValues.length; i++) {
				sb.append(name)
				  .append(" : ")
				  .append(paramValues[i])
				  .append("<br>");
			}
		}
	%>
	<p><%= sb %></p>
</body>
</html>