/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SnackDAO;
import dao.UserDAO;
import dto.SnackDTO;
import dto.UserDTO;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    SnackDAO sdao = new SnackDAO();
    UserDAO udao = new UserDAO();

    public List<SnackDTO> displayList() {
        List<SnackDTO> snackList = sdao.readAll();
        return snackList;
    }

    public List<SnackDTO> foundList(String searchTerm) {
        List<SnackDTO> foundList = sdao.search(searchTerm);
        return foundList;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
                //Login
            } else if (action != null && action.equals("login")) {
                if (AuthUtils.isValidLogin(username, password)) {
                    url = "search.jsp";
                    UserDTO user = AuthUtils.getUser(username);
                    request.getSession().setAttribute("user", user);
                    List<SnackDTO> snackList = displayList();
                    request.setAttribute("snackList", snackList);
                    String filePath = "D:\\user_cart\\" + username + ".txt";
                    File f = new File(filePath);
                    if (!f.exists()) {
                        f.createNewFile();
                    }
                } else {
                    url = LOGIN_PAGE;
                    request.setAttribute("message", "Incorrect username or password");
                }
                //Login as quest    
            } else if (action != null && action.equals("guest")) {
                url = "guest.jsp";
                List<SnackDTO> guestSnackList = displayList();
                request.setAttribute("guestSnackList", guestSnackList);
                //Logout    
            } else if (action != null && action.equals("logout")) {
                url = LOGIN_PAGE;
                request.getSession().invalidate();
                //Tìm kiếm    
            } else if (action != null && action.equals("search")) {
                String searchTerm = request.getParameter("txtSearchTerm");
                
                if (searchTerm == null) {
                    searchTerm = "";
                }
                List<SnackDTO> foundList = foundList(searchTerm);
                request.setAttribute("searchTerm", searchTerm);
                request.setAttribute("foundList", foundList);
                url = "search.jsp";
                //Tìm kiếm với guest    
            } else if (action != null && action.equals("guestsearch")) {
                 url = "guest.jsp";
                String searchTerm = request.getParameter("txtGuestSearchTerm");
                 if (searchTerm == null) {
                    searchTerm = "";
                }
                 request.setAttribute("searchTerm", searchTerm);
                List<SnackDTO> guestFoundList = foundList(searchTerm);
                request.setAttribute("guestFoundList", guestFoundList);
               
                //     
            } else if (action != null && action.equals("add")) {
                String snackId = request.getParameter("txtSnackId");
                String picture = "snacks/" + request.getParameter("txtPicture");
                String name = request.getParameter("txtName");
                String region = request.getParameter("txtRegion");
                String unit = request.getParameter("txtUnit");
                int price = Integer.parseInt(request.getParameter("txtPrice"));
                SnackDTO snack = new SnackDTO(snackId, picture, name, region, unit, price);
                sdao.create(snack);
                List<SnackDTO> snackList = displayList();
                request.setAttribute("snackList", snackList);
                url = "search.jsp";
            } else if (action != null && action.equals("edit")) {
                String newSnackId = request.getParameter("txtNewSnackId");
                String newPicture = "snacks/" + request.getParameter("txtNewPicture");
                String newName = request.getParameter("txtNewName");
                String newRegion = request.getParameter("txtNewRegion");
                String newUnit = request.getParameter("txtNewUnit");
                int newPrice = Integer.parseInt(request.getParameter("txtNewPrice"));
                SnackDTO snack = new SnackDTO(newSnackId, newPicture, newName, newRegion, newUnit, newPrice);
                sdao.update(snack);
                List<SnackDTO> snackList = displayList();
                request.setAttribute("snackList", snackList);
                url = "search.jsp";
            } else if (action != null && action.equals("delete")) {
                String deletedSnackId = request.getParameter("deletedSnackId");
                sdao.deleteBySnackId(deletedSnackId);
                List<SnackDTO> snackList = displayList();
                request.setAttribute("snackList", snackList);
                url = "search.jsp";
            } else if (action != null && action.equals("register")) {
                String newUsername = request.getParameter("txtNewUsername");
                String newFullName = request.getParameter("txtNewFullName");
                String newRole = request.getParameter("txtNewRole");
                String newPassword = request.getParameter("txtNewPassword");
                UserDTO user = new UserDTO(newUsername, newFullName, newRole, newPassword);
                udao.create(user);
                UserDTO success = udao.readbyUsername(newUsername);
                request.setAttribute("success", success);
                url = "success.jsp";
            } else if (action != null && action.equals("wish")) {
                HttpSession session = request.getSession();
                String snackId = request.getParameter("snackId");
                String picture = request.getParameter("picture");
                String name = request.getParameter("name");
                String region = request.getParameter("region");
                String unit = request.getParameter("unit");
                int price = Integer.parseInt(request.getParameter("price"));
                SnackDTO snack = new SnackDTO(snackId, picture, name, region, unit, price);
                List<SnackDTO> wishlist = (List<SnackDTO>) session.getAttribute("wishlist");
                if (wishlist == null) {
                    // Nếu chưa tồn tại, tạo mới danh sách
                    wishlist = new ArrayList<>();
                }
                wishlist.add(snack);
                session.setAttribute("wishlist", wishlist);
                //        
                List<SnackDTO> snackList = displayList();
                request.setAttribute("snackList", snackList);
                url = "search.jsp";
            } else if (action != null && action.equals("buy")) {
                HttpSession session = request.getSession();
                String snackId = request.getParameter("snackId");
                String picture = request.getParameter("picture");
                String name = request.getParameter("name");
                String region = request.getParameter("region");
                String unit = request.getParameter("unit");
                int price = Integer.parseInt(request.getParameter("price"));
                SnackDTO snack = new SnackDTO(snackId, picture, name, region, unit, price);
                List<SnackDTO> wishlist = (List<SnackDTO>) session.getAttribute("wishlist");
                if (wishlist != null) {
                    for (int i = 0; i < wishlist.size(); i++) {
                        if (wishlist.get(i).getSnackId().equals(snack.getSnackId())) {
                            wishlist.remove(i);
                            break; // Ngừng duyệt khi đã xóa thành công
                        }
                    }
                }
                List<SnackDTO> buyingList = (List<SnackDTO>) session.getAttribute("buyingList");
                if (buyingList == null) {
                    buyingList = new ArrayList<>();
                }
                buyingList.add(snack);
                session.setAttribute("buyingList", buyingList);
                url = "buy.jsp";
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
//"D:\\user_cart\\nak1.txt"
