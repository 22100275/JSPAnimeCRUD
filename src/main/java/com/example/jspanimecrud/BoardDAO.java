package com.example.jspanimecrud;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.jspanimecrud.BoardVO;
import com.example.jspanimecrud.JDBCUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.example.jspanimecrud.*;
import java.io.File;

import javax.servlet.http.HttpServletRequest;

public class BoardDAO {
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	private final String BOARD_INSERT = "insert into book_list (name, author, genre, rating, episode, img, pg, director) values (?,?,?,?,?,?,?,?)";
	private final String BOARD_UPDATE = "update book_list set name=?, author=?, genre=?, rating=?, episode=?, img=?, pg=?, director=? where no=?";
	private final String BOARD_DELETE = "delete from book_list where no=?";
	private final String BOARD_GET = "select * from book_list where no=?";
	private final String BOARD_LIST = "select * from book_list order by no desc";


	public int insertBoard(BoardVO vo) {
		System.out.println("===> JDBC로 insertBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_INSERT);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getAuthor());
			stmt.setString(3, vo.getGenre());
			stmt.setInt(4, vo.getRating());
			stmt.setInt(5, vo.getEpisode());
			stmt.setString(6, vo.getImg());
			stmt.setInt(7, vo.getPg());
			stmt.setString(8, vo.getDirector());


			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> JDBC로 deleteBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_DELETE);
			stmt.setInt(1, vo.getNo());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateBoard(BoardVO vo) {
		System.out.println("===> JDBC로 updateBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_UPDATE);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getAuthor());
			stmt.setString(3, vo.getGenre());
			stmt.setInt(4, vo.getRating());
			stmt.setInt(5, vo.getEpisode());
			stmt.setString(6, vo.getImg());
			stmt.setInt(7, vo.getPg());
			stmt.setString(8, vo.getDirector());
			stmt.setInt(9, vo.getNo()); // no 값을 설정합니다.
			stmt.setDate(10, vo.getDate());

			System.out.println(vo.getName() + "-" + vo.getAuthor() + "-" + vo.getGenre() + "-" + vo.getRating() + "-" + vo.getNo() + "-" + vo.getEpisode() + "-" + vo.getImg() + "-" + vo.getPg() + "-" + vo.getDirector());
			stmt.executeUpdate();
			return 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}	
	
	public BoardVO getBoard(int no) {
		BoardVO one = new BoardVO();
		System.out.println("===> JDBC로 getBoard() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_GET);
			stmt.setInt(1, no);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setNo(rs.getInt("no"));
				one.setName(rs.getString("name"));
				one.setAuthor(rs.getString("author"));
				one.setGenre(rs.getString("genre"));
				one.setRating(rs.getInt("rating"));
				one.setEpisode(rs.getInt("episode"));
				one.setPg(rs.getInt("pg"));
				one.setImg(rs.getString("img"));
				one.setDirector(rs.getString("director"));
				one.setDate(rs.getDate("date"));

			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}
	
	public List<BoardVO> getBoardList(){
		List<BoardVO> list = new ArrayList<BoardVO>();
		System.out.println("===> JDBC로 getBoardList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				BoardVO one = new BoardVO();
				one.setNo(rs.getInt("no"));
				one.setName(rs.getString("name"));
				one.setAuthor(rs.getString("author"));
				one.setGenre(rs.getString("genre"));
				one.setDate(rs.getDate("date"));
				one.setRating(rs.getInt("rating"));
				one.setEpisode(rs.getInt("episode"));
				one.setPg(rs.getInt("pg"));
				one.setImg(rs.getString("img"));
				one.setDirector(rs.getString("director"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return list;
	}

	public String getPhotoFilename(int no) {
		String filename = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(BOARD_LIST);
			stmt.setInt(1, no);
			rs = stmt.executeQuery();

			if(rs.next()) {
				filename = rs.getString("img");
			}
			rs.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return filename;
	}


}
