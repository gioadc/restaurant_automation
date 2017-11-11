/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import com.opensymphony.xwork2.ActionContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import sample.RES_Order.RES_OrderDAO;
import sample.RES_Order.RES_OrderDTO;
import sample.RES_Table.RES_TableDAO;
import sample.RES_Table.RES_TableDTO;

/**
 *
 * @author KIETTTSE62520
 */
public class WaiterAction {

    private List<RES_TableDTO> tables;
    //status = 1 : waiting for waiter
    private final int TABLESTATUS = 1;
    private final String SUCCESS = "success";

    public WaiterAction() {
    }

    public String execute() throws Exception {
        
        Map<String, Object> session = ActionContext.getContext().getSession();
        
        if (!session.containsKey("USERID")) {
            return "role";
        }
        String userID = (String) session.get("USERID");
        
        RES_OrderDAO orderDao = new RES_OrderDAO();
        RES_OrderDTO dto = orderDao.getLastServOrder(userID);
        if (dto != null) {
            session.put("TABLEID", dto.getTableID());
            session.put("ORDERID", dto.getOrderID());
            return "lastserve";
        }
        
        RES_TableDAO dao = new RES_TableDAO();
        dao.getTablesByStatus(TABLESTATUS);
        if(this.tables == null){
            this.tables = new ArrayList<>();
        }
        this.tables = dao.getListTables();
        return SUCCESS;
    }

    public List<RES_TableDTO> getTables() {
        return tables;
    }

    public void setTables(List<RES_TableDTO> tables) {
        this.tables = tables;
    }

}
