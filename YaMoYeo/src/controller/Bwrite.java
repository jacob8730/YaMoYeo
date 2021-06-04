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


@WebServlet("/boardWrite")
public class Bwrite extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Bwrite() {
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

		// 업로드 할 파일의 크기 지정 , 10MB로 제한
		int size = 10 * 1024 * 1024;

		// 업로드 할 파일의 저장경로
		// '\\'를    '/'로 바꿔준다.
		String savePath = "C:/Users/27/Desktop/file/YaMoYeo/WebContent/fileUpload";
		
		// 파일업로드를 위해 cos.jar 라이브러리 필요
		// http://www.servlets.com 접속
		
		MultipartRequest multi = new MultipartRequest(
				request,	// 담아온 정보
				savePath,	// 저장경로
				size,		// 파일크기
				"UTF-8",	// 인코딩 방식
				new DefaultFileRenamePolicy()	// 중복 파일 이름바꾸기
				);
		
		
		// BoardWrite.jsp에서 입력한 데이터 받아오기
		String zId = multi.getParameter("zId");
		String zEmail = multi.getParameter("zEmail");
		String zLink = multi.getParameter("zLink");
		String zTitle = multi.getParameter("zTitle");
		String zCategories = multi.getParameter("zCategories");
		String zPlace = multi.getParameter("zPlace");
		String zPublic = multi.getParameter("zPublic");
		int zPersonnel = Integer.parseInt(multi.getParameter("zPersonnel"));
		String zContents = multi.getParameter("zContents");
		
		// 추가로 받아 온 정보 (파일 업로드)
		String zFile = multi.getFilesystemName((String)multi.getFileNames().nextElement());
		
		// 파일원본이름을 구할 때
		// String bFileName = multi.getOriginalFileName((String)multi.getFileNames().nextElement());
		
		// 게시판 정보를 담은 BoardDTO를 객체로 만들기
		// BoardDTO타입의 변수 board
		BoardDTO board = new BoardDTO();
		
		// board객체에 받아온 데이터 입력
		board.setzId(zId);
		board.setzEmail(zEmail);
		board.setzLink(zLink);
		board.setzTitle(zTitle);
		board.setzCategories(zCategories);
		board.setzPlace(zPlace);
		board.setzPublic(zPublic);
		board.setzPersonnel(zPersonnel);
		board.setzContents(zContents);
		board.setzFile(zFile);
		
		System.out.println("Controller에서 Service로 넘어가는 BoardDTO정보!");
		System.out.println("enctype으로 jsp에서 Controller로 데이터를 보낼 경우!");
		System.out.println(board);
		
		// BoardWriteService타입의 변수 writeSvc
		BoardService bSvc = new BoardService();
		
		// insert결과 확인하기 위해 int타입의 변수 result생성
		// writeSvc.boardWrite(board);
		// BoardWriteService클래스 boardWrite()메소드를 생성하고
		// 그 안에 작성한 글정보(board)를 담아서 간다.
		int result = bSvc.boardWrite(board);
		
		if(result>0) {
			//response.sendRedirect("boardList");
			response.sendRedirect("boardList");
		} else {
			response.sendRedirect("BWrite.jsp");
		}
	}
	
}
