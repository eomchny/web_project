package product_Controller;

import java.io.*;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;

public class productFrontController extends HttpServlet{
	String charset = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		charset = config.getInitParameter("charset");
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding(charset);
		
		String service = req.getRequestURI();
		System.out.println(service);
		controller controller = null;
		
		if(service.equals("/Affect_war_exploded/productInsert.product")) {
			controller = new productInsertController();
			controller.excute(req, resp);
			return;
		}
		else if(service.equals("/Affect_war_exploded/addWish.product")){
			controller = new productAddWishListController();
			controller.excute(req,resp);
			return;
		}
		else if(service.equals("/Affect_war_exploded/addCart.product")){
			controller = new productAddCartListController();
			controller.excute(req,resp);
			return;
		}
		else if(service.equals("/Affect_war_exploded/deleteWishlist.product")){
			controller = new deleteWishListController();
			controller.excute(req,resp);
			return;
		}
		else if(service.equals("/Affect_war_exploded/deleteCartlist.product")){
			controller = new deleteCartListController();
			controller.excute(req,resp);
			return;
		}
		else if(service.equals("/Affect_war_exploded/buyProduct.product")){
			controller = new productBuyController();
			controller.excute(req,resp);
			return;
		}
	}
}
