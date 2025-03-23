package pe.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.account.AccountDAO;
import pe.account.AccountDTO;
import pe.appointment.AppointmentDAO;
import pe.appointment.AppointmentDTO;

public class MainController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private AccountDAO adao = new AccountDAO();
    
    private AccountDTO getAccount(String txtUsername){
        AccountDTO acc = adao.readByAcc(txtUsername);
        return acc;
    }
    
    private boolean isValidLogin(String txtUsername, String txtPassword){
        AccountDTO acc = getAccount(txtUsername);
        return acc != null && acc.getPass().equals(txtPassword);  // Kiểm tra null để tránh lỗi
    }
    
    protected void readAllInfor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AppointmentDAO appdao = new AppointmentDAO();
        List<AppointmentDTO> appslist = appdao.readAll();
        request.setAttribute("applist", appslist);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            
            if (action == null) {
                url = ERROR;
            } 
            // Kiểm tra đăng nhập
            else if (action.equals("login")) {
                String txtUsername = request.getParameter("txtUsername");
                String txtPassword = request.getParameter("txtPassword");
                if (isValidLogin(txtUsername, txtPassword)) {
                    url = "appointments.jsp";
                    AccountDTO acc = getAccount(txtUsername);
                    request.getSession().setAttribute("acc", acc);
                    readAllInfor(request, response);  // Đọc và hiển thị danh sách các cuộc hẹn
                } else {
                    url = ERROR;
                    request.setAttribute("message", "Incorrect account or password.");
                }
            } 
            // Kiểm tra đăng xuất
            else if (action.equals("logout")) {
                url = "login.jsp";
                request.getSession().invalidate();
            } 
            // Thêm cuộc hẹn mới
            else if (action.equals("add")) {
                try {
                    String account = request.getParameter("account");
                    String partnerPhone = request.getParameter("partnerPhone");
                    String partnerName = request.getParameter("partnerName");
                    String timeToMeet = request.getParameter("timeToMeet");
                    String place = request.getParameter("place");
                    int expense = Integer.parseInt(request.getParameter("expense"));
                    String note = request.getParameter("note");

                    AppointmentDAO appdao = new AppointmentDAO();
                    AppointmentDTO appadd = new AppointmentDTO(account, partnerPhone, partnerName, timeToMeet, place, expense, note);
                    boolean check = appdao.createApp(appadd);

                    if (check) {
                        url = "appointments.jsp";
                        readAllInfor(request, response);  // Lấy lại danh sách cuộc hẹn sau khi thêm mới
                    } else {
                        url = "create.jsp";
                    }
                    
                } catch (Exception e) {
                    log("Error at MainController: " + e.toString());
                    url = "create.jsp";  // Nếu có lỗi, quay lại trang tạo cuộc hẹn
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "MainController for managing appointments";
    }
}
