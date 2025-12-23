package ch01;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ServletLifeCycle
 */
@WebServlet("/ServletLifeCycle") // 배포 서술자: URL 매핑
public class ServletLifeCycle extends HttpServlet { 
// 서블릿 클래스: HttpServlet을 상속받아 HTTP 요청을 처리하는 서버 측 자바 클래스
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletLifeCycle() {
    	// 생성자: 첫 번째 클라이언트 요청이 들어올 때 실행됨
        super();
        System.out.println("Constructor");
    }
    
    @Override
	public void init(ServletConfig config) throws ServletException {
    	// init(): 첫 번째 요청이 들어올 때만 호출됨
    	// 두 번째 요청부터는 호출되지 않음
		super.init(config);
		System.out.println("init");
	}
    
    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// service(): 클라이언트의 요청이 들어올 때마다 반복적으로 호출되면서 각 클라이언트의 요청을 처리
    	System.out.println("service");
		super.service(request, response);
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(): 클라이언트가 get 방식으로 요청을 하면 호출됨
		System.out.println("doGet");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doPost(): 클라이언트가 post 방식으로 요청을 하면 호출됨
		System.out.println("doPost");
//		doGet(request, response);
	}
	
	@Override
	public void destroy() {
		// destroy(): 서블릿 인스턴스가 소멸되기 직전에 단 한 번만 호출되는 메소드
		// 예: 톰캣 서비스를 중지하면 실행됨
		System.out.println("destroy");
		super.destroy();
	}

}
