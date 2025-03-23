/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.dao;

import java.util.ArrayList;
import java.util.List;
import pe.dto.HouseDTO;
import pe.dto.UserDTO;

/**
 *
 * @author Minh Triet
 */
public class Test {
    public static void main(String[] args) {
        UserDAO ud = new UserDAO();
        UserDTO ut = ud.readById("admin");
        System.out.println(ut);
        
        HouseDAO hao = new HouseDAO();
        List<HouseDTO> listh = new ArrayList<>();
        listh = hao.readBySearchTerm("a");
        
     boolean a =   hao.delete("H-001");
        System.out.println(a);
        System.out.println(listh);
        for (HouseDTO houseDTO : listh) {
            System.out.println(houseDTO);
        }
        
        
    }
}
