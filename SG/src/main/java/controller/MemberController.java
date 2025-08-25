package controller;

import dao.MemberDAO;
import dto.MemberDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.io.PrintWriter;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cmd = request.getRequestURI();
        MemberDTO dto = new MemberDTO();
        MemberDAO dao = MemberDAO.getInstance();

        try {
            switch (cmd) {
                case "register.member": {
                    //회원가입
                    String id = request.getParameter("id");
                    String pw = SecurityUtil.encrypt(request.getParameter("pw"));
                    String name = request.getParameter("name");
                    String phonenum = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String zoneCode = request.getParameter("zipcode");
                    String address1 = request.getParameter("address1");
                    String address2 = request.getParameter("address2");

                    MemberDTO temp = new MemberDTO(id, pw, name, phonenum, email, zoneCode, address1, address2, null);
                    dao.insertAll(temp);


                    response.sendRedirect("/index.jsp");
                    break;
                }
                case "login.member": {
                    //로그인
                    String id = request.getParameter("id");
                    String pw = request.getParameter("pw");
                    String lockPw = request.getParameter("lockPw");
                    boolean result;


                break;
            }
            case "logout.member":{
                //로그아웃
                request.getSession().setAttribute("loginId", null);
                response.sendRedirect("/");
                break;
            }
            case "update.member":{
                String id = request.getParameter("id");
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String zipcode = request.getParameter("zipcode");
                String address1 = request.getParameter("address1");
                String address2 = request.getParameter("address2");

                try {
                    List<MemberDTO> list = dao.allbateMember(); // ✅ 예외 처리 필요
                    dao.Update(id, phone, email, zipcode, address1, address2);
                    response.sendRedirect("/index.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "회원 업데이트 중 오류 발생");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }

                break;
            }
            case "delete.member":{
                //회원탈퇴
                String id = request.getParameter("id");
                int del_id = dao.delete_assign(id);

                response.sendRedirect("/error.jsp");
                break;
            }
            case "/idcheck.member":{
                // 아이디 중복 체크 확인
                String id = request.getParameter("id");

                //ajax로 받기
                String result = String.valueOf(dao.isDupli(id));
                PrintWriter pw = response.getWriter();
                pw.append(result); // 스트링값 true,false 보내줌
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}