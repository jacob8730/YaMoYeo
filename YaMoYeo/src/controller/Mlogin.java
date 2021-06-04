package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;


@WebServlet("/memberLogin")
public class Mlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Mlogin() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String yId = request.getParameter("yId");
		String yPw = request.getParameter("yPw");
		
		MemberService mSvc = new MemberService();
		String loginId = mSvc.memberLogin(yId,yPw);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginId", loginId);
		
		response.sendRedirect("index.jsp");
		
	}

}