/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import com.opensymphony.xwork2.ActionContext;
import java.math.BigDecimal;
import java.util.Map;
import sample.RES_Order.RES_OrderDAO;
import sample.RES_Table.RES_TableDAO;

/**
 *
 * @author KIETTTSE62520
 */
public class PayBillAction {
    private final byte TABLESTATUS = 3;
    private final String SUCCESS = "success";
    private final String ROLE = "role";
    public PayBillAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (!session.containsKey("USERID")) {
            return ROLE;
        }
        String userID = (String)session.get("USERID");
        
        int tableID = (int) session.get("TABLEID");
        RES_TableDAO daoTable = new RES_TableDAO();
        daoTable.updateTableStatus(tableID, userID, TABLESTATUS);
        
        RES_OrderDAO daoOrder = new RES_OrderDAO();
        BigDecimal orderID = (BigDecimal) session.get("ORDERID");
        daoOrder.updtePaidTime(orderID);
        session.remove("TABLEID");
        session.remove("ORDERID");
        return SUCCESS;
    }
    
}
