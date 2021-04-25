package DAO;

import DTO.coupon_dto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class coupon_DAO {
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

    public ArrayList<DTO.coupon_dto> getCouponList(int userNumber){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ArrayList<DTO.coupon_dto> arr = new ArrayList<>();

        try{
            conn = getConn();
            String sql = "select * from user,coupon,couponlist where user.userNumber=couponlist.userNumber AND coupon.cpNumber=couponlist.cpNumber AND couponlist.userNumber=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,userNumber);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                DTO.coupon_dto obj = new coupon_dto();


                obj.setCpNumber(rs.getInt("cpNumber"));
                obj.setCpPercent(rs.getFloat("cpPercent"));
                obj.setCpName(rs.getString("cpName"));

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
