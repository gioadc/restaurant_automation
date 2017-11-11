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
import sample.RES_OrderDetail.RES_OrderDetailDAO;
import sample.RES_OrderDetail.RES_OrderDetailDTO;

/**
 *
 * @author KIETTTSE62520
 */
public class WaitFoodAction {
    private final String SUCCESS ="success";
    private ArrayList<RES_OrderDetailDTO> listFoodsOrdered;
    private ArrayList<RES_OrderDetailDTO> listFoodsReady;
    
    public WaitFoodAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        BigDecimal orderID = (BigDecimal) session.get("ORDERID");
        
        RES_OrderDetailDAO dao = new RES_OrderDetailDAO();
        listFoodsOrdered = dao.getAllFoodOrdered(orderID);
        System.out.println("list order" + listFoodsOrdered);
        System.out.println(orderID);
        listFoodsReady = dao.getAllFoodReady(orderID);
        
        return SUCCESS;
    }

    public ArrayList<RES_OrderDetailDTO> getListFoodsOrdered() {
        return listFoodsOrdered;
    }

    public void setListFoodsOrdered(ArrayList<RES_OrderDetailDTO> listFoodsOrdered) {
        this.listFoodsOrdered = listFoodsOrdered;
    }

    public ArrayList<RES_OrderDetailDTO> getListFoodsReady() {
        return listFoodsReady;
    }

    public void setListFoodsReady(ArrayList<RES_OrderDetailDTO> listFoodsReady) {
        this.listFoodsReady = listFoodsReady;
    }
    
    
}
