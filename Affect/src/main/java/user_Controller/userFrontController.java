package user_Controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class userFrontController extends HttpServlet{
	String charset = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("Start the init()");
		charset = config.getInitParameter("charset");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Start the Service()");
		req.setCharacterEncoding(charset);
		
		String service = req.getRequestURI();
		controller controller = null;

		System.out.println(service);


		if(service.equals("/Affect_war_exploded/join.user")) {
			controller = new userInsertController();
			controller.excute(req, resp);
			return;
		}
		else if(service.equals("/Affect_war_exploded/forgotPassword.user")) {
			controller = new forgotPasswordController();
			controller.excute(req, resp);
			return;
		}
		else if(service.equals("/Affect_war_exploded/login.user")) {
			controller = new userLoginController();
			controller.excute(req, resp);
			return;
		}

		else if(service.equals("/Affect_war_exploded/modify.user")) {
			controller = new userModifyController();
			controller.excute(req, resp);
			return;
		}
	}
}
