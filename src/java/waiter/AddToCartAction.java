/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.RES_Food.RES_FoodDAO;
import sample.RES_Food.RES_FoodDTO;
import sample.cart.Cart;


/**
 *
 * @author KIETTTSE62520
 */
public class AddToCartAction {
    private int itemID;
    private String name;
    private int price;
    private int quantity;
    private final String SUCCESS = "success";
    public AddToCartAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        RES_FoodDTO food = new RES_FoodDTO(itemID, name, price);
        Cart cart = null;
        if(!session.containsKey("CART")){
            cart = new Cart();
        } else{
            cart = (Cart) session.get("CART");
        }
        cart.addItemToCart(food, quantity);
        session.put("CART", cart);
        
        return SUCCESS;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
