/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.RoomDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author Minh Triet
 */
public class RoomDAO {
    public List<RoomDTO> searchByName(String searchTerm){
        String sql = "SELECT * FROM tblRooms WHERE name Like ? ";
        List<RoomDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,"%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                RoomDTO room = new RoomDTO(
                        rs.getString("id"), 
                        rs.getString("name"), 
                        rs.getString("description"), 
                        rs.getFloat("price"), 
                        rs.getFloat("area"), 
                        rs.getInt("status"));
                list.add(room);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
