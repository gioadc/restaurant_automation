/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.RES_OrderDetail.RES_OrderDetailDAO;
import sample.RES_OrderDetail.RES_OrderDetailDTO;
import sample.cart.Cart;

/**
 *
 * @author KIETTTSE62520
 */
public class InsertOrderAction {

    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public InsertOrderAction() {
    }

    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (session.containsKey("CART")) {
            Cart cart = (Cart) session.get("CART");
            RES_OrderDetailDAO dao = new RES_OrderDetailDAO();

            boolean insertOk = false;
            for (Map.Entry item : cart.getItems().entrySet()) {
                RES_OrderDetailDTO dto = (RES_OrderDetailDTO) item.getValue();
                for (int i = 0; i < dto.getQuantity(); i++) {
                    insertOk = dao.insertOrderDetail(dto);
                    if (!insertOk) {
                        return FAIL;
                    }
                }
                
            }
            
            session.remove("CART");
            
        }
        return SUCCESS;
    }

}
