package DAO;

import DTO.lookbook_dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class lookbook_DAO {
	public Connection getConn() {
		Connection conn= null;
		
		try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String url = "jdbc:mysql://localhost:3306/affectdatabase";
            String user = "affect_admin";
            String pass = "dkdl45633!";
            conn = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println(e);
        }
		return conn;
	}
	
	public void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
				close(conn,pstmt);
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public void close(Connection conn, PreparedStatement pstmt) {
		if(conn!=null)
		{
			try {
				conn.close();
				pstmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<lookbook_dto> lookbookList(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<lookbook_dto> arr = new ArrayList();
		
		try {
			conn = getConn();
			String sql = "select * from lookbook ORDER BY lookNumber DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				lookbook_dto obj = new lookbook_dto();
				int number = rs.getInt("lookNumber");
				String name = rs.getString("userName");
				String date = rs.getString("date");
				String fileName = rs.getString("fileName");

				obj.setNumber(number);
				obj.setUserName(name);
				obj.setDate(date);
				obj.setFileName(fileName);
				
				arr.add(obj);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return arr;
	}
	
	
	public void lookbookInsert(lookbook_dto obj) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConn();
			String sql = "insert into lookbook(userId,userName,headwear,eyewear,piercing,necklace,outers,top,bottom,shoes,acc,etc,fileName,date) values (?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate())";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, obj.getUserId());
			pstmt.setString(2, obj.getUserName());
			pstmt.setString(3, obj.getHeadwear());
			pstmt.setString(4, obj.getEyewear());
			pstmt.setString(5, obj.getPiercing());
			pstmt.setString(6, obj.getNecklace());
			pstmt.setString(7, obj.getOuter());
			pstmt.setString(8, obj.getTop());
			pstmt.setString(9, obj.getBottom());
			pstmt.setString(10, obj.getShoes());
			pstmt.setString(11, obj.getAcc());
			pstmt.setString(12, obj.getEtc());
			pstmt.setString(13, obj.getFileName());
			
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt);
		}
	}
	
	public lookbook_dto getLook(String number) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		lookbook_dto obj = new lookbook_dto();
		
		try {
			conn = getConn();
			String sql = "select * from lookbook where lookNumber=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, number);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				obj.setHeadwear(rs.getString("headwear"));
				obj.setEyewear(rs.getString("eyewear"));
				obj.setPiercing(rs.getString("piercing"));
				obj.setNecklace(rs.getString("necklace"));
				obj.setOuter(rs.getString("outers"));
				obj.setTop(rs.getString("top"));
				obj.setBottom(rs.getString("bottom"));
				obj.setShoes(rs.getString("shoes"));
				obj.setAcc(rs.getString("acc"));
				obj.setEtc(rs.getString("etc"));
				obj.setFileName(rs.getString("fileName"));
			}
			
			return obj;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		
		return obj;
		
	}
}
