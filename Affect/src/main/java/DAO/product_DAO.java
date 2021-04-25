package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.product_dto;
import com.mysql.cj.x.protobuf.MysqlxPrepare;

import javax.swing.text.html.HTMLDocument;

public class product_DAO {
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

	public void productInsert(product_dto product){
		Connection conn = null;
		PreparedStatement pstmt = null;
		//바인딩되어 넘어온 프로덕트 객체를 가지고 디비에 저장한다.

		try{
			conn = getConn();
			String sql = "insert into product(category,productName,productPrice,productThumbnail) values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,product.getCategory());
			pstmt.setString(2,product.getProductName());
			pstmt.setInt(3,product.getProductPrice());
			pstmt.setString(4,product.getProductThumbnail());

			pstmt.execute();

		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}
	}
	
	public ArrayList<product_dto> productList(String cate){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<product_dto> arr = new ArrayList<>();
		
		String tail;
		if(cate==null) tail="";
		else if(cate.equals("null")) tail="";
		else tail = " where category='" + cate + "'";
		
		try {
			conn = getConn();
			String sql = "select * from product" + tail;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {

				product_dto product = new product_dto();
				String category = rs.getString("category");
				String name = rs.getString("productName");
				String thumbnail = rs.getString("productThumbnail");
				int number = rs.getInt("productNumber");
				int price = rs.getInt("productPrice");
				
				product.setCategory(category);
				product.setProductName(name);
				product.setProductThumbnail(thumbnail);
				product.setProductNumber(number);
				product.setProductPrice(price);
				
				arr.add(product);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return arr;
	}
	
	public ArrayList<product_dto> searchList(String key){
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<product_dto> arr = new ArrayList<>();
		
		try {
			conn=getConn();
			String sql = "select * from product where category=? OR productName like '%"+key+"%'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, key);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				product_dto product = new product_dto();
				String category = rs.getString("category");
				String name = rs.getString("productName");
				String thumbnail = rs.getString("productThumbnail");
				int number = rs.getInt("productNumber");
				int price = rs.getInt("productPrice");
				
				product.setCategory(category);
				product.setProductName(name);
				product.setProductThumbnail(thumbnail);
				product.setProductNumber(number);
				product.setProductPrice(price);
				
				arr.add(product);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return arr;
	}

    public product_dto getProduct(String category, String productNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		product_dto obj = new product_dto();

		try{
			conn = getConn();
			String sql = "select * from product where category=? AND productNumber=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,category);
			pstmt.setString(2,productNumber);
			rs = pstmt.executeQuery();

			while(rs.next()){
				obj.setProductThumbnail(rs.getString("productThumbnail"));
				obj.setProductName(rs.getString("productName"));
				obj.setProductPrice(Integer.parseInt(rs.getString("productPrice")));
				obj.setCategory(rs.getString("category"));
				obj.setProductNumber(Integer.parseInt(rs.getString("productNumber")));
				obj.setProductIntro(rs.getString("productIntro"));
			}

		}catch (Exception e){
			e.printStackTrace();
		}
		finally {
			close(conn,pstmt,rs);
		}

		return obj;
    }

    public boolean addWishList(String userNumber, String productNumber, String productCategory) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result=false;

		try{
			conn = getConn();
			String sql = "insert into wishlist values(?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userNumber);
			pstmt.setString(2,productNumber);
			pstmt.setString(3,productCategory);

			int queryResult = pstmt.executeUpdate();
			if(queryResult>=1) result = true;

		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}

		return result;
    }

    public ArrayList<product_dto> getWishList(int userNumber) {
		//userNumber 를 기준으로 위시리스트의 값을 가져옴
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<product_dto> arr = new ArrayList<>();

		try{
			conn = getConn();
			String sql = "select product.productNumber,product.productName,product.productPrice,product.category,product.productThumbnail from user,wishlist,product where user.usernumber = wishlist.usernumber and wishlist.productNumber = product.productNumber and user.usernumber=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNumber);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				product_dto obj = new product_dto();

				obj.setProductPrice(rs.getInt("productPrice"));
				obj.setProductName(rs.getString("productName"));
				obj.setCategory(rs.getString("category"));
				obj.setProductThumbnail(rs.getString("productThumbnail"));
				obj.setProductNumber(rs.getInt("productNumber"));

				arr.add(obj);
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}

		return arr;
    }

    public boolean addCartList(String userNumber, String productNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result=false;

		try{
			conn = getConn();
			String sql = "insert into cartlist values(?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userNumber);
			pstmt.setString(2,productNumber);

			int queryResult = pstmt.executeUpdate();

			if(queryResult>=1) result = true;
			else result = false;

		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}

		return result;
    }

	public ArrayList<product_dto> getCartList(int userNumber) {
		//userNumber 를 기준으로 카트리스트의 값을 가져옴
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<product_dto> arr = new ArrayList<>();

		try{
			conn = getConn();
			String sql = "select * from user,product,cartlist where usernumber=userNumber_cart AND product.productNumber=productNumber_cart AND usernumber =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNumber);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				product_dto obj = new product_dto();

				obj.setProductPrice(rs.getInt("productPrice"));
				obj.setProductName(rs.getString("productName"));
				obj.setCategory(rs.getString("category"));
				obj.setProductThumbnail(rs.getString("productThumbnail"));
				obj.setProductNumber(rs.getInt("productNumber"));

				arr.add(obj);
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}

		return arr;
	}

	public boolean deleteWishList(String userNumber, String productNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result=false;

		try{
			conn = getConn();
			String sql = "delete from wishlist where usernumber=? AND productNumber=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userNumber);
			pstmt.setString(2,productNumber);

			int queryResult = pstmt.executeUpdate();
			if(queryResult>=1) result = true;

		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}

		return result;
	}

	public boolean deleteCartList(String userNumber, String productNumber) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean result=false;

		try{
			conn = getConn();
			String sql = "delete from cartlist where userNumber_cart=? AND productNumber_cart=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userNumber);
			pstmt.setString(2,productNumber);

			int queryResult = pstmt.executeUpdate();
			if(queryResult>=1) result = true;

		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt);
		}

		return result;
	}

    public void buyProduct(String userNumber, String usedCp, String[] buyArr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try{
			conn = getConn();
			for(int i=0; i<buyArr.length; i++){
				String sql = "insert into buylist(userNumber,productNumber,buyDate) values (?,?,sysdate())";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,userNumber);
				pstmt.setString(2,buyArr[i]);
				pstmt.executeUpdate();
			}

			String sql = "DELETE FROM couponlist WHERE (userNumber = ?) and (cpNumber = ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userNumber);
			pstmt.setString(2,usedCp);
			pstmt.executeUpdate();

			sql = "DELETE FROM cartlist WHERE userNumber_cart=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userNumber);
			pstmt.executeUpdate();

		}catch (Exception e){
			e.printStackTrace();;
		}finally {
			close(conn, pstmt);
		}
    }

	public ArrayList<product_dto> getBuyList(int userNumber) {
		//userNumber 를 기준으로 구매리스트의 값을 가져옴
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<product_dto> arr = new ArrayList<>();

		try{
			conn = getConn();
			String sql = "select * from user,product,buylist where user.usernumber=buylist.userNumber AND product.productNumber=buylist.productNumber AND user.usernumber=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNumber);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				product_dto obj = new product_dto();

				obj.setProductPrice(rs.getInt("productPrice"));
				obj.setProductName(rs.getString("productName"));
				obj.setCategory(rs.getString("category"));
				obj.setProductThumbnail(rs.getString("productThumbnail"));
				obj.setProductNumber(rs.getInt("productNumber"));

				arr.add(obj);
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}

		return arr;
	}
}
