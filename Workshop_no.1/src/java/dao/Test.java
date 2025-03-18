/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProjectDTO;
import dto.UserDTO;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author Minh Triet
 */
public class Test {
    public static void main(String[] args) {
        ProjectDAO pd = new ProjectDAO();
        UserDAO ud = new UserDAO();
//        ProjectDTO pt = new ProjectDTO(1, "Ban_Bao_Cao", "Co_Qua_Hanh_Chanh_Cuc_Hai_Quan_Thuong_Phuoc", "Ideation", "03-02-2020");
//        pd.create(pt);

//          ProjectDTO pt = new ProjectDTO(1, "Ban_Bao_Cao_so_01", "Co_Quan_Hanh_Chanh_Cuc_Hai_Quan_Thuong_Phuoc", "Ideation", "03-02-2020");
//          pd.update(pt);

//        List<ProjectDTO> pt = (List<ProjectDTO>) pd.readbyProject_ID(1);
//        System.out.println(pt);
//        for (ProjectDTO projectDTO : pt) {
//            System.out.println(projectDTO);
//        }

//        ProjectDTO pt = new ProjectDTO(2, "Ban_Bao_Cao_so_02", "Phong_Chong_Buon_Lau_Chi_Cuc_Hai_Quan_Hong_Ngu_Thi_Xa", "Ideation", "02-18-2019");
//        pd.create(pt);
//        

//          Scanner sc = new Scanner(System.in);
//          for (int i = 3; i <= 10; i++) {
//            System.out.println("Nhập cái mô tả! ");
//          String description = sc.nextLine();
//          ProjectDTO pt = new ProjectDTO(i, "Ban_Bao_Cao_so_0"+i, description, "Development", "0"+i+"-18-2019");
//          pd.create(pt);
//        }
           
//          UserDTO ut = ud.readbyID("admin01");
//          System.out.println(ut);

//        List<ProjectDTO> pt = (List<ProjectDTO>) pd.searchbyName("_");
//        System.out.println(pt);
//        for (ProjectDTO projectDTO : pt) {
//            System.out.println();
//        }
     }
}
