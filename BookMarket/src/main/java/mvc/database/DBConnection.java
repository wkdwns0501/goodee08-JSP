package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//데이터베이스 연결 클래스
public class DBConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/bookmarketdb";
	private static final String USER = "root";
	private static final String PASSWORD = "test1234";
	
	// 커넥션 생성 메소드
	// 유틸 클래스라면 throws가 더 좋은 설계(상위 계층에서 예외 처리 결정 가능)
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(URL, USER, PASSWORD);
	}
	
}
