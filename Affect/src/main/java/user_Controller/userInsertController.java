package user_Controller;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.user_DAO;
import DTO.user_dto;

public class userInsertController implements controller{

	@Override
	public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");

		String id,password,name,mail;
		id = req.getParameter("id");
		password = req.getParameter("password");
		name = req.getParameter("name");
		mail = req.getParameter("mail");
		
		user_dto user = new user_dto();
		user.setId(id);
		user.setPassword(password);
		user.setName(name);
		user.setMail(mail);
		
		user_DAO dao = new user_DAO();

		if(dao.duplicationCheck(user)) {
			PrintWriter writer = resp.getWriter(); 
			writer.println("<script>alert('Account already exists'); location.href='"+"index.jsp"+"';</script>"); 
			writer.close();
		}
		else {
			dao.userInsert(user);
			PrintWriter writer = resp.getWriter(); 
			writer.println("<script>alert('Wellcome Affect'); location.href='"+"index.jsp"+"';</script>"); 
			writer.close();
		}
	}

}
