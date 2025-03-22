/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Minh Triet
 */
public class UserDTO {
    private String username;
     private String name;
     private String password;

    public UserDTO(String username, String name, String password) {
        this.username = username;
        this.name = name;
        this.password = password;
    }

    public UserDTO() {
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "username=" + username + ", name=" + name + ", password=" + password + '}';
    }
     
     
     
     
}
