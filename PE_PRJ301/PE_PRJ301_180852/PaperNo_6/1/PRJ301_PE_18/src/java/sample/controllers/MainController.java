/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import dao.RoomDAO;
import dao.UserDAO;
import dto.RoomDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hoadnt
 */
public class MainController extends HttpServlet {

    private static final String WELCOME="login.jsp";
    private UserDAO udao = new UserDAO();
    private RoomDAO roomdao = new RoomDAO();
    
    private UserDTO getUser(String txtUserID){
        UserDTO user = udao.readByID(txtUserID);
        return user;
    }
    private boolean isValidLogin(String txtUserID, String txtPassword){
        UserDTO user = getUser(txtUserID);
        if(user.getPassword().equals(txtPassword)){
            return true;
        } else {
            return false;
        }
        
    }
    
    protected void search(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        if(searchTerm == null){
            searchTerm = "";
        }
        List<RoomDTO> listRoom = roomdao.searchByName(searchTerm);
        request.setAttribute("searchTerm", searchTerm);
        request.setAttribute("listRoom", listRoom);
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= WELCOME;
        try {
            String action= request.getParameter("action");
//            your code here
            if(action != null && action.equals("login")){
                String txtUserID = request.getParameter("txtUserID");
                String txtPassword = request.getParameter("txtPassword");
                
                if (isValidLogin(txtUserID, txtPassword)) {
                    url = "roomList.jsp";
                    UserDTO user = getUser(txtUserID);
                    request.getSession().setAttribute("user", user);
                     search(request, response);
                }else{
                    url = "login.jsp";
                    request.setAttribute("message", "Incorrect UserID or Password");
                }
                
                
            }else if(action.equals("logout")){
                url = WELCOME;
                request.getSession().invalidate();
                request.setAttribute("message", "logout success");
            }else if(action.equals("search")){
                url = "roomList.jsp";
                search(request, response);
            }





        } catch (Exception e) {
            log("Error at MainController: "+ e.toString());
        }finally{
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
