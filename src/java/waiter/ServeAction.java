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
public class ServeAction {

    private int tableID;
    //change into status = 2 : serving
    private final byte TABLESTATUS = 2;
    
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    private final String ROLE = "role";

    public ServeAction() {
    }

    public String execute() throws Exception {
        
        Map session = ActionContext.getContext().getSession();
        if (!session.containsKey("USERID")) {
            return ROLE;
        }
        String waiterID = (String)session.get("USERID");
        
        RES_TableDAO daoTable = new RES_TableDAO();
        boolean result1 = daoTable.updateTableStatus(tableID, waiterID, TABLESTATUS);
        
        session.put("TABLEID", tableID);
        RES_OrderDAO daoOrder = new RES_OrderDAO();
        BigDecimal orderID = daoOrder.createOrder(waiterID, tableID);
        
        String url = FAIL;

        if (result1 && orderID != null) {
            url = SUCCESS;
            session.put("ORDERID", orderID);
        }
        return url;
    }

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

  

    
}
