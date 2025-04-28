/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import DButils.utils;
/**
 *
 * @author Administrator
 */
public class CategoryDAO {
    public List<CategoryDTO> getAllCategories() throws ClassNotFoundException {
        List<CategoryDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM Categories";
        try (Connection conn = utils.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new CategoryDTO(
                    rs.getInt("CategoryID"),
                    rs.getString("CategoryName")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public CategoryDTO getCategoryById(int id) throws ClassNotFoundException {
        String sql = "SELECT * FROM Categories WHERE CategoryID = ?";
        try (Connection conn = utils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new CategoryDTO(
                    rs.getInt("CategoryID"),
                    rs.getString("CategoryName")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean insertCategory(CategoryDTO category) throws ClassNotFoundException {
        String sql = "INSERT INTO Categories (CategoryName) VALUES (?)";
        try (Connection conn = utils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, category.getCategoryName());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateCategory(CategoryDTO category) throws ClassNotFoundException {
        String sql = "UPDATE Categories SET CategoryName = ? WHERE CategoryID = ?";
        try (Connection conn = utils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, category.getCategoryName());
            stmt.setInt(2, category.getCategoryId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteCategory(int id) throws ClassNotFoundException {
        String sql = "DELETE FROM Categories WHERE CategoryID = ?";
        try (Connection conn = utils.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
