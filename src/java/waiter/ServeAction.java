/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import com.opensymphony.xwork2.ActionContext;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;
import sample.RES_Food.RES_FoodDAO;
import sample.RES_Food.RES_FoodDTO;
import sample.RES_Order.RES_OrderDAO;
import sample.RES_Table.RES_TableDAO;
import sample.cart.Cart;

/**
 *
 * @author KIETTTSE62520
 */
public class ServeAction {

    private int tableID;
    //change into status = 2 : serving
    private final int TABLESTATUS = 2;
    
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public ServeAction() {
    }

    public String execute() throws Exception {
        RES_TableDAO daoTable = new RES_TableDAO();
        boolean result1 = daoTable.updateTableStatus(tableID, TABLESTATUS);
        
        Map session = ActionContext.getContext().getSession();
        String waiterID = (String)session.get("USERID");
        RES_OrderDAO daoOrder = new RES_OrderDAO();
        BigDecimal orderID = daoOrder.createOrder(waiterID, tableID);
        Cart cart = new Cart();
        cart.setOrderID(orderID);
        ActionContext.getContext().getSession().put("CART", cart);
        String url = FAIL;

        if (result1 && orderID != null) {
            url = SUCCESS;
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
