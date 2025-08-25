package controller;

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

        switch(cmd) {
            case "register.member":{
                //회원가입
                break;
            }
            case "login.member":{
                //로그인
                break;
            }
            case "logout.member":{
                //로그아웃
                break;
            }
            case "update.member":{
                //업데이트
                break;
            }
            case "delete.member":{
                //회원탈퇴
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}