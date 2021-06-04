package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDTO;
import service.BoardService;

@WebServlet("/boardModifyForm")
public class BmodiForm extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BmodiForm() {
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
		
		int zNum = Integer.parseInt(request.getParameter("zNum"));
		
		BoardService bScv = new BoardService();
		BoardDTO board = new BoardDTO();
		
		board = bScv.boardView(zNum);
		request.setAttribute("modify", board);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("BModify.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
