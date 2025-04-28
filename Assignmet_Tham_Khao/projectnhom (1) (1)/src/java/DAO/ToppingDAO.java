package DAO;

import DButils.utils;
import DTO.ToppingDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ToppingDAO {

    // Lấy topping theo ID
    public ToppingDTO getToppingById(int toppingId) throws Exception {
        ToppingDTO topping = null;
        String sql = "SELECT ToppingID, ToppingName, Price FROM Topping WHERE ToppingID = ?";

        try (Connection conn = utils.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, toppingId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    topping = new ToppingDTO(
                            rs.getInt("ToppingID"),
                            rs.getString("ToppingName"),
                            rs.getDouble("Price")
                    );
                }
            }
        }
        return topping;
    }

//    public List<ToppingDTO> getAllToppings() throws Exception {
//        List<ToppingDTO> toppings = new ArrayList<>();
//        String sql = "SELECT ToppingID, ToppingName, Price FROM Topping";
//
//        try (Connection conn = utils.getConnection();
//                PreparedStatement pstmt = conn.prepareStatement(sql);
//                ResultSet rs = pstmt.executeQuery()) {
//
//            while (rs.next()) {
//                toppings.add(new ToppingDTO(
//                        rs.getInt("ToppingID"),
//                        rs.getString("ToppingName"),
//                        rs.getDouble("Price")
//                ));
//            }
//        }
//        return toppings;
//    }
    public List<ToppingDTO> getAllToppings() throws Exception {
    List<ToppingDTO> toppings = new ArrayList<>();
    String sql = "SELECT ToppingID, ToppingName, Price FROM Topping";
    try (Connection conn = utils.getConnection();
         PreparedStatement pstmt = conn.prepareStatement(sql);
         ResultSet rs = pstmt.executeQuery()) {

        while (rs.next()) {
            ToppingDTO topping = new ToppingDTO(
                    rs.getInt("ToppingID"),
                    rs.getString("ToppingName"),
                    rs.getDouble("Price")
            );
            toppings.add(topping);
            System.out.println("🔍 Tìm thấy topping: " + topping.getToppingName());
        }
    }
    System.out.println("✅ Tổng số topping lấy được: " + toppings.size());
    return toppings;
}


    public void addTopping(String toppingName, double price) throws ClassNotFoundException {
        if (toppingName == null || toppingName.trim().isEmpty() || price < 0) {
            System.out.println("Invalid input: Topping name is empty or price is negative.");
            return;
        }

        String sql = "INSERT INTO Topping (ToppingName, Price) VALUES (?, ?)";

        try (Connection conn = utils.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, toppingName.trim());
            pstmt.setDouble(2, price);

            int rowsAffected = pstmt.executeUpdate();
            System.out.println("Topping added successfully. Rows affected: " + rowsAffected);

        } catch (SQLException e) {
            System.out.println("Error adding topping: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void updateTopping(int toppingID, String toppingName, double price) throws Exception {
        String sql = "UPDATE Topping SET ToppingName = ?, Price = ? WHERE ToppingID = ?";

        try (Connection conn = utils.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, toppingName);
            pstmt.setDouble(2, price);
            pstmt.setInt(3, toppingID);
            pstmt.executeUpdate();
        }
    }

    public void deleteTopping(int id) throws ClassNotFoundException {
    String sql = "DELETE FROM Topping WHERE toppingID = ?";
    try (Connection conn = utils.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, id);
        int rowsAffected = stmt.executeUpdate();
        System.out.println("Rows affected: " + rowsAffected);
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

   

}
