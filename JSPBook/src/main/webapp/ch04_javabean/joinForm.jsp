<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
	<section class="formArea">
		<h1>회원정보 입력</h1>
		<form action="joinChk.jsp" method="post">
			<p>
				<label for="id">아이디: </label>
				<input type="text" name="id" id="id">
			</p>
			<p>
				<label for="pass">비밀번호: </label>
				<input type="password" name="pass" id="pass">
			</p>
			<p>
				<label for="name">이름: </label>
				<input type="text" name="name" id="name">
			</p>
			<p>
				<label for="gender">성별: </label>
				<input type="radio" name="gender" id="gender" value="male" checked>남
				<input type="radio" name="gender" value="female">여
			</p>
			<p>
				<label for="age">나이: </label>
				<input type="number" name="age" id="age">
			</p>
			<p>
				<label for="email">이메일: </label>
				<input type="email" name="email" id="email">
			</p>
			<button type="submit">가입</button>
			<button type="reset">다시 작성</button>
		</form>
	</section>
</body>
</html>