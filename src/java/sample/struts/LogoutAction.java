/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author PC
 */
public class LogoutAction {
    private final String SUCCESS = "success";
    
    public LogoutAction() {
    }
    
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.getSession().invalidate();
        
        return SUCCESS;
    }
    
}
