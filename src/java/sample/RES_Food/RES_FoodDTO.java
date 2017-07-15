/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_Food;

import java.io.Serializable;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_FoodDTO implements Serializable {

    private int itemID;
    private String name;
    private int price;

    public RES_FoodDTO() {
    }

    public RES_FoodDTO(int itemID, String name, int price) {
        this.itemID = itemID;
        this.name = name;
        this.price = price;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
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


}
