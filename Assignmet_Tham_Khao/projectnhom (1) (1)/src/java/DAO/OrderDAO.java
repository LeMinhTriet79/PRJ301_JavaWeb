package DAO;

import DButils.utils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class OrderDAO {

    // 1️⃣ Tạo đơn hàng mới, trả về OrderID
    public int createOrder(int userID, double totalPrice) throws Exception {
        String sql = "INSERT INTO Orders (UserID, OrderDate, FinalAmount, ShippingStatus) VALUES (?, GETDATE(), ?, 'Pending')";
        int orderID = -1;

        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, userID);
            ps.setDouble(2, totalPrice);
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    orderID = rs.getInt(1);
                }
            }
        }
        return orderID;
    }

    // 2️⃣ Thêm sản phẩm vào OrderDetail, trả về OrderDetailID
    public int addOrderDetail(int orderID, int productID, double price) throws Exception {
        String sql = "INSERT INTO OrderDetail (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
        int orderDetailID = -1;

        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, orderID);
            ps.setInt(2, productID);
            ps.setInt(3, 1); // Mặc định số lượng = 1
            ps.setDouble(4, price);
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    orderDetailID = rs.getInt(1);
                }
            }
        }
        return orderDetailID;
    }

    // 3️⃣ Thêm topping vào OrderTopping
    public void addOrderTopping(int orderDetailID, int toppingID, int quantity) throws Exception {
        String sql = "INSERT INTO OrderTopping (OrderDetailID, ToppingID, Quantity) VALUES (?, ?, ?)";

        try (Connection conn = utils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, orderDetailID);
            ps.setInt(2, toppingID);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        }
    }
}
