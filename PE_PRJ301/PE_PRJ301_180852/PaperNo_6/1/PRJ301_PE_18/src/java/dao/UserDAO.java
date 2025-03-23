/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sample.utils.DBUtils;

/**
 *
 * @author Minh Triet
 */
public class UserDAO {
    public UserDTO readByID (String userID){
        String sql = " SELECT * FROM tblUsers WHERE userID = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())  {
               UserDTO user = new UserDTO(
                       rs.getString("userID"), 
                        rs.getString("fullName"), 
                        rs.getString("password"));
               return user;
            }
        } catch (Exception e) {
        }
        return null;
    }
}
