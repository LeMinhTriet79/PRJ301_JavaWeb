/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ultils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Minh Triet
 */
public class DBUltils {
   private static final String DB_NAME = "prj301_1814_06";
    private static final String DB_USERNAME = "sa";
    private static final String DB_PASSWORD = "12345";
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName="+DB_NAME;
        conn = DriverManager.getConnection(url, DB_USERNAME, DB_PASSWORD);
        return conn;
    }
    
    public static void main(String[] args) {
        try {
            Connection c =  getConnection();
            System.out.println(c);
            
//            String sql = "INSERT INTO products (product_id, product_name, price, category, stock_quantity)"
//                    + "  VALUES (12, N'Máy ảnh Sony A7 III', 45990000, N'Máy ảnh', 15)";
//            
//            Statement st = c.createStatement();
//            
//            int result = st.executeUpdate(sql);
//            
//            System.out.println(result);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBUltils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBUltils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
