/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chef;

import java.math.BigDecimal;
import java.sql.Timestamp;
import sample.RES_OrderDetail.RES_OrderDetailDAO;

/**
 *
 * @author THINHPHAT
 */
public class CompleteAction {

    private BigDecimal id;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public BigDecimal getId() {
        return id;
    }

    public void setId(BigDecimal id) {
        this.id = id;
    }

    public CompleteAction() {
    }

    public String execute() throws Exception {
        RES_OrderDetailDAO dao = new RES_OrderDetailDAO();
        Timestamp timeReady = new Timestamp(System.currentTimeMillis());
        boolean result = dao.updateReadyTime(id, timeReady);
        String url = FAIL;
        if (result) {
            url = SUCCESS;
        }
        return url;
    }

}
