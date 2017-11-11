/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import sample.RES_User.RES_UserDAO;

/**
 *
 * @author KIETTTSE62520
 */
public class DeleteEmployeeAction {

    private String id;
    private final String SUCCESS = "success";

    public DeleteEmployeeAction() {
    }

    public String execute() throws Exception {
        RES_UserDAO dao = new RES_UserDAO();
        dao.deleteEmployee(id);
        return SUCCESS;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
