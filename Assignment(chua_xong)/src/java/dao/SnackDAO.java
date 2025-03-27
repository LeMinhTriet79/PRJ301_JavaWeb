/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.SnackDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author frost
 */
public class SnackDAO implements IDAO<SnackDTO, String>{

    @Override
    public boolean create(SnackDTO entity) {
        String sql = "INSERT INTO [tblSnack] ([snackId], [picture], [name], [region], [unit], [price]) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getSnackId());
            ps.setString(2, entity.getPictute());
            ps.setString(3, entity.getName());
            ps.setString(4, entity.getRegion());
            ps.setString(5, entity.getUnit());
            ps.setInt(6, entity.getPrice());
            int n = ps.executeUpdate();
            return n > 0;
        }catch (ClassNotFoundException | SQLException ex){
            Logger.getLogger(SnackDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public List<SnackDTO> readAll() {
        String sql = "SELECT * FROM [tblSnack]";
        List<SnackDTO> snackList = new ArrayList<>();
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                SnackDTO snack = new SnackDTO(rs.getString("snackId"),
                                              rs.getString("picture"),
                                              rs.getString("name"),
                                              rs.getString("region"),
                                              rs.getString("unit"),
                                              rs.getInt("price"));
                snackList.add(snack);
            }
        }catch (ClassNotFoundException | SQLException ex){
            Logger.getLogger(SnackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return snackList;
    }

    @Override
    public SnackDTO readbyUsername(String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(SnackDTO entity) {
        String sql = "UPDATE tblSnack SET "
                  + " picture=?, name=?, region=?, unit=?, price=? "
                  + " WHERE snackId=?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getPictute());
            ps.setString(2, entity.getName());
            ps.setString(3, entity.getRegion());
            ps.setString(4, entity.getUnit());
            ps.setInt(5, entity.getPrice());
            ps.setString(6, entity.getSnackId());
            int n = ps.executeUpdate();
            return n > 0;
        }catch (ClassNotFoundException | SQLException ex){
            Logger.getLogger(SnackDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public boolean delete(String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<SnackDTO> search(String searchTerm) {
        String sql = "SELECT * FROM [tblSnack] WHERE [name] LIKE ?";
        List<SnackDTO> foundList = new ArrayList<>();
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                SnackDTO snack = new SnackDTO(rs.getString("snackId"),
                                              rs.getString("picture"),
                                              rs.getString("name"),
                                              rs.getString("region"),
                                              rs.getString("unit"),
                                              rs.getInt("price"));
                foundList.add(snack);
            }
        }catch (ClassNotFoundException | SQLException ex){
            Logger.getLogger(SnackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return foundList;
    }
    
    public boolean deleteBySnackId(String deletedSnackId){
        String sql = "DELETE FROM tblSnack "
                   + " WHERE snackId=?";
        try{
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, deletedSnackId);
            int n = ps.executeUpdate();
            return n > 0;
        }catch (ClassNotFoundException | SQLException ex){
            Logger.getLogger(SnackDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
}
