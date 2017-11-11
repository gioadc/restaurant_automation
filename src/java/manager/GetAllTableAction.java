/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package manager;

import java.util.List;
import sample.RES_Table.RES_TableDAO;
import sample.RES_Table.RES_TableDTO;

/**
 *
 * @author THINHPHAT
 */
public class GetAllTableAction {

    private final String SUCCESS = "success";
    private List<RES_TableDTO> allTableList;

    public List<RES_TableDTO> getAllTableList() {
        return allTableList;
    }

    public void setAllTableList(List<RES_TableDTO> allTableList) {
        this.allTableList = allTableList;
    }

    public GetAllTableAction() {
    }

    public String execute() throws Exception {
        RES_TableDAO dao = new RES_TableDAO();
        dao.getAllTables();
        allTableList = dao.getListTables();
        for (RES_TableDTO dto : allTableList) {
            System.out.println(dto.getTableStatusStr());
        }
        return SUCCESS;
    }

}
