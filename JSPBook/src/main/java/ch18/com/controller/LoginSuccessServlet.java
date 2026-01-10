package ch18.com.controller;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ch18/loginSuccess")
public class LoginSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 직접 접근 방지
        if (request.getSession().getAttribute("loginInfo") == null) {
            response.sendRedirect(request.getContextPath() + "/ch18/mvc.jsp");
            return;
        }

        request.getRequestDispatcher("/ch18/mvc_success.jsp")
               .forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}