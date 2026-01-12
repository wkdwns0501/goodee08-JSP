package mvc.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mvc.database.DBConnection;
import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

// 게시판 컨트롤러
@WebServlet("*.do") // 예제용
// @WebServlet("board/*") // 실제 서비스 구현 시
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static final int LIST_COUNT = 5; // 한 번에 표시할 게시글 수

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 조회 / 화면 출력
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath(); // BookMarket
		String command = requestURI.substring(contextPath.length());
		
		// 기능별 하나의 컨트롤러에서 요청 URL로 분기하던가
		// 아니면 요청 URL 별로 컨트롤러를 여러 개 만들어야 됨
		if (command.equals("/BoardListAction.do")) { // 등록된 글 목록 페이지 출력하기
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board/list.jsp");
			// (참고) MVC 패턴 권장 구조: JSP 직접 접근 차단(WEB-INF 하위는 URL로 접근불가)
			// RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/board/list.jsp");
			rd.forward(request, response);
		} else if (command.equals("/BoardWriteForm.do")) {
			// 글 등록 페이지 출력(조회)
			requestLoginName(request);
			request.getRequestDispatcher("/board/writeForm.jsp").forward(request, response);
		} else if (command.equals("/BoardViewAction.do")) {
			// 선택된 글 상세 페이지 출력
			// 서비스에서 반환된 값을 뷰에 전달(가장 권장되는 구조)
			BoardDTO board = requestBoardView(request);
			
			request.setAttribute("num", request.getParameter("num"));
			request.setAttribute("page", request.getParameter("pageNum"));
			request.setAttribute("board", board);
			
			request.getRequestDispatcher("/board/view.jsp").forward(request, response);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 등록 / 수정 / 삭제
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath(); // BookMarket
		String command = requestURI.substring(contextPath.length());
		
		if (command.equals("/BoardWriteAction.do")) {
			// 새로운 글 등록
			requestBoardWrite(request);
			// 글 목록으로 리다이렉트
	        response.sendRedirect(contextPath + "/BoardListAction.do"); // /BoardListAction.do?pageNum=1 도 가능
		}
	}
	
	// Service 계층: 비즈니스 로직 부분 (원래 Controller와 분리되어야 함)
	// 등록된 글 목록 가져오기
	private void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		int pageNum = 1; // 현재 페이지 번호
		
		if (request.getParameter("pageNum") != null 
			&& !request.getParameter("pageNum").trim().isEmpty()) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		int limit = LIST_COUNT; // 한 번에 표시될 게시글 수: 5개
		
		String items = request.getParameter("items"); // 검색 조건(제목, 본문, 글쓴이)
		String text = request.getParameter("text"); // 검색어
		
		int total_record = dao.getListCount(items, text); // 전체 레코드 수
		ArrayList<BoardDTO> boardList = dao.getBoardList(pageNum, limit, items, text);
		
		// 11.0 / 5.0 = 2.2 -> 3.0 -> 3페이지
		int total_page = (int) Math.ceil((double) total_record / limit);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardList", boardList);
	}
	
	// 로그인 인증된 사용자명 가져오기
	private void requestLoginName(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		String id = request.getParameter("id");
		
		String name = dao.getLoginNameById(id);
		
		request.setAttribute("name", name);
	}
	
	// 게시글 등록
	private int requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setIp(request.getRemoteAddr());
		
		// 가입 일자를 자바에서 넣어줄 때
		// String registDay = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
		// board.setRegistDay(registDay);
		
		// 이미 JSP에서 스크립트로 막고 있음
		if(board.getSubject() == null || board.getSubject().trim().isEmpty()) return 0;
		
		return dao.insertBoard(board);
	}
	
	// 선택된 글 상세 페이지 가져오기(단일 조회)
	// (중요) 게시글이 정상적으로 조회된 경우에만 조회수를 증가(조회 실패 -> 조회수 증가도 취소)
	// => 트랜잭션으로 묶기
	// 1. 트랜잭션 처리는 DAO 내부가 아니라 "서비스 로직"에 위치
	// 	  DAO는 트랜잭션을 모름, 단지 주어진 Connection으로 SQL을 실행할 뿐
	// 2. 하나의 Connection을 공유해야 함
	// 3. autoCommit = false 로 설정(기본값: true)
	private BoardDTO requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		int num = Integer.parseInt(request.getParameter("num")); // 게시글 번호
		
		// 트랜잭션 포맷
		try (Connection conn = DBConnection.getConnection()) {
			conn.setAutoCommit(false); // 자동 저장 끄기(트랜잭션 시작)
			
			try {
				// 여러 DB 작업 수행
				// 1. 게시글 조회
				BoardDTO board = dao.getBoardByNum(conn, num);
				if (board == null) {
					throw new RuntimeException("게시글이 존재하지 않습니다.");
				}
				
				// 2. 조회수 증가
				dao.updateHit(conn, num);
				
				conn.commit(); // 작업 모두 성공 시 확정(DB에 최종 반영)
				return board;
			} catch (Exception e) {
				conn.rollback(); // 하나라도 예외 발생 시 전부 취소
				e.printStackTrace();
				return null;
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
