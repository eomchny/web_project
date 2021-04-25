package lookbook_Controller;
import java.io.*;
import java.util.Enumeration;

import javax.servlet.*;
import javax.servlet.http.*;

import DAO.product_DAO;
import DTO.product_dto;
import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.lookbook_DAO;
import DTO.lookbook_dto;
import DTO.user_dto;

public class lookUploadContoller implements controller{

	@Override
	public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		HttpSession session = req.getSession();
		user_dto user  = (user_dto)session.getAttribute("user");
		
		lookbook_dto look = new lookbook_dto();
		look.setUserId(user.getId());
		look.setUserName(user.getName());
		//세션으로부터 유저 정보를 얻어와서 일단 아이디와 이름을 룩북 객체에 바인딩

		String path = "/Users/eomchny/IntelliJ_WorkSpace/Affect/src/main/webapp/lookbook";
		//룩북 사진 저장할 공
		int size = 1024 * 1024 * 10;    // 저장가능한 파일 크기
		String file = "";               // 업로드 한 파일의 이름(이름이 변경될수 있다)
		String originalFile = "";       // 이름이 변경되기 전 실제 파일 이름

		try{
			MultipartRequest multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();

			String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장
			file = multi.getFilesystemName(str);            // 업로드 된 파일 이름
			originalFile = multi.getOriginalFileName(str);  // 원래의 파일이름

			look.setHeadwear(multi.getParameter("headwear"));
			look.setEyewear(multi.getParameter("eyewear"));
			look.setPiercing(multi.getParameter("piercing"));
			look.setNecklace(multi.getParameter("necklace"));
			look.setOuter(multi.getParameter("outer"));
			look.setTop(multi.getParameter("top"));
			look.setBottom(multi.getParameter("bottom"));
			look.setShoes(multi.getParameter("shoes"));
			look.setAcc(multi.getParameter("acc"));
			look.setEtc(multi.getParameter("etc"));
			look.setFileName(file);
			//룩북 객체에 바인딩

			lookbook_DAO dao = new lookbook_DAO();
			dao.lookbookInsert(look);
			//룩북 dao에 저장

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
