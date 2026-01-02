<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<!-- 회원 가입 폼 페이지에서 입력한 데이터 형식 유효성 검사하기 -->
	<form name="member" action="validation05_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<p>이름: <input type="text" name="name"></p>
		<p>
			연락처: 
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> - 
			<input type="text" maxlength="4" size="4" name="phone2"> - 
			<input type="text" maxlength="4" size="4" name="phone3">
		</p>
		<p>이메일: <input type="text" name="email"></p>
		<button type="button" onclick="checkMember()">가입하기</button> 
	</form>
	
	<script type="text/javascript">
		function checkMember() {
			const form = document.member;
			const id = form.id.value;
			const passwd = form.passwd.value;
			const name = form.name.value;
			const phone = form.phone1.value + "-" + form.phone2.value + "-" + form.phone3.value;
			const email = form.email.value;
			
			// 아이디 - 영문 대소문자, 한글, 한글의 자음과 모음으로 시작
			const regExpId = /^[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/;
			
			// 비밀번호 - 숫자만 최소 4자리 이상
			// const regExpPasswd = /^[0-9]*$/; // *은 0번 이상 반복(빈 문자열도 허용)
			const regExpPasswd = /^[0-9]{4,}$/; // 최소 자릿수 요구(4자리 이상)
			
			// 이름 - 한글만
			const regExpName = /^[가-힣]+$/; // 최소 1글자 이상
			// const regExpName = /^[가-힣]{2,4}$/; // 2~4글자
			
			// 전화번호 - 전화번호 형식
			// const regExpPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
			const regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			
			// 이메일 - 이메일 형식
			const regExpEmail = 
					/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			// i : 대소문자 무시
			// ^[0-9a-zA-Z] : 첫 글자는 영문 또는 숫자여야 함
			// ([-_.]?[0-9a-zA-Z])* : - 또는 _ 또는 .가 있을 수도 있고 그 뒤에 영문 또는 숫자가 와야함
			// @ : 반드시 @ 하나
			// @뒤 도메인 부분도 동일한 패턴
			// \.[a-zA-Z]{2,3} : 최상위 도메인은 점(.) + 알파벳 2~3글자 
			
			// (참고) 더 간단하고 널리 쓰이는 이메일 검증 패턴
			// const regExpEmail = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
			
			if (!regExpId.test(id)) {
				alert("아이디는 문자로 시작해주세요!");
				return;
			}
			
			if (!regExpPasswd.test(passwd)) {
				alert("비밀번호는 4자리 이상의 숫자만 입력해주세요!")
				return;
			}
			
			if (!regExpName.test(name)) {
				alert("이름은 최소 1글자 이상의 한글만 입력해주세요!")
				return;
			}
			
			if (!regExpPhone.test(phone)) {
				alert("전화번호 형식으로 입력해주세요!")
				return;
			}
			
			if (!regExpEmail.test(email)) {
				alert("이메일 형식으로 입력해주세요!")
				return;
			}
			
			form.submit();
		}
	</script>
</body>
</html>