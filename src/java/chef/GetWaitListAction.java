/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chef;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import sample.RES_OrderDetail.RES_OrderDetailDAO;


/**
 *
 * @author kysik
 */
public class GetWaitListAction implements Serializable{
    private Map<String, Object> data;
    private int error = 0;
    private String msg = "";
    
    public GetWaitListAction() {
    }
    
    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        if (session == null || !session.containsKey("USERID")) {
            error = 1;
            this.msg = "No permission!";
            return Action.SUCCESS;
        }
        
        String chefID = (String) session.get("USERID");
        data = new HashMap<>();
        RES_OrderDetailDAO dao = new RES_OrderDetailDAO();
        dao.searchUndoneOrderDetail(chefID);
        data.put("list", dao.getListOrderDetails());
        
        return Action.SUCCESS;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public int getError() {
        return error;
    }

    public void setError(int error) {
        this.error = error;
    }

    
    
}
