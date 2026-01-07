package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	private static final String URL = "jdbc:mysql://localhost:3306/bookmarketdb";
	private static final String USER = "root";
	private static final String PASSWORD = "test1234";
	
	// 커넥션 생성 메소드
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 리소스 해제 메소드	
	// try-with-resources를 사용한다면 필요 없음
	public static void close(AutoCloseable...resources) {// 가변 인자 (배열)
		for (AutoCloseable r : resources) {
			if (r != null) {
				try {
					r.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}
