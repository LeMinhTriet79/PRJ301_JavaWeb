/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.SnackDTO;
import dto.UserDTO;
import java.util.List;

/**
 *
 * @author frost
 */
public class Test {

    public static void main(String[] args) {
        SnackDAO sdao = new SnackDAO();
        List<SnackDTO> snackList = sdao.readAll();
        for (SnackDTO s : snackList) {
            System.out.println(s.toString());
        }
    }
}
