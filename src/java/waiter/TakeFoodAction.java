/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import java.math.BigDecimal;
import sample.RES_OrderDetail.RES_OrderDetailDAO;

/**
 *
 * @author KIETTTSE62520
 */
public class TakeFoodAction {
    private final String SUCCESS ="success";
    private BigDecimal id;
    
    public TakeFoodAction() {
    }
    
    public String execute() throws Exception {
        RES_OrderDetailDAO dao = new RES_OrderDetailDAO();
        boolean result = dao.updateTakeFood(id);
        return SUCCESS;
    }

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }
    
    
    
}
