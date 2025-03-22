package pe.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import pe.utils.DBUtils;

public class AccountDAO {
    //your code here
    public AccountDTO readByAcc(String Acc){
        String sql = " SELECT * "
                + "FROM Account "
                + "WHERE account = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Acc);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                AccountDTO acc = new AccountDTO(
                        rs.getString("account"), 
                         rs.getString("pass"), 
                         rs.getString("roleDB"), 
                         rs.getString("fullName"), 
                         rs.getInt("gender"), 
                         rs.getString("birthDay"), 
                         rs.getString("phone"), 
                         rs.getString("addr"));
                return acc;
            }
        } catch (Exception e) {
        }
        return null;
    }

}
