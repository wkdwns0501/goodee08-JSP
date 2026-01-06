<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		
		// 간단한 로그인 검증
		if ("admin".equals(user_id) && "1234".equals(user_pw)) {
			// 쿠키를 설정하는 2가지 방법
			// 1. HTTP 헤더를 이용 (직접적, 비교적 복잡)
			// response.addHeader("Set-Cookie", "");
			
			// 2. 서블릿 API를 이용 (간접적, 비교적 간단)
			Cookie cookie_id = new Cookie("userId", user_id);
			Cookie cookie_pw = new Cookie("userPw", user_pw);
			
			// (중요) 자주 쓰는 쿠키 설정
			// cookie_id.setPath("/"); // 모든 경로에서 접근 가능
			// cookie_id.setHttpOnly(true); // JavaScript로 접근 불가(보안 강화)
																	 // 예: document.cookie
			// cookie_id.setSecure(true); // HTTPS에서만 서버로 전송(사용)
			// cookie_id.setMaxAge(60 * 5); // 5분 유효
			
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			
			out.println("쿠키 생성 성공<br>");
			out.println(user_id + "님 환영합니다.");
		} else {
			out.println("쿠키 생성 실패");
		}
		// 위 코드는 학습용, 실제 서비스에서는 비밀번호를 쿠키에 저장하면 안됨
		// 쿠키는 클라이언트에 일반 텍스트로 저장되어 탈취 가능(보안 위험)
		// 서버가 관리할 필요가 없는 클라이언트에서만 필요한 정보 + 보안이 필요하지 않은 정보는 쿠키에 저장
		
		/* 
			쿠키 사용 예
			1. 로그인 유지(세션ID가 저장된 세션 쿠키)
			2. 방문 기록 또는 사용자 설정 유지(예: 아이디 기억하기, 언어 설정)
			3. 광고/트래킹 용도(특히 제3자 쿠키 -> 비필수 쿠키)
		*/
	%>
</body>
</html>