/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.struts;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;

/**
 *
 * @author kysik
 */
public class IndexAction {
    private final String[] SUCCESS = {
        "manager",
        "host",
        "waiter",
        "chef",
        "busboy"
    };
    private final String FAIL = "fail";
    
    public IndexAction() {
    }
    
    public String execute() throws Exception {
        String url = FAIL;
        
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        if (session.containsKey("ROLE")) {
            int role = (int)session.get("ROLE");
            
            if (role < SUCCESS.length) {
                url = SUCCESS[role];
            } else {
                System.out.println("Invalid role");
            }
        }
        
        return url;
    }
    
}
