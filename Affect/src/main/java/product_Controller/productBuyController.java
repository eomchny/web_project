package product_Controller;

import DAO.product_DAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class productBuyController implements controller{
    @Override
    public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String totalMoney = req.getParameter("totalMoney");
        String usedCp = req.getParameter("usedCp");
        String userNumber = req.getParameter("userNumber");
        String buyList = req.getParameter("totalBuyList");
        String[] buyArr = buyList.split(" ");

        DAO.product_DAO dao = new product_DAO();
        dao.buyProduct(userNumber,usedCp,buyArr);

        PrintWriter writer = resp.getWriter();
        writer.println("<script>alert('Success!'); " +
                "location.href='"+"mypage.jsp"+"';</script>");
        writer.close();
    }
}
