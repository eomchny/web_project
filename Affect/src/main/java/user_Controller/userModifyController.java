package user_Controller;

import DAO.user_DAO;
import DTO.user_dto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class userModifyController implements controller{
    @Override
    public void excute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String mail = req.getParameter("mail");
        String newPassword = req.getParameter("newPassword");

        /*기입 유효성은 modify.jsp에서 관리
            1.아이디와 비밀번호로 맞는지 체크
            2.패스워드 7글자 이상으로 수정되어야 함.
        */

        DAO.user_DAO dao = new user_DAO();
        DTO.user_dto dto = new user_dto();

        dto.setId(id);
        dto.setPassword(password);
        dto = dao.loginCheck(dto);


        if(dto == null){
            PrintWriter writer = resp.getWriter();
            writer.println("<script>alert('Please check your account and password'); location.href='"+"userModify.jsp"+"';</script>");
            writer.close();
        }
        else{
            dto.setName(name);
            dto.setMail(mail);
            dto.setPassword(newPassword);
            //dto에 새롭게 바꿀 정보를 바인딩 했음. 유효성 검사는 위에서 했으므로 dto의 아이디와 일치하는 행을 찾아 정보 수정함

            dao.userInformationModify(dto);

            PrintWriter writer = resp.getWriter();
            writer.println("<script>alert('Modify success'); location.href='"+"userModify.jsp"+"';</script>");
            writer.close();
        }
    }
}
