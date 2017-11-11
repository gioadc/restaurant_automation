/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package host;

import com.opensymphony.xwork2.ActionContext;
import java.sql.Timestamp;
import java.util.Map;
import sample.RES_Table.RES_TableDAO;

/**
 *
 * @author PC
 */
public class UpdateAction {
    private final String SUCCESS = "success";
    private final String FAIL = "fail";
    private final byte TABLESTATUS = 1;
    private String Error;
    private int tableID;
    private final String ROLE = "role";
    
    public UpdateAction() {
    }
    
    public String execute() throws Exception {
        Map session = ActionContext.getContext().getSession();
        if (!session.containsKey("USERID")) {
            return ROLE;
        }
        String userID = (String)session.get("USERID");
        
        RES_TableDAO dao = new RES_TableDAO();
        boolean result = dao.updateTableStatus(tableID, userID, TABLESTATUS);
        String url = FAIL;
        if (result){
            url = SUCCESS;
        }else{
            Error = "Update Error !!!";
        }
        
        return url;
    }

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public String getError() {
        return Error;
    }

    public void setError(String Error) {
        this.Error = Error;
    }

    
}
