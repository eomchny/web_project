package product_Controller;

import DAO.product_DAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class productAddCartListController implements controller{
    @Override
    public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userNumber = req.getParameter("userNumber");
        String productNumber = req.getParameter("productNumber");
        String productCategory = req.getParameter("category");

        DAO.product_DAO dao = new product_DAO();
        boolean result = dao.addCartList(userNumber,productNumber);

        if(result==true){
            //원래 페이지로 돌아간다.
            String redirectURL = "productViewPage.jsp?category="+productCategory+"&productNumber="+productNumber;
            PrintWriter writer = resp.getWriter();
            writer.println("<script>alert('Added your Cartlist'); " +
                    "location.href='"+redirectURL+"';</script>");
            writer.close();

        }else{
            //원래 페이지로 돌아간다.
            String redirectURL = "productViewPage.jsp?category="+productCategory+"&productNumber="+productNumber;
            PrintWriter writer = resp.getWriter();
            writer.println("<script>alert('It already exists'); " +
                    "location.href='"+redirectURL+"';</script>");
            writer.close();
        }
    }
}
