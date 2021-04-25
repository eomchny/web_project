package product_Controller;

import DAO.product_DAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class productAddWishListController implements controller{
    @Override
    public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userNumber = req.getParameter("userNumber");
        String productNumber = req.getParameter("productNumber");
        String productCategory = req.getParameter("category");
        //유저넘버와 프로덕트 넘버를 기반으로 위시리스트 데이터베이스에 추가한다.

        DAO.product_DAO dao = new product_DAO();
        boolean result = dao.addWishList(userNumber,productNumber,productCategory);

        if(result==true){
            System.out.println("성공");

            //원래 페이지로 돌아간다.
            String redirectURL = "productViewPage.jsp?category="+productCategory+"&productNumber="+productNumber;
            PrintWriter writer = resp.getWriter();
            writer.println("<script>alert('Added your wishlist'); " +
                    "location.href='"+redirectURL+"';</script>");
            writer.close();

        }else{
            System.out.println("실패");

            //원래 페이지로 돌아간다.
            String redirectURL = "productViewPage.jsp?category="+productCategory+"&productNumber="+productNumber;
            PrintWriter writer = resp.getWriter();
            writer.println("<script>alert('It already exists'); " +
                    "location.href='"+redirectURL+"';</script>");
            writer.close();
        }
    }
}
