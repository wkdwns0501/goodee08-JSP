package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
			// 글 등록 페이지 출력
			requestLoginName(request);
			request.getRequestDispatcher("/board/writeForm.jsp").forward(request, response);
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
	        response.sendRedirect(contextPath + "/BoardListAction.do?pageNum=1");
		}
	}
	
	// Service 계층: 비즈니스 로직 부분 (원래 Controller와 분리되어야 함)
	// 등록된 글 목록 가져오기
	private void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		
		int pageNum = 1; // 현재 페이지 번호
		
		if (!request.getParameter("pageNum").isBlank()) {
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
	
	private int requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setIp(request.getRemoteAddr());
		
		// 이미 JSP에서 스크립트로 막고 있음
		if(board.getSubject() == null || board.getSubject().trim().isEmpty()) return 0;
		
		return dao.insertBoard(board);
	}

}
