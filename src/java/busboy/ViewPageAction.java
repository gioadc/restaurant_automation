/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package busboy;


import java.util.List;
import sample.RES_Table.RES_TableDAO;
import sample.RES_Table.RES_TableDTO;

/**
 *
 * @author Orion
 */
public class ViewPageAction {

    private String tableID;
    private String tableStatus;
    private final String SUCCESS = "success";
    private List<RES_TableDTO> listDirtyTables;
    private List<RES_TableDTO> listCleaningTables;
    private List<RES_TableDTO> listTab;

    public List<RES_TableDTO> getListTab() {
        return listTab;
    }

    public void setListTab(List<RES_TableDTO> listTab) {
        this.listTab = listTab;
    }

    public String getTableID() {
        return tableID;
    }

    public void setTableID(String tableID) {
        this.tableID = tableID;
    }

    public String getTableStatus() {
        return tableStatus;
    }

    public void setTableStatus(String tableStatus) {
        this.tableStatus = tableStatus;
    }

    public List<RES_TableDTO> getListDirtyTables() {
        return listDirtyTables;
    }

    public void setListDirtyTables(List<RES_TableDTO> listDirtyTables) {
        this.listDirtyTables = listDirtyTables;
    }

    public List<RES_TableDTO> getListCleaningTables() {
        return listCleaningTables;
    }

    public void setListCleaningTables(List<RES_TableDTO> listCleaningTables) {
        this.listCleaningTables = listCleaningTables;
    }

    public ViewPageAction() {
    }

    public String execute() throws Exception {
        RES_TableDAO dao = new RES_TableDAO();                
        dao.getTablesByStatusBusBoy(3);
        listDirtyTables = dao.getListDirtyTable();
        dao.getTablesByStatusBusBoy(4);
        listCleaningTables = dao.getListCleaningTables();
        return SUCCESS;
    }

}
