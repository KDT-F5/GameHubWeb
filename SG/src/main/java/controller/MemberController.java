package controller;

import dao.MemberDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cmd = request.getRequestURI();
        MemberDAO dao = MemberDAO.getInstance();

        try {
            switch (cmd) {
                case "register.member": {
                    //회원가입
                    break;
                }
                case "login.member": {
                    //로그인
                    break;
                }
                case "logout.member": {
                    //로그아웃
                    request.getSession().setAttribute("loginId", null);
                    response.sendRedirect("/");
                    break;
                }
                case "update.member": {
                    //업데이트
                    break;
                }
                case "delete.member": {
                    //회원탈퇴
                    String id = request.getParameter("del_id");
                    int del_id = dao.delete_assign(id);

                    response.sendRedirect("/webapp/error.jsp");
                    break;
                }
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