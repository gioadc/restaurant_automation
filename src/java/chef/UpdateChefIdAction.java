/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chef;

import com.opensymphony.xwork2.ActionContext;
import java.math.BigDecimal;
import sample.RES_OrderDetail.RES_OrderDetailDAO;

/**
 *
 * @author THINHPHAT
 */
public class UpdateChefIdAction {

    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    private BigDecimal id;

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public UpdateChefIdAction() {
    }

    public String execute() throws Exception {
        RES_OrderDetailDAO dao = new RES_OrderDetailDAO();
        String chefID = (String) ActionContext.getContext().getSession().get("USERID");
        boolean result = dao.updateChefId(id, chefID);
        System.out.println("Chef ID in update: " + chefID);
        String url = FAIL;
        if (result) {
            url = SUCCESS;
        }
        return url;
    }

}
