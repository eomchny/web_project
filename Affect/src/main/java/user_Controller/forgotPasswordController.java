package user_Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.user_DAO;
import DTO.user_dto;

public class forgotPasswordController implements controller {
	
	@Override
	public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String id = req.getParameter("id");
		String mail = req.getParameter("mail");
		
		user_dto user = new user_dto();
		user.setId(id);
		user.setMail(mail);
		
		user_DAO dao = new user_DAO();
		String password = dao.searchPassword(user);
		
		if(password == null) {
			PrintWriter writer = resp.getWriter(); 
			writer.println("<script>alert('No matching information'); location.href='"+"index.jsp"+"';</script>"); 
			writer.close();
		}else {
			String result = password.substring(0, password.length()-5)+"*****";
			PrintWriter writer = resp.getWriter(); 
			writer.println("<script>alert('Your password is "+ result +"'); location.href='"+"index.jsp"+"';</script>"); 
			writer.close();
		}
		//보안성을 위해 뒷 5자리를 *로 표시하여 리턴한다.
		
	}

}
