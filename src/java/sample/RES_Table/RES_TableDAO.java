/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_Table;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utilis.DBUtilitizes;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_TableDAO implements Serializable{
    private List<RES_TableDTO> listTables;

    public List<RES_TableDTO> getListTables() {
        return listTables;
    }
    
    public void getTablesByStatus(int status) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            if(con != null){
                String sql = "SELECT * FROM RES_Table WHERE tableStatus = ? ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, status);
                rs = stm.executeQuery();
                while(rs.next()){
                    int tableID = rs.getInt("tableID");
                    int tableStatus = rs.getInt("tableStatus");
                    RES_TableDTO dto = new RES_TableDTO(tableID, tableStatus);
                    if(listTables == null){
                        this.listTables = new ArrayList<>();
                    }
                    listTables.add(dto);
                }
            }
        } finally{
            if(rs != null){
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
    }
    
    public boolean updateTableStatus(int tableID, int status) throws SQLException, NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = DBUtilitizes.makeConnection();
            if(con != null){
                String sql =" UPDATE RES_Table SET tableStatus = ? WHERE tableID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, status);
                stm.setInt(2, tableID);
                int row = stm.executeUpdate();
                if(row > 0){
                    return true;
                }
            }
        } finally{
            if(rs != null){
                rs.close();
            }
            if(stm != null){
                stm.close();
            }
            if(con != null){
                con.close();
            }
        }
        return false;
    }
    
    public boolean insertTimeComeIn(String hostID, int tableID, Timestamp timeComeIn) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            if ( con != null){
                String sql = "Insert into dbo.RES_ComeIn(hostID, tableID, timeComeIn) "
                                + "values(?,?,?)";
                
                timeComeIn = new Timestamp(System.currentTimeMillis());
                stm = con.prepareStatement(sql);
                stm.setString(1, hostID);
                stm.setInt(2, tableID);
                stm.setTimestamp(3, timeComeIn);
                
                int result = stm.executeUpdate();
                
                if (result > 0){
                    return true;
                }
            }
        } finally {
            if ( rs != null){
                rs.close();
            }
            if ( stm != null){
                stm.close();
            }
            if ( con != null){
                con.close();
            }
        }
        
        
        return false;
    }
}
