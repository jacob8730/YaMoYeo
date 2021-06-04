package service;

import static dao.MDAO.*;
import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.MDAO;
import dto.MemberDTO;

public class MemberService {
	
	// 아이디 중복체크 메소드 idCheck()
	public String idCheck(String yId) {
		MDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		String checkId = dao.idCheck(yId);

		return checkId;
	}
	
	// 회원가입 메소드 memberJoin()
	public int memberJoin(MemberDTO member) {
		MDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.memberJoin(member);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);

		return result;
	}

	// 로그인 메소드 memberLogin()
	public String memberLogin(String yId, String yPw) {
		MDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		String loginId = dao.memberLogin(yId, yPw);

		close(con);

		return loginId;
	}

	// 전체 회원수를 구하는 메소드 mListCount()
	public int mListCount() {
		MDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int listCount = dao.mListCount();

		close(con);

		return listCount;
	}

	// 회원목록 메소드 memberList()
	public ArrayList<MemberDTO> memberList(int startRow, int endRow) {
		MDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		ArrayList<MemberDTO> yList = dao.memberList(startRow, endRow);
		
		close(con);		
		
		return yList;
	}

	// 회원정보 상세보기 메소드 memberView()
	public MemberDTO memberView(String yId) {
		MDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		MemberDTO member = dao.memberView(yId);
		
		close(con);
		
		return member;
	}

	// 회원정보 수정 메소드 memberModify()
	public int memberModify(MemberDTO member) {
		MDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int result = dao.memberModify(member);
		
		if(result>0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
		
	}

	// 회원탈퇴 메소드 memberDelete()
	public int memberDelete(String yId) {
		MDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int result = dao.memberDelete(yId);
		
		if(result>0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	

}

