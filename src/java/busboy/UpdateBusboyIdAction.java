/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package busboy;

import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import sample.RES_Table.RES_TableDAO;

/**
 *
 * @author Orion
 */
public class UpdateBusboyIdAction {
    private int tableID;
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    private final String ROLE = "role";

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }
    
    public UpdateBusboyIdAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (!session.containsKey("USERID")) {
            return ROLE;
        }
        String userID = (String)session.get("USERID");
        
        RES_TableDAO dao = new RES_TableDAO();
        byte status = 0;
        boolean result = dao.updateTableStatus(tableID, userID, status);
        String url = FAIL;
        if (result) {
            url = SUCCESS;
        }
        return url;
    }
    
}
