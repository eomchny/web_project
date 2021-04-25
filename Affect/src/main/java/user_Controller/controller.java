package user_Controller;

import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;

public interface controller{
	public void excute(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException;
}