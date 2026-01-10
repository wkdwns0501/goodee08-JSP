package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO {
	// 싱글톤 패턴
	private static final BoardDAO instance = new BoardDAO();
	
	private BoardDAO() {}
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// board 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		int totalCount = 0;
		
		String sql = "SELECT COUNT(*) AS cnt FROM board";
		
		// 검색 조건이 있을 때만 WHERE 추가
		if (items != null && text != null && !items.isBlank() && !text.isBlank()) {
			sql += " WHERE " + items + " LIKE ?";
		}
		
		try (Connection conn = DBConnection.getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 검색 조건이 있을 때만 동적 바인딩
			if (items != null && text != null && !items.isBlank() && !text.isBlank()) {
				pstmt.setString(1, "%" + text + "%");
			}
			try (ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					// totalCount = rs.getInt(1);
					totalCount = rs.getInt("cnt");
				}
			} 
		} catch (Exception e) {
			System.out.println("getListCount 예외 발생: " + e);
		}
		
		return totalCount;
	}
	
	// board 테이블의 레코드 가져오기 (게시글 전체 조회)
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		int offset = (page - 1) * limit; // 페이징 처리 offset 계산(공식, 몇 개를 건너뛸지)
		String sql = "SELECT * FROM board";
		
		// 검색 조건이 있을 때만 WHERE 추가
		if (items != null && text != null && !items.isBlank() && !text.isBlank()) {
			sql += " WHERE " + items + " LIKE ?";
		}
		
		sql += " ORDER BY num DESC LIMIT ? OFFSET ?";
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try (Connection conn = DBConnection.getConnection();
		     PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			int paramIndex = 1;
			
			// 검색 조건이 있을 때만 동적 바인딩
			if (items != null && text != null && !items.isBlank() && !text.isBlank()) {
				pstmt.setString(1, "%" + text + "%");
			}			
			pstmt.setInt(paramIndex++, limit);
			pstmt.setInt(paramIndex, offset);
			try (ResultSet rs = pstmt.executeQuery()){
				while (rs.next()) {
					BoardDTO board = new BoardDTO();
					board.setNum(rs.getInt("num"));
					board.setId(rs.getString("id"));
					board.setName(rs.getString("name"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setRegistDay(rs.getString("regist_day"));
					board.setHit(rs.getInt("hit"));
					board.setIp(rs.getString("ip"));
					list.add(board);
				}
			}
		} catch (Exception e) {
			System.out.println("getBoardList 예외 발생: " + e);
		}
		
		return list;
	}
	
	// member 테이블에서 로그인된 id의 사용자명 가져오기
	public String getLoginNameById(String id) {
		String sql = "SELECT name FROM member WHERE id = ?";
		
		try (Connection conn = DBConnection.getConnection();
		     PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			try (ResultSet rs = pstmt.executeQuery()){
				while (rs.next()) {
					return rs.getString("name");
				}
			}
		} catch (Exception e) {
			System.out.println("getLoginNameById 예외 발생: " + e);
		}
		return null;
	}
	
	public int insertBoard(BoardDTO board) {
		String sql = "INSERT INTO board (id, name, subject, content, regist_day, hit, ip) "
					+ "VALUES (?, ?, ?, ?, DATE(NOW()), 0, ?)";
		try (Connection conn = DBConnection.getConnection();
		     PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setString(5, board.getIp());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertBoard 예외 발생: " + e);
		}
		return 0;
	}
	
}
