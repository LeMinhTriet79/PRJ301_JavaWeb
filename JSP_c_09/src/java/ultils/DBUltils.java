/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ultils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/*
Khánh KT với TITV cũng có khác gì nhau
mỗi người mỗi vẻ...10 phân vẹn 10
......Idol đúng gắt.....
TITV:
System.out.println("Mày tưởng tao hiền hả mậy?");
System.out.println("Chết mày chưa, cho mày vừa!");
 */
/**
 *       
 * @author Minh Triet
 */
public class DBUltils implements Serializable{
    private static final String DB_NAME = "prj301_se1814_slot8";
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
                      
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBUltils.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBUltils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}