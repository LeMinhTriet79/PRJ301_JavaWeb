/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.dao.HouseDAO;
import pe.dao.UserDAO;
import pe.dto.HouseDTO;
import pe.dto.UserDTO;

/**
 *
 * @author hd
 */
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    
    
    private UserDAO udao = new UserDAO();
    private HouseDAO housedao = new HouseDAO();
    
    private UserDTO getUser (String txtUserID){
        UserDTO user = udao.readById(txtUserID);
        return user;
    }
    private boolean isValidLogin(String txtUserID, String txtPassword){
        UserDTO user = getUser(txtUserID);
        if(user.getPassword().equals(txtPassword)){
            return true;
        }
        return false;
    }
    
    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if(searchTerm == null){
            searchTerm = "";
        }
        List<HouseDTO> listHouse = housedao.readBySearchTerm(searchTerm);
        request.setAttribute("searchTerm", searchTerm);
        request.setAttribute("listHouse", listHouse);
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
            if(action != null && action.equals("login")){
                String txtUserID = request.getParameter("txtUserID");
                String txtPassword = request.getParameter("txtPassword");
                
                if(isValidLogin(txtUserID, txtPassword)){
                    url = "houseList.jsp";
                    UserDTO user = getUser(txtUserID);
                    request.getSession().setAttribute("user", user);
                    
                }else {
                    url= LOGIN_PAGE;
                    request.setAttribute("message", "Incorrect UserID or Password");
                }
                
                
            }else if(action.equals("logout")){
                url= LOGIN_PAGE;
                request.getSession().invalidate();
            } else if (action.equals("search")){
                url = "houseList.jsp";
                search(request, response);
                
                
            } else if(action.equals("delete")){
               url = "houseList.jsp";
                String id = request.getParameter("id");
                
                housedao.delete(id);
                search(request, response);
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
