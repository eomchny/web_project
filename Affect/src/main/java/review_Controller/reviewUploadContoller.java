package review_Controller;

import DAO.review_DAO;
import DTO.review_dto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class reviewUploadContoller implements controller{
    @Override
    public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userNumber = req.getParameter("userNumber_review");
        String productNumber = req.getParameter("productNumber_review");
        String content = req.getParameter("opinion");
        String category = req.getParameter("category");
        int score = Integer.parseInt(req.getParameter("score"));

        DTO.review_dto obj = new review_dto();
        obj.setReviewContent(content);
        obj.setProductNumber(Integer.parseInt(productNumber));
        obj.setUserNumber(Integer.parseInt(userNumber));
        obj.setScore(score);

        DAO.review_DAO dao = new review_DAO();
        dao.addReview(obj);

        resp.sendRedirect("productViewPage.jsp?category="+category+"&productNumber="+productNumber);
    }
}
