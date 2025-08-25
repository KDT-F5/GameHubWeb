
package dao;

import dto.MemberDTO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
//싱글턴으로dao 인스턴스 만들기
    private static MemberDAO instance;
    public static synchronized MemberDAO getInstance() {
        if (instance == null) {
            instance = new MemberDAO();
        }
        return instance;
    }



//JNDI
    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext(); // context.xml의인스턴스를 만드는 것, not dbcp의 인스턴스를 만드는것
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle"); // 다운캐스팅 필수
        return ds.getConnection(); // 톰캣이만들어놓은 인스턴스로 겟 커넥션
    }



// dao.isDupli()아이디 중복검사
    public boolean isDupli(String targetId) throws Exception {
        String sql = "select * from members where id like ?";
        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, targetId);
            try (ResultSet rs = pstat.executeQuery();) {
                return rs.next();
            }
        }
    }



// data 받은것 db에 넣기

    public int insertAll(MemberDTO dto) throws Exception {

        String sql = "insert into members values(?,?,?,?,?,?,?,?,sysdate)";

        try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
            pstat.setString(1, dto.getId());
            pstat.setString(2, dto.getPw());
            pstat.setString(3, dto.getName());
            pstat.setString(4, dto.getPhone());
            pstat.setString(5, dto.getEmail());
            pstat.setString(6, dto.getZipcode());
            pstat.setString(7, dto.getAddress1());
            pstat.setString(8, dto.getAddress2());
            return pstat.executeUpdate();
        }
    }
    public int delete_assign(String id) throws Exception {

        String sql = "delete from members where id = ? ";
        try (Connection con = this.getConnection()) {
            try (PreparedStatement pstat = con.prepareStatement(sql)) {
                pstat.setString(1, id);
                return pstat.executeUpdate();
            }
        }

    }
    }