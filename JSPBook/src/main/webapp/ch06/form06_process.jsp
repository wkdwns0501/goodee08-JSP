<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
		</tr>
		
		<%
			Enumeration<String> paramNames = request.getParameterNames();
			while (paramNames.hasMoreElements()) {
				String name = paramNames.nextElement();
				String[] paramValues = request.getParameterValues(name);
	
				String delimiter = "";
				if ("tel".equals(name)) {
					delimiter = "-";
				} else if ("hobby".equals(name)) {
					delimiter = ", ";
				}
	
				StringBuilder sb = new StringBuilder();
				if (paramValues != null) {
					for (int i = 0; i < paramValues.length; i++) {
						sb.append(paramValues[i]);
						if (i < paramValues.length - 1) {
							sb.append(delimiter);
						}
					}
				}
				out.println("<tr>");
				out.println("<td>" + name + "</td>");
				out.println("<td>" + sb + "</td>");
				out.println("</tr>");
			}
		%>
	</table>
</body>
</html>