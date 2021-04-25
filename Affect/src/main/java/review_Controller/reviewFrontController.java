package review_Controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class reviewFrontController extends HttpServlet {
    String charset = null;

    @Override
    public void init(ServletConfig config) throws ServletException {
        charset = config.getInitParameter("charset");
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("start service()");
        req.setCharacterEncoding(charset);

        String service = req.getRequestURI();
        System.out.println(service);
        controller controller = null;

        if(service.equals("/Affect_war_exploded/addReview.rev")) {
            controller = new reviewUploadContoller();
            controller.excute(req, resp);
            return;
        }
    }
}
