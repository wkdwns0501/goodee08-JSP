package ch04.com.dao;

// 로직 전용 자바빈
// JSP는 화면, 자바빈은 로직이라는 단순 분리
public class Calculator {
	public int process(int n) {
		return n * n * n;
	}
}
