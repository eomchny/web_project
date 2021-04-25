package DAO;

import DTO.review_dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class review_DAO {
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

    public void addReview(review_dto obj) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        int userNumber = obj.getUserNumber();
        int productNumber = obj.getProductNumber();
        int score = obj.getScore();
        String content = obj.getReviewContent();

        try{
            conn = getConn();
            String sql = "INSERT INTO review (userNumber, productNumber, reviewContent, reviewScore, reviewDate) " +
                    "VALUES (?, ?, ?, ?,sysdate())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,userNumber);
            pstmt.setInt(2,productNumber);
            pstmt.setString(3,content);
            pstmt.setInt(4,score);

            pstmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn,pstmt);
        }
    }

    public ArrayList reviewList(int productNumber){
        Connection conn=null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        ArrayList<DTO.review_dto> arr = new ArrayList<>();

        try{
            conn = getConn();
            String sql = "select name,reviewScore,reviewContent,reviewDate from user,review,product " +
                    "where product.productNumber = review.productNumber " +
                    "AND user.usernumber=review.usernumber " +
                    "AND product.productNumber=? " +
                    "ORDER BY reviewDate DESC";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,productNumber);
            rs = pstmt.executeQuery();

            while(rs.next()){
                DTO.review_dto obj = new review_dto();

                obj.setUserName(rs.getString("name"));
                obj.setScore(rs.getInt("reviewScore"));
                obj.setReviewContent(rs.getString("reviewContent"));
                obj.setReviewDate(rs.getString("reviewDate"));

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
