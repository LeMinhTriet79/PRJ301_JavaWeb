package pe.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import pe.account.AccountDAO;
import pe.account.AccountDTO;
import pe.appointment.AppointmentDAO;
import pe.appointment.AppointmentDTO;

/**
 * Do not change this code
 */
public class DBUtils {

    private static final String DB_NAME = "AppointmentManagement";
    private static final String PASSWORD = "12345";
    private static final String USER_NAME = "SA";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=" + DB_NAME;
        conn = DriverManager.getConnection(url, USER_NAME, PASSWORD);
        return conn;
    }
    public static void main(String[] args) {
        AccountDAO adao = new AccountDAO();
        AccountDTO acc = adao.readByAcc("admin");
        System.out.println(acc.getPass());
        System.out.println(acc);
        AppointmentDAO appdao = new AppointmentDAO();
        AppointmentDTO app = new AppointmentDTO("aaaaaa", "aaaaaa", "aaaaaa", "03-02-2009", "aaaaaa", 0, "aaaaaa");
        System.out.println(appdao.createApp(app));
       
    }
}
