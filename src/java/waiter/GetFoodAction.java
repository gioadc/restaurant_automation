/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import java.util.ArrayList;
import sample.RES_Food.RES_FoodDAO;
import sample.RES_Food.RES_FoodDTO;

/**
 *
 * @author KIETTTSE62520
 */
public class GetFoodAction {

    private ArrayList<RES_FoodDTO> foods;
    private final String SUCCESS = "success";

    public GetFoodAction() {
    }

    public String execute() throws Exception {
        RES_FoodDAO daoFood = new RES_FoodDAO();
        this.foods = daoFood.getFoods();
        return SUCCESS;
    }

    public ArrayList<RES_FoodDTO> getFoods() {
        return foods;
    }

    public void setFoods(ArrayList<RES_FoodDTO> foods) {
        this.foods = foods;
    }
}
