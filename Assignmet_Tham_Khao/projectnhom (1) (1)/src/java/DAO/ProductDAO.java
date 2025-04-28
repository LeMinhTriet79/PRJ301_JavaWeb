    package DAO;

import DButils.utils;
import DTO.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    
    public List<ProductDTO> getAllProduct() {
        List<ProductDTO> list = new ArrayList<>();
        String query = "SELECT * FROM product";
        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                list.add(new ProductDTO(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getInt("cateID")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<ProductDTO> getProductByCID(int cid) {
        List<ProductDTO> list = new ArrayList<>();
        String query = "SELECT * FROM product WHERE cateID = ?";
        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setInt(1, cid);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ProductDTO(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("image"),
                            rs.getDouble("price"),
                            rs.getInt("cateID")
                    ));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<ProductDTO> searchByName(String keyword) {
    List<ProductDTO> list = new ArrayList<>();
    String sql = "SELECT * FROM Product WHERE ProductName LIKE ?";
    
    try (Connection conn = utils.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        
        ps.setString(1, "%" + keyword + "%");  // Thêm dấu % để tìm kiếm từ khóa

        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("ProductID");
                String name = rs.getString("ProductName");
                String image = rs.getString("Image");
                double price = rs.getDouble("Price");
                int categoryId = rs.getInt("CategoryID");

                list.add(new ProductDTO(id, name, image, price, categoryId));
            }
        }
    } catch (Exception e) {
    e.printStackTrace();
    System.out.println("SQL Error: " + e.getMessage());
}

    return list;
}

    
   public boolean addProduct(ProductDTO product) {
        String query = "INSERT INTO Product (ProductName, Price, CategoryID) VALUES (?, ?, ?)";
        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, product.getProductName());
            ps.setDouble(2, product.getPrice());
            ps.setInt(3, product.getCategoryID());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật sản phẩm
    public boolean updateProduct(ProductDTO product) {
        String query = "UPDATE Product SET ProductName=?, Price=?, CategoryID=? WHERE ProductID=?";
        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, product.getProductName());
            ps.setDouble(2, product.getPrice());
            ps.setInt(3, product.getCategoryID());
            ps.setInt(4, product.getProductID());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa sản phẩm
    public boolean deleteProduct(int productId) {
        String query = "DELETE FROM Product WHERE ProductID=?";
        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, productId);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public ProductDTO getProductById(int productId) throws Exception {
        ProductDTO product = null;
        String sql = "SELECT * FROM Product WHERE ProductID = ?";

        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new ProductDTO(
                        rs.getInt("ProductID"),
                        rs.getString("ProductName"),
                        rs.getString("Image"),
                        rs.getDouble("Price"),
                        rs.getInt("CategoryID")
                    );
                }
            }
        }
        return product;
    }
//    
}
