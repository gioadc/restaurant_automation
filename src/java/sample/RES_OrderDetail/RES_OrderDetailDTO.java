/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_OrderDetail;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_OrderDetailDTO implements Serializable{
    private BigDecimal ID;
    private BigDecimal orderID;
    private int itemID;
    private String chefID;
    private boolean taken;
    private Timestamp timeReady;
    private Timestamp orderTime; //from Order
    private String orderTimeString;
    private String name;    //from food
    private int price;  //from food
    private int quantity = 1;

    public RES_OrderDetailDTO() {
    }

    public RES_OrderDetailDTO(BigDecimal ID, BigDecimal orderID, int itemID, String chefID, boolean taken, Timestamp timeReady, String name, int price) {
        this.ID = ID;
        this.orderID = orderID;
        this.itemID = itemID;
        this.chefID = chefID;
        this.taken = taken;
        this.timeReady = timeReady;
        this.name = name;
        this.price = price;
    }

    public BigDecimal getID() {
        return ID;
    }
    
    public String getOrderTimeStr() {
        return orderTimeString;
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

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
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

    public Timestamp getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Timestamp orderTime) {
        this.orderTime = orderTime;
        this.orderTimeString = new SimpleDateFormat("HH:mm").format(orderTime);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
  
   
}
