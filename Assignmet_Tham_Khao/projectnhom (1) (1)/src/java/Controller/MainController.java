package Controller;

import DAO.ProductDAO;
import DAO.ToppingDAO;
import DAO.UserDAO;
import DTO.ProductDTO;
import DTO.ToppingDTO;
import DTO.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String MENU_PAGE = "menu.jsp";
    private static final String REGISTER_PAGE = "register.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");

            if (action == null || action.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String redirectPage = request.getParameter("redirect"); // Lấy trang trước đó

                if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
                    request.setAttribute("error", "Username and password are required!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }

                UserDAO dao = new UserDAO();
                UserDTO user = dao.login(username, password);

                if (user != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("USER", user);

                    // Nếu redirectPage là index.jsp, chuyển hướng theo role
                    if (redirectPage == null || redirectPage.isEmpty() || "index.jsp".equals(redirectPage)) {
                        if ("Admin".equals(user.getRoleName())) {
                            response.sendRedirect("managerhomepage.jsp");
                        } else if ("Customer".equals(user.getRoleName())) {
                            response.sendRedirect("userhomepage.jsp");
                        } else {
                            request.setAttribute("error", "Unauthorized role!");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    } else {
                        // Nếu đến từ trang khác (menu.jsp, about.jsp, contact.jsp, v.v.), quay lại đó
                        response.sendRedirect(redirectPage);
                    }
                    return;
                } else {
                    request.setAttribute("error", "Invalid username or password!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
            if (action.equals("logout")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }

                String redirectPage = request.getHeader("referer"); // Lấy trang trước khi đăng xuất
                if (redirectPage != null && !redirectPage.contains("logout")) {
                    response.sendRedirect(redirectPage); // Quay lại trang trước đó
                } else {
                    response.sendRedirect("index.jsp"); // Nếu không có, về trang chủ
                }
                return;
            } else if (action.equals("register")) {
                 
                String fullName = request.getParameter("fullName");
                String phoneNumber = request.getParameter("phoneNumber");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String confirmPassword = request.getParameter("confirmPassword");

                if (fullName == null || phoneNumber == null || username == null || password == null || confirmPassword == null
                        || fullName.isEmpty() || phoneNumber.isEmpty() || username.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
                    request.setAttribute("error", "All fields are required!");
                    request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
                    return;
                }

                if (!password.equals(confirmPassword)) {
                    request.setAttribute("error", "Passwords do not match!");
                    request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
                    return;
                }

                UserDTO newUser = new UserDTO(fullName, phoneNumber, username, password, "Customer");
                UserDAO dao = new UserDAO();
                boolean success = dao.register(newUser);

                if (success) {
                    request.setAttribute("message", "Registration successful! Please login.");
                    request.getRequestDispatcher(LOGIN_PAGE).forward(request, response);
                } else {
                    request.setAttribute("error", "Registration failed! Username or phone number may already exist.");
                    request.getRequestDispatcher(REGISTER_PAGE).forward(request, response);
                }
                return;
            } else if (action.equals("search")) {
                try {
                    String txtSearch = request.getParameter("keyword");

                    if (txtSearch == null || txtSearch.trim().isEmpty()) {
                        request.setAttribute("error", "Please enter a keyword to search!");
                    } else {
                        ProductDAO dao = new ProductDAO();
                        List<ProductDTO> productList = dao.searchByName(txtSearch);

                        if (productList == null || productList.isEmpty()) {
                            request.setAttribute("message", "No products found for: " + txtSearch);
                        } else {
                            request.setAttribute("PRODUCT_LIST", productList);
                        }
                    }
                } catch (Exception e) {
                    log("Error at search: " + e.getMessage());
                    request.setAttribute("error", "An error occurred while searching!");
                }

                request.getRequestDispatcher(MENU_PAGE).forward(request, response);
                return;
            } else if ("add".equals(action)) {
                String productName = request.getParameter("productName");
                double price = Double.parseDouble(request.getParameter("price"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));

                ProductDTO product = new ProductDTO(0, productName, "", price, categoryId);
                ProductDAO dao = new ProductDAO();

                if (dao.addProduct(product)) {
                    request.setAttribute("message", "Product added successfully!");
                } else {
                    request.setAttribute("error", "Failed to add product.");
                }

                request.getRequestDispatcher("maProducts1.jsp").forward(request, response);
                return;

            } else if ("edit".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                String productName = request.getParameter("productName");
                double price = Double.parseDouble(request.getParameter("price"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));

                ProductDTO product = new ProductDTO(productId, productName, "", price, categoryId);
                ProductDAO dao = new ProductDAO();  

                if (dao.updateProduct(product)) {
                    request.setAttribute("message", "Product updated successfully!");
                } else {
                    request.setAttribute("error", "Failed to update product.");
                }

                request.getRequestDispatcher("maProducts1.jsp").forward(request, response);
                return;

            } else if ("delete".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("id"));
                ProductDAO dao = new ProductDAO();

                if (dao.deleteProduct(productId)) {
                    request.setAttribute("message", "Product deleted successfully!");
                } else {
                    request.setAttribute("error", "Failed to delete product.");
                }

                request.getRequestDispatcher("maProducts.jsp").forward(request, response);
                return;
            }
//            


        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            // ✅ Chỉ forward nếu response chưa bị commit (gửi đi)
            if (!response.isCommitted()) {
                request.getRequestDispatcher(url).forward(request, response);
            }
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
        return "Main Controller handling login, logout, and menu navigation";
    }
}
