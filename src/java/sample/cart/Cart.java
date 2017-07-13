/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cart;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Map;
import sample.RES_OrderDetail.RES_OrderDetailDTO;

/**
 *
 * @author KIETTTSE62520
 */
public class Cart implements Serializable{
    private BigDecimal orderID;
    private Map<BigDecimal, RES_OrderDetailDTO> items;

    public Cart() {
    }    

    public Cart(BigDecimal orderID, Map<BigDecimal, RES_OrderDetailDTO> items) {
        this.orderID = orderID;
        this.items = items;
    }

    public BigDecimal getOrderID() {
        return orderID;
    }

    public void setOrderID(BigDecimal orderID) {
        this.orderID = orderID;
    }

    public Map<BigDecimal, RES_OrderDetailDTO> getItems() {
        return items;
    }

    public void setItems(Map<BigDecimal, RES_OrderDetailDTO> items) {
        this.items = items;
    }
}
