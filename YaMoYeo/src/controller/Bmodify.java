package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.BoardDTO;
import service.BoardService;


@WebServlet("/boardModify")
public class Bmodify extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Bmodify() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int size = 10 * 1024 * 1024;

		String savePath = "C:/Users/27/Desktop/file/YaMoYeo/WebContent/fileUpload";

		MultipartRequest multi = new MultipartRequest(request, // 담아온 정보
				savePath, // 저장경로
				size, // 파일크기
				"UTF-8", // 인코딩 방식
				new DefaultFileRenamePolicy() // 중복 파일 이름바꾸기
		);

		int zNum = Integer.parseInt(multi.getParameter("zNum"));
		String zEmail = multi.getParameter("zEmail");
		String zLink = multi.getParameter("zLink");
		String zTitle = multi.getParameter("zTitle");
		String zCategories = multi.getParameter("zCategories");
		String zPlace = multi.getParameter("zPlace");
		String zPublic = multi.getParameter("zPublic");
		int zPersonnel = Integer.parseInt(multi.getParameter("zPersonnel"));
		String zContents = multi.getParameter("zContents");
		String zFile = multi.getFilesystemName((String)multi.getFileNames().nextElement());

		BoardDTO board = new BoardDTO();

		board.setzNum(zNum);
		board.setzEmail(zEmail);
		board.setzLink(zLink);
		board.setzTitle(zTitle);
		board.setzCategories(zCategories);
		board.setzPlace(zPlace);
		board.setzPublic(zPublic);
		board.setzPersonnel(zPersonnel);
		board.setzContents(zContents);
		board.setzFile(zFile);
		
		BoardService bSvc = new BoardService();
		
		int result = bSvc.boardModify(board);

		if (result > 0) {
			response.sendRedirect("boardView?zNum=" + zNum);
		} else {
			response.sendRedirect("boardList");
		}
	}
	
}
