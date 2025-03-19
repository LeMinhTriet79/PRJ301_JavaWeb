package dao;

import dto.CategoriesDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

public class CategoriesDAO implements IDAO<CategoriesDTO, String> {

    @Override
    public boolean create(CategoriesDTO entity) {
        String sql = "INSERT INTO [tblExamCategories] ([category_id], [category_name], [description])"
                + "VALUES (?, ?, ?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getCategory_id());
            ps.setString(2, entity.getCategory_name());
            ps.setString(3, entity.getDescription());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<CategoriesDTO> readAll() {
        String sql = "SELECT * FROM [tblExamCategories]";
        List<CategoriesDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoriesDTO cat = new CategoriesDTO();
                cat.setCategory_id(rs.getString("category_id"));
                cat.setCategory_name(rs.getString("category_name"));
                cat.setDescription(rs.getString("description"));
                list.add(cat);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }

    @Override
    public CategoriesDTO readbyID(String id) {
        String sql = "SELECT * FROM [tblExamCategories] WHERE category_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id); // Truyền dữ liệu
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                CategoriesDTO cat = new CategoriesDTO();
                cat.setCategory_id(rs.getString("category_id"));
                cat.setCategory_name(rs.getString("category_name"));
                cat.setDescription(rs.getString("description"));
                return cat;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    @Override
    public boolean update(CategoriesDTO entity) {
        String sql = "UPDATE [tblExamCategories] SET [category_name] = ?, [description] = ? WHERE [category_id] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, entity.getCategory_name());
            ps.setString(2, entity.getDescription());
            ps.setString(3, entity.getCategory_id());
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM [tblExamCategories] WHERE [category_id] = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            int n = ps.executeUpdate();
            return n > 0;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CategoriesDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public List<CategoriesDTO> search(String searchTerm) {
        String sql = "SELECT * FROM [tblExamCategories] WHERE category_name LIKE ?";
        List<CategoriesDTO> list = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchTerm + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoriesDTO cat = new CategoriesDTO();
                cat.setCategory_id(rs.getString("category_id"));
                cat.setCategory_name(rs.getString("category_name"));
                cat.setDescription(rs.getString("description"));
                list.add(cat);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
}
