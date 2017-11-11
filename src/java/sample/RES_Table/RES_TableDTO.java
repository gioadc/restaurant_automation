/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_Table;

import java.io.Serializable;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_TableDTO implements Serializable{
    private int tableID;
    private int tableStatus;
    private String tableStatusStr;

    public void setTableStatusStr(String tableStatusStr) {
        this.tableStatusStr = tableStatusStr;
    }

    public RES_TableDTO() {
    }

    public RES_TableDTO(int tableID, int tableStatus) {
        this.tableID = tableID;
        this.tableStatus = tableStatus;
    }

    public int getTableID() {
        return tableID;
    }

    public void setTableID(int tableID) {
        this.tableID = tableID;
    }

    public int getTableStatus() {
        return tableStatus;
    }

    public void setTableStatus(int tableStatus) {
        this.tableStatus = tableStatus;
    }

    public String getTableStatusStr() {
        String tableStr = "";
        switch (this.tableStatus) {
            case 0:
                tableStr = "Clean";
                break;
            case 1:
                tableStr = "Waiting for waiter";
                break;
            case 2:
                tableStr = "Serving";
                break;
            case 3:
                tableStr = "Dirty";
                break;
            case 4:
                tableStr = "Cleaning";
                break;
        }
        return tableStr;
    }
    
}
