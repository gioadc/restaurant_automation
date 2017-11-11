/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import sample.RES_User.RES_UserDAO;

/**
 *
 * @author KIETTTSE62520
 */
public class UpdateEmployeeAction {
    private String userID;
    private String password;
    private String name;
    private String phone;
    private final String SUCCESS ="success";
    public UpdateEmployeeAction() {
    }
    
    public String execute() throws Exception {
        RES_UserDAO dao = new RES_UserDAO();
        dao.updateUserDetail(userID, password, name, phone);
        return SUCCESS;
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
    
    
}
