/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chef;

import com.opensymphony.xwork2.ActionContext;
import java.util.List;
import sample.RES_OrderDetail.RES_OrderDetailDAO;
import sample.RES_OrderDetail.RES_OrderDetailDTO;

/**
 *
 * @author THINHPHAT
 */
public class ViewPageAction {

    private final String SUCCESS = "success";
    private List<RES_OrderDetailDTO> listOrderDetails;
    private List<RES_OrderDetailDTO> cookingList;

    public List<RES_OrderDetailDTO> getCookingList() {
        return cookingList;
    }

    public void setCookingList(List<RES_OrderDetailDTO> cookingList) {
        this.cookingList = cookingList;
    }

    public List<RES_OrderDetailDTO> getListOrderDetails() {
        return listOrderDetails;
    }

    public void setListOrderDetails(List<RES_OrderDetailDTO> listOrderDetails) {
        this.listOrderDetails = listOrderDetails;
    }

    public ViewPageAction() {
    }

    public String execute() throws Exception {
        RES_OrderDetailDAO dao = new RES_OrderDetailDAO();
        String chefID = (String) ActionContext.getContext().getSession().get("USERID");
        System.out.println("Chef ID: " + chefID);

        dao.searchUndoneOrderDetail(chefID);
        setListOrderDetails(dao.getListOrderDetails());

        dao.searchCookingFood(chefID);
        setCookingList(dao.getCookingList());
        
        return SUCCESS;
    }

}
