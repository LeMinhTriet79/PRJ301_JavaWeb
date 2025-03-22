/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.controllers;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hd
 */
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    //khai bao UserDao
    private UserDAO udao = new UserDAO();
    //lấy ra User
    private UserDTO getUser(String txtUsername){
        UserDTO user = udao.readbyID(txtUsername);
        return user;
    }
    private boolean isValidLogin (String txtUsername, String txtPassword){
        //lấy ra User ở trên rồi đối chiếu
        UserDTO user = getUser(txtUsername);
        //điều quan trọng là user lấy ra phải tồn tại
        if(user != null && user.getPassword().equals(txtPassword)){
            return true;
        } else{
            return false;
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            }
//            your code here
            if (action != null && action.equals("login")) {
                String txtUsername = request.getParameter("txtUsername");
                String txtPassword = request.getParameter("txtPassword");
                
                // xác thực
                if (isValidLogin(txtUsername, txtPassword)) {
                    url = "currencyExchangeRate.jsp";
                    UserDTO user = getUser(txtUsername);
                    request.getSession().setAttribute("user", user);
                   
                } else{
                  request.setAttribute("message", "Incorrect password or username");
                  url = "login.jsp";
                }
                
            }else if (action != null && action.equals("logout")){
                  url = LOGIN_PAGE;
                  request.getSession().invalidate();
                  
            }else if (action != null && action.equals("searchForm")){
                url = "error.jsp";
            }
            
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
