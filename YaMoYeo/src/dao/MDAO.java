package dao;

import static db.JdbcUtil.close;

import java.sql.*;
import java.util.ArrayList;

import dto.MemberDTO;


public class MDAO {

	private static MDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static MDAO getInstance() {
		if(dao==null) {
			dao = new MDAO();
		}
		
		return dao;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	// 아이디 중복체크 메소드 idCheck()
	public String idCheck(String yId) {
		String checkId = null;

		String sql = "SELECT YID FROM YMEMBER WHERE YID=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, yId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				checkId = rs.getString(1);
			}
			
			
		} catch (SQLException se) {
			se.printStackTrace();
		}
		
		return checkId;
	}

	// 회원가입 메소드 memberJoin()
	public int memberJoin(MemberDTO member) {
		int result = 0;
		
		String sql="INSERT INTO YMEMBER VALUES(?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getyId());
			pstmt.setString(2, member.getyPw());
			pstmt.setString(3, member.getyName());
			pstmt.setString(4, member.getyBirth());
			pstmt.setString(5, member.getyGender());
			pstmt.setString(6, member.getyEmail());
			pstmt.setString(7, member.getyFile());
			
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 로그인 메소드 memberLogin()
	public String memberLogin(String yId, String yPw) {
		String loginId = null;
		String sql="SELECT YID FROM YMEMBER WHERE YID=? AND YPW=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, yId);
			pstmt.setString(2, yPw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginId = rs.getString(1);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return loginId;
	}

	// 전체 회원수를 구하는 메소드 mListCount()
	public int mListCount() {
		int listCount = 0;
		String sql ="SELECT COUNT(*) FROM YMEMBER";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return listCount;
	}

	public ArrayList<MemberDTO> memberList(int startRow, int endRow) {
		ArrayList<MemberDTO> yList = new ArrayList<MemberDTO>();
		MemberDTO member = null;
		
		String sql = "SELECT YID, YNAME, TO_CHAR(YBIRTH,'YYYY-MM-DD') FROM YMLIST WHERE RN BETWEEN ? AND ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new MemberDTO();				
				member.setyId(rs.getString(1));
				member.setyName(rs.getString(2));
				member.setyBirth(rs.getString(3));
								
				yList.add(member);		
			}
		} catch(SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return yList;
	}

	// 회원정보 상세보기 메소드 memberView()
	public MemberDTO memberView(String yId) {
		MemberDTO member = null;
		
		String sql ="SELECT YID, YPW, YNAME, TO_CHAR(YBIRTH,'YYYY-MM-DD'), YGENDER, YEMAIL, YFILE FROM YMEMBER WHERE YID=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, yId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO();
				member.setyId(rs.getString(1));
				member.setyPw(rs.getString(2));
				member.setyName(rs.getString(3));
				member.setyBirth(rs.getString(4));
				member.setyGender(rs.getString(5));
				member.setyEmail(rs.getString(6));
				member.setyFile(rs.getString(7));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(member);
		return member;

	}

	// 회원정보 수정 메소드 memberModify()
	public int memberModify(MemberDTO member) {
		int result = 0;
		String sql="UPDATE YMEMBER SET YPW=?, YNAME=?, YBIRTH=?, YGENDER=?, YEMAIL=?, YFILE=? WHERE YID=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getyPw());
			pstmt.setString(2, member.getyName());
			pstmt.setString(3, member.getyBirth());
			pstmt.setString(4, member.getyGender());
			pstmt.setString(5, member.getyEmail());
			pstmt.setString(6, member.getyFile());
			pstmt.setString(7, member.getyId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 회원탈퇴 메소드 memberDelete()
	public int memberDelete(String yId) {
		int result = 0;
		
		String sql="DELETE FROM YMEMBER WHERE YID=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, yId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}				
		return result;
	}
	
	
	
	
}