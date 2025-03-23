/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import dao.UserDAO;

/**
 *
 * @author Minh Triet
 */
public class Test {
    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        UserDTO ut = ud.readByID("user1");
        System.out.println(ut);
    }
    
    
}
