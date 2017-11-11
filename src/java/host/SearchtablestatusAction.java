/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package host;

import java.util.List;
import sample.RES_Table.RES_TableDAO;
import sample.RES_Table.RES_TableDTO;

/**
 *
 * @author PC
 */
public class SearchtablestatusAction {
    private final String SUCCESS = "success";
    private final int TABLESTATUS = 0;
    private List<RES_TableDTO> list;
    public SearchtablestatusAction() {
    }
    
    public String execute() throws Exception {
        RES_TableDAO dao = new RES_TableDAO();
        //int status = Integer.parseInt(searchValue);
        dao.getTablesByStatus(TABLESTATUS);
        list = dao.getListTables();
        
        return SUCCESS;
    }

    public List<RES_TableDTO> getList() {
        return list;
    }

    public void setList(List<RES_TableDTO> list) {
        this.list = list;
    }
    
    
}
