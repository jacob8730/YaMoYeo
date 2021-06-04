package dao;

import static db.JdbcUtil.close;

import java.sql.*;
import java.util.ArrayList;

import dto.BoardDTO;

public class BDAO {

	private static BDAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public static BDAO getInstance() {
		if(dao==null) {
			dao = new BDAO();
		}
		
		return dao;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public int boardWrite(BoardDTO board) {
		int result = 0;		
		String sql ="INSERT INTO ZBOARD VALUES(ZNUM_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,?,SYSDATE,0,?)";		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, board.getzId());
			pstmt.setString(2, board.getzEmail());
			pstmt.setString(3, board.getzLink());
			pstmt.setString(4, board.getzTitle());
			pstmt.setString(5, board.getzCategories());
			pstmt.setString(6, board.getzPlace());
			pstmt.setString(7, board.getzPublic());
			pstmt.setInt(8, board.getzPersonnel());
			pstmt.setString(9, board.getzContents());
			pstmt.setString(10, board.getzFile());
			result = pstmt.executeUpdate();	
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int ListCount() {
		int listCount = 0;
		String sql ="SELECT COUNT(*) FROM ZBOARD";
		
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
	public ArrayList<BoardDTO> BList(int startRow, int endRow) {
		ArrayList<BoardDTO> bList = new ArrayList<BoardDTO>();
		BoardDTO board = null;
		
		String sql = "SELECT * FROM ZBLIST WHERE RN BETWEEN ? AND ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new BoardDTO();	
				
				board.setzNum(rs.getInt(1));
				board.setzId(rs.getString(2));
				board.setzEmail(rs.getString(3));
				board.setzLink(rs.getString(4));
				board.setzTitle(rs.getString(5));
				board.setzCategories(rs.getString(6));
				board.setzPlace(rs.getString(7));
				board.setzPublic(rs.getString(8));
				board.setzPersonnel(rs.getInt(9));
				board.setzContents(rs.getString(10));
				board.setzDate(rs.getDate(11));
				board.setzHits(rs.getInt(12));
				board.setzFile(rs.getString(13));
				
				bList.add(board);				
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}	
		
		return bList;
	}

	public int boardHits(int zNum) {
		int result = 0;		
		String sql = "UPDATE ZBOARD SET ZHITS=ZHITS+1 WHERE ZNUM=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, zNum);
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public BoardDTO boardView(int zNum) {
		BoardDTO board = null;		
		String sql ="SELECT * FROM ZBOARD WHERE ZNUM=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, zNum);			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardDTO();
				board.setzNum(rs.getInt(1));
				board.setzId(rs.getString(2));
				board.setzEmail(rs.getString(3));
				board.setzLink(rs.getString(4));
				board.setzTitle(rs.getString(5));
				board.setzCategories(rs.getString(6));
				board.setzPlace(rs.getString(7));
				board.setzPublic(rs.getString(8));
				board.setzPersonnel(rs.getInt(9));
				board.setzContents(rs.getString(10));
				board.setzDate(rs.getDate(11));
				board.setzHits(rs.getInt(12));
				board.setzFile(rs.getString(13));
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return board;
	}

	public int boardModify(BoardDTO board) {
		int result = 0;
		
		String sql="UPDATE ZBOARD SET ZEMAIL=?, ZLINK=?, ZTITLE=?, ZCATEGORIES=?, ZPLACE=?, ZPUBLIC=?, ZPERSONNEL=?, ZCONTENTS=?, ZFILE=? WHERE ZNUM=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getzEmail());
			pstmt.setString(2, board.getzLink());
			pstmt.setString(3, board.getzTitle());
			pstmt.setString(4, board.getzCategories());
			pstmt.setString(5, board.getzPlace());
			pstmt.setString(6, board.getzPublic());
			pstmt.setInt(7, board.getzPersonnel());
			pstmt.setString(8, board.getzContents());
			pstmt.setString(9, board.getzFile());
			pstmt.setInt(10, board.getzNum());
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}	
		return result;
	}

	public int boardDelete(int zNum) {
		int result = 0;
		
		String sql = "DELETE FROM ZBOARD WHERE ZNUM=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, zNum);
			result = pstmt.executeUpdate();
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
