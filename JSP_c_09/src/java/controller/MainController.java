/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.BookDAO;
import dao.UserDAO;
import dto.BookDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Triet
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public BookDAO bookDAO = new BookDAO();
    private static final String LOGIN_PAGE = "login.jsp";
//====================================================================

    public UserDTO getUser(String strUserID) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readbyID(strUserID);
        return user;
    }

    public boolean isValidLogin(String strUserID, String strPassword) {
        UserDTO user = getUser(strUserID);
        if (user != null && user.getPassword().equals(strPassword)) {
            return true;
        } else {
            return false;
        }
    }
//====================================================================
//Phương thức chung tránh trùng

    public void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if (searchTerm == null) {
            searchTerm = "";
        }
        List<BookDTO> books = bookDAO.searchByTitle(searchTerm);
        request.setAttribute("books", books);
        request.setAttribute("searchTerm", searchTerm);
    }
//====================================================================

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            }
            //your code here
           //=======================================================================
           //Đăng nhập
            if (action != null && action.equals("login")) {
                //Login action
                String strUserID = request.getParameter("strUserID");
                String strPassword = request.getParameter("strPassword");
                //Kiểm tra Password
                if (isValidLogin(strUserID, strPassword)) {
                    url = "search.jsp";
                    UserDTO user = getUser(strUserID);
                    //Session là cái phiên làm việc, chuyển từ trang này
                    //sang trang kia vẫn còn tồn tại cái biến
                    request.getSession().setAttribute("user", user);

                    //search
                    url = "search.jsp";

                    search(request, response); //code trùng

                } else {

                    request.setAttribute("message", "Incorrect UserID or Password");
                    url = "login.jsp";
                }
                
                //=======================================================================
                //Nút Đăng Xuất
            } else if (action != null && action.equals("logout")) {
                url = "MainController"; // lịnh kêu trở lại tổng hành dinh maincontroller
                PrintWriter out = response.getWriter();
                //request.setAttribute("user", null);
                request.getSession().invalidate(); // Hủy Session
                out.println("<b>Bạn đã đăng xuất</b><br/>");
                out.println("<a href='MainController'>Back to login page!</b>");
                return;
            } else if (action.equals("search")) {
                url = "search.jsp";
                search(request, response); //code trùng
            //=======================================================================
            //xóa sản phẩm
            } else if (action.equals("delete")) {
                String id = request.getParameter("id");
                bookDAO.updateQuantityToZero(id);
                //search
                url = "search.jsp";
                search(request, response); //code trùng
                
            //=========================================================================================
            //Thêm sản phẩm
            } else if (action.equals("add")) {
                try {
                    boolean checkError = false;
                    String bookID = request.getParameter("txtBookID");
                    String title = request.getParameter("txtTitle");
                    String author = request.getParameter("txtAuthor");
                    int publishYear = Integer.parseInt(request.getParameter("txtPublishYear"));
                    double price = Double.parseDouble(request.getParameter("txtPrice"));
                    int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                    
                    //bắt lỗi khi bỏ trống
                    if(bookID == null || bookID.trim().isEmpty()){
                        checkError = true;
                        request.setAttribute("txtBookID_error", "Book ID can not empty");
                    }
                    
                    //check quantity
                    if(quantity < 0 ){
                        checkError = true;
                        request.setAttribute("txtQuantity_error", "Quantity must >= 0");
                    }
                    
                    BookDTO book = new BookDTO(bookID, title, author, publishYear, price, quantity);

                    if (!checkError) {
                        bookDAO.create(book);
                        //search
                        url = "search.jsp";
                        search(request, response); //code trùng
                    } else {
                        request.setAttribute("book", book);
                        url = "bookForm.jsp";
                        //Đang bị lỗi thì vẫn đi đến trang bookForm để hiện thị lỗi ra
                    }

                } catch (Exception e) {
                }

            } else if (action.equals("update")) {
                try {
                    boolean checkError = false;
                    String bookID = request.getParameter("txtBookID");
                    String title = request.getParameter("txtTitle");
                    String author = request.getParameter("txtAuthor");
                    int publishYear = Integer.parseInt(request.getParameter("txtPublishYear"));
                    double price = Double.parseDouble(request.getParameter("txtPrice"));
                    int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
                    
                    //bắt lỗi khi bỏ trống
                    if(bookID == null || bookID.trim().isEmpty()){
                        checkError = true;
                        request.setAttribute("txtBookID_error", "Book ID can not empty");
                    }
                    
                    //check quantity
                    if(quantity < 0 ){
                        checkError = true;
                        request.setAttribute("txtQuantity_error", "Quantity must >= 0");
                    }
                    
                    BookDTO book = new BookDTO(bookID, title, author, publishYear, price, quantity);

                    if (!checkError) {
                        bookDAO.updateEdit(book);
                        //search
                        url = "search.jsp";
                        search(request, response); //code trùng
                    } else {
                        request.setAttribute("book", book);
                        url = "bookForm_edit.jsp";
                        //Đang bị lỗi thì vẫn đi đến trang bookForm để hiện thị lỗi ra
                    }

                } catch (Exception e) {
                }

            }
        } catch (Exception e) {
            log(e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            if (!url.equals("MainController")) {
                rd.forward(request, response);
            }

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
