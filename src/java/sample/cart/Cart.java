/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cart;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import sample.RES_Food.RES_FoodDTO;
import sample.RES_OrderDetail.RES_OrderDetailDTO;

/**
 *
 * @author KIETTTSE62520
 */
public class Cart implements Serializable{
    private BigDecimal orderID;
    private Map<Integer, RES_OrderDetailDTO> items;

    public Cart() {
    }    
    
    public void addItemToCart(RES_FoodDTO food, int quantity){
        if(this.items == null){
            this.items = new HashMap<>();
        }
        
        RES_OrderDetailDTO dto = null;
        if(this.items.containsKey(food.getItemID())){
            dto = items.get(food.getItemID());
            dto.setQuantity(dto.getQuantity() + quantity);
        } else{
            dto = new RES_OrderDetailDTO();
            dto.setID(null);
            dto.setOrderID(orderID);
            dto.setItemID(food.getItemID());
            dto.setName(food.getName());
            dto.setQuantity(quantity);
            dto.setPrice(food.getPrice());
        }
        this.items.put(food.getItemID(), dto);
        System.out.println(items);
    }
    
    public void removeItem(int itemID){
        if(this.items == null){
            return;
        }
        
        if(this.items.containsKey(itemID)){
            this.items.remove(itemID);
            if(this.items.isEmpty()){
                this.items = null;
            }
        }
    }
    
    public void updateQuantity(int itemID, int quantity){
        if(this.items == null){
            return;
        }
        
        if(this.items.containsKey(itemID)){
            RES_OrderDetailDTO dto = this.items.get(itemID);
            dto.setQuantity(quantity);
            this.items.put(itemID, dto);
        }
    }

    public BigDecimal getOrderID() {
        return orderID;
    }

    public void setOrderID(BigDecimal orderID) {
        this.orderID = orderID;
    }

    public Map<Integer, RES_OrderDetailDTO> getItems() {
        return items;
    }

    public void setItems(Map<Integer, RES_OrderDetailDTO> items) {
        this.items = items;
    }

    
}
