package review_Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface controller {
	public void excute(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException;
}