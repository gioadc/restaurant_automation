/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_User;

import java.io.Serializable;

/**
 *
 * @author kysik
 */
public class RES_UserDTO implements Serializable {

    private String userID;
    private String password;
    private String confirm;
    private String name;
    private String phone;
    private int role;
    

    public RES_UserDTO() {
    }

    public RES_UserDTO(String userID, String password, String name, String phone, int role) {
        this.userID = userID;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.role = role;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getRoleString() {
        String roleString = "";
        switch (this.role) {
            case 0:
                roleString = "Manager";
                break;
            case 1:
                roleString = "Host";
                break;
            case 2:
                roleString = "Waiter";
                break;
            case 3:
                roleString = "Chef";
                break;
            case 4:
                roleString = "Busboy";
                break;
        }
        return roleString;
    }

}
