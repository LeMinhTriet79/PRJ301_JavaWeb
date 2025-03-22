/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;

/**
 *
 * @author Minh Triet
 */
public class Test {
    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        
        UserDTO ut = ud.readbyID("bob");
        System.out.println(ut);
    }
}
