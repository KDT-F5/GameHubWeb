package dao;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class MemberDAO {

    private static MemberDAO instance;

    public synchronized static MemberDAO getinstance() {
        if (instance == null) {
            try {
                instance = new MemberDAO();
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
        return instance;
    }

    public Connection getconnection() throws Exception {

        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();

    }


    public int delete_assign(String id) throws Exception {

        String sql = "delete from member where id = ? ";
        try (Connection con = this.getconnection()) {
            try (PreparedStatement pstat = con.prepareStatement(sql)) {
                pstat.setString(1, id);
                return pstat.executeUpdate();
            }
        }

    }

    ;


}
