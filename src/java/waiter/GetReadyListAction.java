/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

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
public class GetReadyListAction implements Serializable{
    private Map<String, Object> data;
    private int error = 0;
    private String msg = "";
    
    public GetReadyListAction() {
    }
    
    public String execute() throws Exception {
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        if (session == null || !session.containsKey("ORDERID")) {
            error = 1;
            this.msg = "No permission!";
            return Action.SUCCESS;
        }
        
        BigDecimal orderID = (BigDecimal) session.get("ORDERID");
        
        RES_OrderDetailDAO dao = new RES_OrderDetailDAO();
        data = new HashMap<>();
        data.put("list", dao.getAllFoodReady(orderID));
        
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

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
    
}
