package service;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BDAO;
import dto.BoardDTO;
import static dao.BDAO.*;
import static db.JdbcUtil.*;

public class BoardService {

	public int boardWrite(BoardDTO board) {
		BDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = 0;

		result = dao.boardWrite(board);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int ListCount() {
		BDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int listCount = dao.ListCount();

		close(con);

		return listCount;
	}

	public ArrayList<BoardDTO> BList(int startRow, int endRow) {
		BDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		ArrayList<BoardDTO> bList = dao.BList(startRow, endRow);

		close(con);

		return bList;
	}

	public BoardDTO boardView(int zNum) {
		BDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.boardHits(zNum);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		BoardDTO board = dao.boardView(zNum);

		close(con);

		return board;
	}

	public int boardModify(BoardDTO board) {
		BDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.boardModify(board);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return result;
	}

	public int boardDelete(int zNum) {
		BDAO dao = getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int result = dao.boardDelete(zNum);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return result;
	}


}
