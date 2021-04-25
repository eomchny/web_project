package product_Controller;

import DAO.product_DAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class deleteWishListController implements controller{
    @Override
    public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DAO.product_DAO dao = new product_DAO();

        String userNumber = req.getParameter("userNumber");
        String productNumber = req.getParameter("productNumber");

        boolean result = dao.deleteWishList(userNumber, productNumber);

        PrintWriter writer = resp.getWriter();
        if(result == true){
            String redirectURL = "mypage.jsp?menuQuery=wishlist";
            writer.println("<script>alert('removed from wishlist'); " +
                    "location.href='"+redirectURL+"';</script>");
            writer.close();
        } else {
            String redirectURL = "mypage.jsp?menuQuery=wishlist";
            writer.println("<script>alert('Error!!!'); " +
                    "location.href='"+redirectURL+"';</script>");
            writer.close();
        }

    }
}
