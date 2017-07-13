/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_Order;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_OrderDTO implements Serializable{
    private BigDecimal orderID;
    private String waiterID;
    private int tableID;
    private Timestamp orderTime;
    private Timestamp paidTime;

    public RES_OrderDTO() {
    }

    public RES_OrderDTO(BigDecimal orderID, String waiterID, int tableID, Timestamp orderTime, Timestamp paidTime) {
        this.orderID = orderID;
        this.waiterID = waiterID;
        this.tableID = tableID;
        this.orderTime = orderTime;
        this.paidTime = paidTime;
    }

    public BigDecimal getOrderID() {
        return orderID;
    }

    public void setOrderID(BigDecimal orderID) {
        this.orderID = orderID;
    }

    public String getWaiterID() {
        return waiterID;
    }

    public void setWaiterID(String waiterID) {
        this.waiterID = waiterID;
    }

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
    }

    public Timestamp getPaidTime() {
        return paidTime;
    }

    public void setPaidTime(Timestamp paidTime) {
        this.paidTime = paidTime;
    }
    
}
