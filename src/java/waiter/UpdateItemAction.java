/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package waiter;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.cart.Cart;

/**
 *
 * @author KIETTTSE62520
 */
public class UpdateItemAction {
    private int id;
    private int quantity;
    private final String SUCCESS = "success";
    public UpdateItemAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if(session.containsKey("CART")){
            Cart cart = (Cart) session.get("CART");
            cart.updateQuantity(id, quantity);
            session.put("CART", cart);
        }
        return SUCCESS;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
 
    
}
