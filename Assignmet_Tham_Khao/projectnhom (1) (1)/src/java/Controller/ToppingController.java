package Controller;

import DAO.ToppingDAO;
import DTO.ToppingDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ToppingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; // Mặc định hiển thị danh sách topping
        }

        ToppingDAO toppingDAO = new ToppingDAO();

        try {
            if ("list".equals(action)) {
                // Lấy danh sách topping
                List<ToppingDTO> toppings = toppingDAO.getAllToppings();
                request.setAttribute("toppings", toppings);
                
                // Chuyển hướng đến JSP
                request.getRequestDispatcher("maTopping.jsp").forward(request, response);
                return;
            } 
            else if ("add".equals(action)) {
                String toppingName = request.getParameter("toppingName");
                String priceStr = request.getParameter("price");

                if (toppingName != null && priceStr != null && !toppingName.trim().isEmpty() && !priceStr.trim().isEmpty()) {
                    try {
                        double price = Double.parseDouble(priceStr);
                        toppingDAO.addTopping(toppingName.trim(), price);
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "Giá topping không hợp lệ.");
                    }
                } else {
                    request.setAttribute("error", "Tên topping và giá không được để trống.");
                }
            } 
             else if ("edit".equals(action)) {
            String toppingIdStr = request.getParameter("toppingId");
            String toppingName = request.getParameter("toppingName");
            String priceStr = request.getParameter("price");

            if (toppingIdStr != null && !toppingIdStr.isEmpty() && toppingName != null && priceStr != null && !priceStr.isEmpty()) {
                int toppingId = Integer.parseInt(toppingIdStr);
                double price = Double.parseDouble(priceStr);
                toppingDAO.updateTopping(toppingId, toppingName, price);
            }
             }
            else if ("delete".equals(action)) {
                String toppingIdStr = request.getParameter("id");

                if (toppingIdStr != null && !toppingIdStr.trim().isEmpty()) {
                    try {
                        int toppingId = Integer.parseInt(toppingIdStr);
                        toppingDAO.deleteTopping(toppingId);
                    } catch (NumberFormatException e) {
                        request.setAttribute("error", "ID topping không hợp lệ.");
                    }
                } else {
                    request.setAttribute("error", "Thiếu ID topping để xóa.");
                }
            }

            // Chuyển hướng để load lại danh sách topping
            response.sendRedirect("ToppingController?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("maTopping.jsp").forward(request, response);
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
        return "Topping Controller";
    }
}
