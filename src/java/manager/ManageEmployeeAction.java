/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import sample.RES_User.RES_UserDAO;
import sample.RES_User.RES_UserDTO;

/**
 *
 * @author KIETTTSE62520
 */
public class ManageEmployeeAction {

    private ArrayList<RES_UserDTO> employees;
    private final String SUCCESS ="success";

    public ManageEmployeeAction() {
    }

    public String execute() throws Exception {
        RES_UserDAO dao = new RES_UserDAO();
        this.employees = dao.getEmployee();
        return SUCCESS;
    }

    public ArrayList<RES_UserDTO> getEmployees() {
        return employees;
    }

    public void setEmployees(ArrayList<RES_UserDTO> employees) {
        this.employees = employees;
    }
    
}
