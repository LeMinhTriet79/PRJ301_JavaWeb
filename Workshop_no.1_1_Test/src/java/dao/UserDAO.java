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
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Minh Triet
 */
public class UserDAO implements IDAO<UserDTO, String>{

    @Override
    public boolean create(UserDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<UserDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public UserDTO readbyID(String id) {
        String sql = " SELECT * "
                + " FROM tblUsers "
                + " WHERE  username = ? ";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            //Truyền dữ liệu vào dấu chấm hỏi
            ps.setString(1, id);
            //Lấy nguyên dữ liệu từ hàng cột bảng
            //ResultSet giống như cái để chứa kết quả mới vừa lấy ra từ DB
            //nó giống như cái bảng bao gồm cột dòng
            ResultSet rs = ps.executeQuery();
            if(rs.next()){//nghĩa là còn kết quả
                //tạo đối tượng từ UserDTO để làm không đúc
                //chứa các dữ liệu từ các thuộc tính của ResultSet
                UserDTO user = new UserDTO(
                        rs.getString("username"), 
                        rs.getString("name"), 
                        rs.getString("password"), 
                        rs.getString("role"));
                // Sao khi gán giá trị xong(đúc khuôn, đổ bánh,...) thì trả về "Thành Phẩm"
                return user;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return null;
    }

    @Override
    public boolean update(UserDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<UserDTO> search(String searchTerm) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
