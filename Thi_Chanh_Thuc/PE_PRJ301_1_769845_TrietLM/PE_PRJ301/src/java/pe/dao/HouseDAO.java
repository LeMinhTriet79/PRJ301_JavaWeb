/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pe.dto.HouseDTO;
import pe.utils.DBUtils;

/**
 *
 * @author Minh Triet
 */
public class HouseDAO {
    public List<HouseDTO> readBySearchTerm(String searchTerm){
        String sql = "SELECT * FROM tblHouse WHERE name like ? AND status > 0";
        List<HouseDTO> listHouse = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                HouseDTO house = new HouseDTO(
                        rs.getString("id"), 
                         rs.getString("name"), 
                         rs.getString("description"), 
                        rs.getFloat("price"), 
                        rs.getFloat("size"), 
                        rs.getInt("status"));
                listHouse.add(house);
                
            }    
        } catch (Exception e) {
        }
        return listHouse;
    }
    
    public boolean delete(String id){
        String sql = "UPDATE [dbo].[tblHouse]\n" +
"   SET [status] = 0\n" +
" WHERE id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (Exception e) {
        }
        return false;
    }
}
