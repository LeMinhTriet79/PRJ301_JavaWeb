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
import pe.dto.ProductDTO;
import pe.utils.DBUtils;

/**
 *
 * @author Minh Triet
 */
public class ProductDAO {
   public List<ProductDTO> searchList (String searchTerm){
       String sql = " SELECT * FROM [dbo].[tblProduct] WHERE description like ? AND status > 0 ";
       List<ProductDTO> list = new ArrayList<>();
       try {
           Connection conn = DBUtils.getConnection();
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setString(1, "%"+ searchTerm+ "%");
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {               
               ProductDTO pro = new ProductDTO(
                       rs.getString("id"), 
                       rs.getString("name"), 
                       rs.getString("description"), 
                       rs.getFloat("price"), 
                       rs.getString("size"), 
                       rs.getInt("status"));
           list.add(pro);
           }
       } catch (Exception e) {
       }
       return list;
   }
   
   public boolean delete (String id){
       String sql = " UPDATE [dbo].[tblProduct]\n" +
"   SET status = 0 WHERE id = ?";
       try {
           Connection conn = DBUtils.getConnection();
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setString(1, id);
           int i = ps.executeUpdate();
           return i > 0;
       } catch (Exception e) {
       }
       return false;
   }
   
}
