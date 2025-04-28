/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DButils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Administrator
 */
public class utils {
//      Do not change this code
    private static final String DB_NAME = "ASMPRJ";
    private static final String DB_USER_NAME = "SA";
    private static final String DB_PASSWORD = "12345";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME + ";encrypt=true;trustServerCertificate=true;characterEncoding=UTF-8;useUnicode=true";
        conn = DriverManager.getConnection(url, DB_USER_NAME, DB_PASSWORD);
        
        return conn;
    }
    public static void main(String[] args) {
        try {
            Connection conn = getConnection();
            if (conn != null) {
                System.out.println("Kết nối thành công đến cơ sở dữ liệu!");
                conn.close(); // Đóng kết nối sau khi kiểm tra
            } else {
                System.out.println("Kết nối thất bại!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Lỗi khi kết nối: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
