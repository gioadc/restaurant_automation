/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import sample.RES_Food.RES_FoodDAO;

/**
 *
 * @author THINHPHAT
 */
public class UpdateFoodAction {

    private int itemID;
    private String name;
    private int price;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

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

    public UpdateFoodAction() {
    }

    public String execute() throws Exception {
        RES_FoodDAO dao = new RES_FoodDAO();
        boolean result = dao.updateFood(itemID, name, price);
        String url = FAIL;
        if (result) {
            url = SUCCESS;
        }
        return url;
    }

}
