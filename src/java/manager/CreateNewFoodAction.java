/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.convention.annotation.Results;
import sample.RES_Food.RES_FoodDAO;

/**
 *
 * @author THINHPHAT
 */
@ResultPath("/")
@Results({
    @Result(name = "success", location = "manageFood.jsp")
    ,
    @Result(name = "fail", type = "redirect", location = "createFoodErr.html")
    ,
    @Result(name = "input", location = "createNewFood.jsp")
})
public class CreateNewFoodAction extends ActionSupport{

    private String name;
    private int price;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";  

    public String getName() {
        return name;
    }

    @RequiredStringValidator(trim = true,
            message = "Food name is required!!!")
    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public CreateNewFoodAction() {
    }

    public String execute() throws Exception {
        RES_FoodDAO dao = new RES_FoodDAO();
        boolean result = dao.createNewFood(name, price);
        String url = FAIL;
        if (result) {
            url = SUCCESS;
        }
        return url;
    }

}
