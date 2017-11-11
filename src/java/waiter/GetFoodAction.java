/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import com.opensymphony.xwork2.ActionContext;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;
import sample.RES_Food.RES_FoodDAO;
import sample.RES_Food.RES_FoodDTO;
import sample.cart.Cart;

/**
 *
 * @author KIETTTSE62520
 */
public class GetFoodAction {

    private ArrayList<RES_FoodDTO> foods;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public GetFoodAction() {
    }

    public String execute() throws Exception {
        RES_FoodDAO daoFood = new RES_FoodDAO();
        this.foods = daoFood.getFoods();
        
        Map session = ActionContext.getContext().getSession();
        
        if (!session.containsKey("ORDERID")) {
            return FAIL;
        }
        
        if (!session.containsKey("CART")) {
            BigDecimal orderID = (BigDecimal) session.get("ORDERID");
            Cart cart = new Cart();
            cart.setOrderID(orderID);
            session.put("CART", cart);
        }
        return SUCCESS;
    }

    public ArrayList<RES_FoodDTO> getFoods() {
        return foods;
    }

    public void setFoods(ArrayList<RES_FoodDTO> foods) {
        this.foods = foods;
    }
}
