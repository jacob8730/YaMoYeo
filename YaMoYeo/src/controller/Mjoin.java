package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.MemberDTO;
import service.MemberService;

@WebServlet("/memberJoin")
public class Mjoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Mjoin() {
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

		// 파일 업로드 관련 설정
		int size = 10 * 1024 * 1024;
		String savePath = "C:/Users/27/Desktop/file/YaMoYeo/WebContent/fileUpload";
		MultipartRequest multi = new MultipartRequest(request, savePath, size, "UTF-8", new DefaultFileRenamePolicy());

		// jsp에서 받아온 데이터 설정
		String yId 	   = multi.getParameter("yId");
		String yPw 	   = multi.getParameter("yPw");
		String yName   = multi.getParameter("yName");
		String yBirth  = multi.getParameter("yBirth");
		String yGender = multi.getParameter("yGender");
		String yEmail  = multi.getParameter("yEmail");
		String yFile   = multi.getFilesystemName((String) multi.getFileNames().nextElement());

		// 받아온 데이터 MemberDTO타입의 member에 set
		MemberDTO member = new MemberDTO();
		member.setyId(yId);
		member.setyPw(yPw);
		member.setyName(yName);
		member.setyBirth(yBirth);
		member.setyGender(yGender);
		member.setyEmail(yEmail);
		member.setyFile(yFile);

		// member정보를 service로 이동
		MemberService mSvc = new MemberService();
		int result = mSvc.memberJoin(member);
		
		if(result>0) {
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("JoinForm.jsp");
		}

	}

}