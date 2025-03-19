/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProjectDTO;
import dto.UserDTO;
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
 * @author Minh Triet
 */
public class ProjectDAO implements IDAO<ProjectDTO, String>{

    @Override
    public boolean create(ProjectDTO entity) {
        String sql = "INSERT INTO [tblStartupProjects] ([project_id], [project_name], [Description] , [Status], [estimated_launch])"
                + "VALUES ( ?, ?, ?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, entity.getProject_id());
            ps.setString(2, entity.getProject_name());
            ps.setString(3, entity.getDescription());
            ps.setString(4, entity.getStatus());
            ps.setString(5, entity.getEstimated_launch());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        }

    @Override
    public List<ProjectDTO> readAll() {
        String sql = "SELECT * FROM [tblStartupProjects]";
        List<ProjectDTO> list = new ArrayList<>();
        try {
            
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {                
                ProjectDTO pro = new ProjectDTO(
                        rs.getInt("project_id"), 
                        rs.getString("project_name"), 
                        rs.getString("Description"), 
                        rs.getString("Status"), 
                        rs.getString("estimated_launch"));
                list.add(pro);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list; 
        
     }

    @Override
    public ProjectDTO readbyID(String id) {
        String sql = "SELECT * FROM [tblStartupProjects]"
                + " WHERE project_id = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id); //truyền dữ liệu
            //lấy dữ liệu từ cái bảng 
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                ProjectDTO pro = new ProjectDTO(
                        rs.getInt("id"), 
                        rs.getString("project_name"), 
                        rs.getString("Description"), 
                        rs.getString("Status"), 
                        rs.getString("estimated_launch"));
                return pro;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }
    
     public List<ProjectDTO> readbyProject_ID(int id) {
        String sql = "SELECT * "
                + "FROM [tblStartupProjects]"
                + " WHERE project_id = ? ";
           List<ProjectDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id); //truyền dữ liệu
            //lấy dữ liệu từ cái bảng 
            ResultSet rs = ps.executeQuery();
         
            while(rs.next()){
                ProjectDTO pro = new ProjectDTO(
                        rs.getInt("project_id") , 
                        rs.getString("project_name") , 
                        rs.getString("Description") , 
                        rs.getString("Status") , 
                        rs.getString("estimated_launch") );
                list.add(pro);
               
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }

     public ProjectDTO readbyIntProject_ID(int id) {
        String sql = "SELECT * "
                + "FROM [tblStartupProjects]"
                + " WHERE project_id = ? ";
           
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id); //truyền dữ liệu
            //lấy dữ liệu từ cái bảng 
            ResultSet rs = ps.executeQuery();
         
            while(rs.next()){
                ProjectDTO pro = new ProjectDTO(
                        rs.getInt("project_id") , 
                        rs.getString("project_name") , 
                        rs.getString("Description") , 
                        rs.getString("Status") , 
                        rs.getString("estimated_launch") );
               return pro;
               
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }
     
     
    @Override
    public boolean update(ProjectDTO entity) {
        String sql = "UPDATE [tblStartupProjects] SET "
            + "[project_name] = ?, "
            + "[Description] = ?, "
            + "[Status] = ?, "
            + "[estimated_launch] = ? "
            + "WHERE [project_id] = ?";
        
        try {
             Connection conn = DBUtils.getConnection();
              PreparedStatement ps = conn.prepareStatement(sql);
              ps.setString(1, entity.getProject_name());
              ps.setString(2, entity.getDescription());
              ps.setString(3, entity.getStatus());
              ps.setString(4, entity.getEstimated_launch());
              ps.setInt(5, entity.getProject_id());
              
              int n = ps.executeUpdate();
              return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(ProjectDAO.class.getName()).log(Level.SEVERE, null, ex);
               return false;
        }
     
        
         
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<ProjectDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public List<ProjectDTO> searchbyName(String searchTerm) {
        String sql = "Select * "
                + " From tblStartupProjects "
                + " Where project_name LIKE ? ";
        //
        List<ProjectDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            //Lấy dữ liệu từ bảng
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ProjectDTO pro = new ProjectDTO(
                        rs.getInt("project_id"), 
                        rs.getString("project_name"), 
                        rs.getString("Description"), 
                        rs.getString("Status"), 
                        rs.getString("estimated_launch"));
                list.add(pro);
            }
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
    
    
}
