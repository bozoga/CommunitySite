package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import oracle.jdbc.driver.DBConversion;

public class BoardDAO extends JDBCUtil{
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	private String sql = null;
	
	public static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	

	public String count(BoardVO vo) {
		String cnt=null;
		try {
			conn=getConnection();
			sql="select count(*) from board_tbl";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				cnt=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(rs, pstmt, conn);
		}return cnt;
		
	}
	
	public int delete(BoardVO vo) {
		int rss=0;
		try {
			conn=getConnection();
			sql="delete from board_tbl where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdx());
			rss=pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(pstmt, conn);
		}return rss;
		
	}
	
	public int update(BoardVO vo) {
		int rss=0;
		try {
			conn=getConnection();
			sql="update board_tbl set writer=?, subject=?, content=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getIdx());
			rss=pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(pstmt, conn);
		}return rss;
		
	}
	
	public int deleteComment(CommentVO vo) {
		int rss=0;
		try {
			conn=getConnection();
			sql="delete from comment_tbl where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdx());
			rss=pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(pstmt, conn);
		}return rss;
		
	}
	
	public int insertComment(CommentVO vo) {
		int rss=0;
		try {
			conn=getConnection();
			sql="insert into comment_tbl values ((select nvl(max(idx),0)+1 from comment_tbl),?,?,?,sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBidx());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
			rss=pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(pstmt, conn);
		}return rss;
		
	}
	
	public ArrayList<CommentVO> getCommentList(CommentVO vo) {
		ArrayList<CommentVO> list = null;
		try {
			conn=getConnection();
			sql="select * from comment_tbl where bidx=? order by idx";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getBidx());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<CommentVO>();
				do {
					CommentVO bvo = new CommentVO();
					bvo.setIdx(rs.getString(1));
					bvo.setBidx(rs.getString(2));
					bvo.setWriter(rs.getString(3));
					bvo.setContent(rs.getString(4));
					bvo.setRegdate(rs.getString(5));
					list.add(bvo);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(rs, pstmt, conn);
		}return list;
		
	}
	
	public int insert(BoardVO vo) {
		int rss=0;
		try {
			conn=getConnection();
			sql="insert into board_tbl values ((select nvl(max(idx),0)+1 from board_tbl),?,?,?,sysdate)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getWriter());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			rss=pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(pstmt, conn);
		}return rss;
		
	}
	
	public BoardVO getReadOne(BoardVO vo) {
		BoardVO bvo= null;
		try {
			conn=getConnection();
			sql="select * from board_tbl where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getIdx());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				bvo = new BoardVO();
				do {
					bvo.setIdx(rs.getString(1));
					bvo.setWriter(rs.getString(2));
					bvo.setSubject(rs.getString(3));
					bvo.setContent(rs.getString(4));
					bvo.setRegdate(rs.getString(5));
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(rs, pstmt, conn);
		}return bvo;
		
	}
	
	public ArrayList<BoardVO> getBoardList(BoardVO vo) {
		ArrayList<BoardVO> list = null;
		try {
			conn=getConnection();
			sql="select * from board_tbl order by idx desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<BoardVO>();
				do {
					BoardVO bvo = new BoardVO();
					bvo.setIdx(rs.getString(1));
					bvo.setWriter(rs.getString(2));
					bvo.setSubject(rs.getString(3));
					bvo.setRegdate(rs.getString(5));
					list.add(bvo);
				}while(rs.next());
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closeDBResource(rs, pstmt, conn);
		}return list;
		
	}
}
