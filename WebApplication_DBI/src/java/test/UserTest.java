/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.UserDAO;
import dto.UserDTO;
import java.util.List;

/**
 *
 * @author Minh Triet
 */
public class UserTest {
    public static void main(String[] args) {
         UserDAO testUserDaO = new UserDAO();
    
//           for (int i = 0; i < 10; i++) {
//             UserDTO u = new UserDTO("TLM " +i, "Nguyen_Van_0" +i, "AD", "ngu_sao_dua");
//             testUserDaO.create(u);
//    
//        }
    
//        for (int i = 0; i < 10; i++) {
//             String a = String.valueOf(i);
//             testUserDaO.delete("TLM "+a);
//    
//        }

//        List<UserDTO> l1 = testUserDaO.readAll();
//        for (UserDTO u : l1) {
//            System.err.println(u);
//        }


    //    System.out.println(testUserDaO.readbyID("TLM 0"));
        
        System.out.println(testUserDaO.search("ngu"));
        
        
    }
   
}
