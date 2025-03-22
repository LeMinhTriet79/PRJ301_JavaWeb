/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.dao;

import java.util.List;
import pe.dto.ProductDTO;
import pe.dto.UserDTO;

/**
 *
 * @author Minh Triet
 */
public class TestDao {
    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
    UserDTO ut = udao.readByID("admin");
        System.out.println(ut);
        ProductDAO pdao = new ProductDAO();
         List<ProductDTO> productList = pdao.searchList("a");
        System.out.println(productList);
    }
    
}
