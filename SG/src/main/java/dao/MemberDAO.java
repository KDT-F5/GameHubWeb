
package dao;

import dto.MemberDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.sql.ResultSet;  // ResultSet도 import 되어 있어야 합니다.

public class MemberDAO {

    private static MemberDAO instance;

    public static synchronized MemberDAO getInstance() {
        if (instance == null) {
            instance = new MemberDAO();
        }
        return instance;
    }

    public static Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/study");
        Connection conn = ds.getConnection();
        return conn;
    }

    //디비 정보 가져옴
    public int insertMember(MemberDTO memberInfo) throws Exception {
        String sql = "insert into members(id, pw, name, phone, email, zipcode, address1, address2, join_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memberInfo.getId());
            pstmt.setString(2, memberInfo.getPw());
            pstmt.setString(3, memberInfo.getName());
            pstmt.setString(4, memberInfo.getPhone());
            pstmt.setString(5, memberInfo.getEmail());
            pstmt.setString(6, memberInfo.getZipcode());
            pstmt.setString(7, memberInfo.getAddress1());
            pstmt.setString(8, memberInfo.getAddress2());
            pstmt.setTimestamp(9, new Timestamp(System.currentTimeMillis())); // 현재 시간

            int result = pstmt.executeUpdate();

            // DB 삽입 결과 확인
            if (result > 0) {
                System.out.println("회원가입 성공!");
            } else {
                System.out.println("회원가입 실패!");
            }
            return result;
        }

    }

    //모든 정보 저장
    public List<MemberDTO> allbateMember() throws Exception {
        String sql = "select * from members";
        List<MemberDTO> list = new ArrayList<>();

        try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    String id = rs.getString("id");
                    String pw = rs.getString("pw");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String zipcode = rs.getString("zipcode");
                    String address1 = rs.getString("address1");
                    String address2 = rs.getString("address2");
                    Timestamp ts = rs.getTimestamp("join_date");
                    LocalDateTime joinDate = ts.toLocalDateTime();

                    MemberDTO dto = new MemberDTO(id, pw, name, phone, email, zipcode, address1, address2, joinDate);
                    list.add(dto);
                }
            }
        }
        return list;
    }

    // 업데이트
    public int Update(String id, String phone, String email, String zipcode, String address1, String address2) throws Exception {
        String sql = "update members set phone = ?, email = ?, zipcode = ?, address1 = ?, address2 = ? where id = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, phone);
            pstmt.setString(2, email);
            pstmt.setString(3, zipcode);
            pstmt.setString(4, address1);
            pstmt.setString(5, address2);
            pstmt.setString(6, id);

            return pstmt.executeUpdate();

        }
    }

    // dao.isDupli()아이디 중복검사
    public boolean isDupli(String targetId) throws Exception {
        String sql = "select * from members where id like ?";
        try (Connection con = getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, targetId);
            try (ResultSet rs = pstat.executeQuery()) {
                return rs.next();
            }
        }
    }

    public int deleteAssign(String id) throws Exception {
        String sql = "delete from members where id = ? ";
        try (Connection con = getConnection()) {
            try (PreparedStatement pstat = con.prepareStatement(sql)) {
                pstat.setString(1, id);
                return pstat.executeUpdate();
            }
        }

    }
        public boolean login (String id, String lockPw) throws Exception {
            String sql = "select * from members where id=? and pw=?";
            try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);
            ) {
                pstat.setString(1, id);
                pstat.setString(2, lockPw);
                try (ResultSet rs = pstat.executeQuery();) {
                    return rs.next();
                }
            }
        }

    }
