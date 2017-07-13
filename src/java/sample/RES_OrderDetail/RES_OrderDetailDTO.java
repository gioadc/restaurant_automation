/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_OrderDetail;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_OrderDetailDTO implements Serializable{
    private BigDecimal ID;
    private BigDecimal orderID;
    private String itemID;
    private String chefID;
    private boolean taken;
    private Timestamp timeReady;

    public BigDecimal getID() {
        return ID;
    }

    public void setID(BigDecimal ID) {
        this.ID = ID;
    }

    public BigDecimal getOrderID() {
        return orderID;
    }

    public void setOrderID(BigDecimal orderID) {
        this.orderID = orderID;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public String getChefID() {
        return chefID;
    }

    public void setChefID(String chefID) {
        this.chefID = chefID;
    }

    public boolean isTaken() {
        return taken;
    }

    public void setTaken(boolean taken) {
        this.taken = taken;
    }

    public Timestamp getTimeReady() {
        return timeReady;
    }

    public void setTimeReady(Timestamp timeReady) {
        this.timeReady = timeReady;
    }
    
}
