<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 입력 정보 확인 페이지</title>
</head>
<body>
	<!-- Quiz: JoinBean 자바빈 객체를 join이라는 이름으로 생성(자바빈 등록) -->
	<jsp:useBean id="join" class="ch04.com.dao.JoinBean" scope="request"/>
	
	<!-- Quiz: 회원가입 폼에서 받아온 입력 값들을 자바빈 객체의 속성 값에 모두 저장 -->
	<jsp:setProperty name="join" property="*"/>
	
	<!-- Quiz: 자바빈 각 프로퍼티의 값을 가져와서 표시 -->
	<section class="formArea">
		<h1>회원정보 확인</h1>
		<p>
			아이디: <jsp:getProperty name="join" property="id"/>
		</p>
		<p>
			비밀번호: <jsp:getProperty name="join" property="pass"/>
		</p>
		<p>
			이름: <jsp:getProperty name="join" property="name"/>
		</p>
		<p>
			성별: <jsp:getProperty name="join" property="gender"/>
		</p>
		<p>
			나이: <jsp:getProperty name="join" property="age"/>
		</p>
		<p>
			이메일: <jsp:getProperty name="join" property="email"/>
		</p>
	</section>
</body>
</html>