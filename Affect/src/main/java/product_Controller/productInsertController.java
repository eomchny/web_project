package product_Controller;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import DTO.product_dto;
import DAO.product_DAO;

public class productInsertController implements controller{
    @Override
    public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = "/Users/eomchny/IntelliJ_WorkSpace/Affect/src/main/webapp/thumbnails";
        int size = 1024 * 1024 * 10;    // 저장가능한 파일 크기
        String file = "";               // 업로드 한 파일의 이름(이름이 변경될수 있다)
        String originalFile = "";       // 이름이 변경되기 전 실제 파일 이름

        product_dto dto = new product_dto();
        product_DAO dao = new product_DAO();

        try{
            MultipartRequest multi = new MultipartRequest(req, path, size, "UTF-8", new DefaultFileRenamePolicy());

            Enumeration files = multi.getFileNames();

            String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장
            file = multi.getFilesystemName(str);            // 업로드 된 파일 이름
            originalFile = multi.getOriginalFileName(str);  // 원래의 파일이름

            dto.setProductName(multi.getParameter("productName"));
            dto.setProductPrice(Integer.parseInt(multi.getParameter("productPrice")));
            dto.setCategory(multi.getParameter("category"));
            dto.setProductThumbnail(file);
            //product 객체를 생성하고 정보를 바인딩한다.

            dao.productInsert(dto);

            resp.sendRedirect("productUploadPage.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
