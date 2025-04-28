package DAO;

import DTO.UserDTO;
import DButils.utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    
    public UserDTO login(String username, String password) {
        UserDTO user = null;
        String sql = "SELECT * FROM Users WHERE Username = ? AND PasswordHash = ?";
        try (Connection conn = utils.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                user = new UserDTO(
                    rs.getInt("UserID"),
                    rs.getString("FullName"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Username"),
                    rs.getString("PasswordHash"),
                    rs.getString("RoleName")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean register(UserDTO user) {
    String sql = "INSERT INTO Users (FullName, PhoneNumber, Username, PasswordHash, RoleName) VALUES (?, ?, ?, ?, ?)";
    try (Connection conn = utils.getConnection();
         PreparedStatement pst = conn.prepareStatement(sql)) {
         
        pst.setNString(1, user.getFullName());
        pst.setString(2, user.getPhoneNumber());
        pst.setString(3, user.getUsername());
        pst.setString(4, user.getPasswordHash()); // Không mã hóa mật khẩu
        
        // Nếu role là null, đặt mặc định là "Customer"
        String role = (user.getRoleName() == null || user.getRoleName().isEmpty()) ? "Customer" : user.getRoleName();
        pst.setString(5, role);

        return pst.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}


    
    public UserDTO getUserByID(int userID) {
        String sql = "SELECT * FROM Users WHERE UserID = ?";
        try (Connection conn = utils.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, userID);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return new UserDTO(
                    rs.getInt("UserID"),
                    rs.getString("FullName"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Username"),
                    rs.getString("PasswordHash"),
                    rs.getString("RoleName")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<UserDTO> getAllUsers() {
        List<UserDTO> users = new ArrayList<>();
        String sql = "SELECT * FROM Users";
        try (Connection conn = utils.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                users.add(new UserDTO(
                    rs.getInt("UserID"),
                    rs.getString("FullName"),
                    rs.getString("PhoneNumber"),
                    rs.getString("Username"),
                    rs.getString("PasswordHash"),
                    rs.getString("RoleName")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }
    
    public boolean updateUser(UserDTO user) {
        String sql = "UPDATE Users SET FullName = ?, PhoneNumber = ?, Username = ?, PasswordHash = ?, RoleName = ? WHERE UserID = ?";
        try (Connection conn = utils.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, user.getFullName());
            pst.setString(2, user.getPhoneNumber());
            pst.setString(3, user.getUsername());
            pst.setString(4, user.getPasswordHash());
            pst.setString(5, user.getRoleName());
            pst.setInt(6, user.getUserID());
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteUser(int userID) {
        String sql = "DELETE FROM Users WHERE UserID = ?";
        try (Connection conn = utils.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, userID);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
