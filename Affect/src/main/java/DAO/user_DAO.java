package DAO;
import java.sql.*;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import DTO.user_dto;

public class user_DAO {
	public Connection getConn() {
		Connection conn= null;
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
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

	public void userInsert(user_dto user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String id = user.getId();
		String password = user.getPassword();
		String name = user.getName();
		String mail = user.getMail();
		
		try {
			conn = getConn();
			String sql = "insert into user(id,password,name,mail) values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, mail);
			
			int result = pstmt.executeUpdate();
			
			if(result==1) {
				System.out.println("user insert success");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt);
		}
	}
	
	public user_dto loginCheck(user_dto user) {
		/*
		바인딩되어 전달된 userDTO의 아이디와 비밀번호를 사용하여
		db에서 일치되는 정보가 있는지 찾고, 있다면 (userDTO)result 객체에 정보를 바인딩하여 리턴한다.
		없으면 널값을 리턴한다.
		 */
		String id = user.getId();
		String password = user.getPassword();
		
		user_dto result = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			result = new user_dto();
			conn = getConn();
			String sql = "select * from user where id=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result.setNumber(rs.getInt("usernumber"));
				result.setId(rs.getString("id"));
				result.setPassword(rs.getString("password"));
				result.setName(rs.getString("name"));
				result.setMail(rs.getString("mail"));
				return result;
			}
			else {
				return null;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(conn, pstmt, rs);
		}
		return null;
	}
	
	public boolean duplicationCheck(user_dto user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String id = user.getId();

		try {
			/*
			아이디를 사용하여 중복된 아이디가 있는지 체크한다.
			 */
			conn = getConn();
			String sql = "select * from user where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true;
				//중복된 아이디 있음
			}
			else {
				return false;
				//중복된 아이디 없음
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return false;
	}

	public String searchPassword(user_dto user) {
		String id = user.getId();
		String mail = user.getMail();
		String password = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		/*
		아이디와 메일로 비밀번호를 찾아주도록 한다.
		rs가 존재하면 일치하는 정보가 있다는 것이므로 password 컬럼의 값 리턴
		re가 없다면 Null을 리터한다.
		 */
		try {
			conn = getConn();
			String sql = "select * from user where id=? AND mail=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, mail);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				password = rs.getString("password");
				return password;
			}else {
				return null;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		
		return null;
	}

	public void userInformationModify(user_dto user) {
		//user 객체의 아이디를 추출해 정보를 찾아서 수정
		Connection conn = null;
		PreparedStatement pstmt = null;
		String temp ="";
		int result = 0;

		if(!user.getName().equals("")) {
			temp = temp + " name='"+user.getName()+"',";
		}
		if(!user.getMail().equals("")){
			temp = temp + " mail='"+user.getMail()+"',";
		}
		if(!user.getPassword().equals("")){
			temp = temp + " password='"+user.getPassword()+"',";
		}
		if(temp.equals("")) return;

		temp = temp.substring(0,temp.length()-1);

		try {
			conn = getConn();
			String sql ="UPDATE `affectdatabase`.`user` SET"+ temp +" WHERE id = '"+user.getId()+"'";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();

		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}
	}
}
