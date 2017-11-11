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
public class DeleteFoodAction {
    
    private int pk;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";

    public int getPk() {
        return pk;
    }

    public void setPk(int pk) {
        this.pk = pk;
    }
    
    public DeleteFoodAction() {
    }
    
    public String execute() throws Exception {
        RES_FoodDAO dao = new RES_FoodDAO();
        boolean result = dao.deleteFood(pk);
        String url = FAIL;
        if (result) {
            url = SUCCESS;
        }
        return url;
    }
    
}
