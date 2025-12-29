<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gugudanDAO" class="ch04.com.dao.GuGuDan" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch04_ex10</title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<form method="get" action="useBean.jsp">
		출력할 단 선택:
    <select name="dan">
      <option value="">-- 선택 --</option>
      <option value="1">1단</option>
      <option value="2">2단</option>
      <option value="3">3단</option>
      <option value="4">4단</option>
      <option value="5">5단</option>
      <option value="6">6단</option>
      <option value="7">7단</option>
      <option value="8">8단</option>
      <option value="9">9단</option>
    </select>
    <input type="submit" value="출력">
	</form>


	<%
    String danParam = request.getParameter("dan");

    if (danParam != null) {
        int dan = Integer.parseInt(danParam);
        out.print(gugudanDAO.process(dan));
    }
	%>
	
</body>
</html>