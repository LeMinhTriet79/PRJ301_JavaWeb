package pe.appointment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import pe.utils.DBUtils;

public class AppointmentDAO {
    
    // Thêm cuộc hẹn mới vào cơ sở dữ liệu
    public boolean createApp(AppointmentDTO app) {
        String sql = "INSERT INTO [dbo].[Appointments] " +
                     "([account], [partnerPhone], [partnerName], [timeToMeet], [place], [expense], [note]) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
            ps.setString(1, app.getAccount());
            ps.setString(2, app.getPartnerPhone());
            ps.setString(3, app.getPartnerName());
            ps.setString(4, app.getTimeToMeet());
            ps.setString(5, app.getPlace());
            ps.setInt(6, app.getExpense());
            ps.setString(7, app.getNote());

            int n = ps.executeUpdate();
            
            if (n > 0) {
                // Lấy idApp tự động sinh ra
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    app.setIdApp(rs.getInt(1));  // Gán giá trị idApp vào đối tượng AppointmentDTO
                }
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Tìm kiếm cuộc hẹn theo idApp
    public List<AppointmentDTO> search(String idApp){
        String sql = "SELECT [idApp], [account], [partnerPhone], [partnerName], [timeToMeet], [place], [expense], [note] " +
                     "FROM [dbo].[Appointments] WHERE idApp = ?";
        List<AppointmentDTO> list = new ArrayList<>();
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, idApp);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                AppointmentDTO app = new AppointmentDTO(
                        rs.getInt("idApp"), 
                        rs.getString("account"), 
                        rs.getString("partnerPhone"), 
                        rs.getString("partnerName"), 
                        rs.getString("timeToMeet"), 
                        rs.getString("place"), 
                        rs.getInt("expense"), 
                        rs.getString("note"));
                list.add(app);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // Lấy tất cả cuộc hẹn
    public List<AppointmentDTO> readAll() {
        String sql = "SELECT [idApp], [account], [partnerPhone], [partnerName], [timeToMeet], [place], [expense], [note] " +
                     "FROM [dbo].[Appointments]";
        List<AppointmentDTO> list = new ArrayList<>();
        
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                AppointmentDTO app = new AppointmentDTO(
                        rs.getInt("idApp"),
                        rs.getString("account"), 
                        rs.getString("partnerPhone"), 
                        rs.getString("partnerName"), 
                        rs.getString("timeToMeet"), 
                        rs.getString("place"), 
                        rs.getInt("expense"), 
                        rs.getString("note"));
                list.add(app);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
