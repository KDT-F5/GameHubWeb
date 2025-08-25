package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
    public static String encrypt(String text) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256"); // SHA-512은 암호화 글자수 더 작음
            byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
            byte[] digest = md.digest(bytes);

            StringBuilder builder = new StringBuilder();
            for (byte b : digest) {
                builder.append(String.format("%02x", b));
            }
            return builder.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 암호화 실패", e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cmd = request.getRequestURI();

        switch (cmd) {
            case "register.member": {
                //회원가입
                break;
            }
            case "login.member": {
                //로그인
                String id = request.getParameter("id");
                String pw = request.getParameter("pw");
                String lockPw = request.getParameter("lockPw");



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
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}