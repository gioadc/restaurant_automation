/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.db.UserDAO;

/**
 *
 * @author kysik
 */
public class LoginAction {
    private String username;
    private String password;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    
    public LoginAction() {
    }
    
    public String execute() throws Exception {
        String url = FAIL;
        
        UserDAO dao = new UserDAO();
        boolean result = dao.checkLogin(username, password);
        if (result) {
            url = SUCCESS;
            String fullName = dao.getName();
            int role = dao.getRole();
            Map<String, Object> session = ActionContext.getContext().getSession();
            session.put("FULLNAME", fullName);
            session.put("CART", role);
            session.put("USERID", username);
        }
        
        return url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
