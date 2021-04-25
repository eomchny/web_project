package user_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.user_DAO;
import DTO.user_dto;

public class userLoginController implements controller {

	@Override
	public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");


		String returnURL = req.getParameter("loginStatus");
		if(returnURL == null) returnURL = "main.jsp";
		else if(returnURL.equals("lookbookPageLogin")) returnURL = "lookbookPage.jsp";


		String id = req.getParameter("id");
		String password = req.getParameter("password");
		//파라미터로 부터 id와 pw를 받는다.
		
		user_DAO dao = new user_DAO();
		user_dto user = new user_dto();
		user.setId(id);
		user.setPassword(password);
		/*
		1. user의 DTO와 DAO를 생성한다.
		2. userDTO에는 아이디와 비밀번호를 바인딩한다.
		 */
		
		user = dao.loginCheck(user);
		/*
		일치하는 정보가 있다면 회원정보가 바인딩된 userDTO가 리턴되고
		일치하는 정보가 없으면 널값이 리턴된다.
		 */
		
		if(user == null) {
			PrintWriter writer = resp.getWriter(); 
			writer.println("<script>alert('Please check your account and password'); location.href='"+"main.jsp"+"';</script>");
			writer.close();
		}
		else {
			System.out.println(user.getName() + " 로그인");
			HttpSession session = req.getSession(true);
			session.setAttribute("user", user);
			resp.sendRedirect(returnURL);
			/*
			세션을 생성하고 세션에 유저정보를 담은 뒤, returnURL로 새로고침한다.
			 */
		}
		
	}

}
