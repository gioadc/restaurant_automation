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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import sample.utilis.DBUtilitizes;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_TableDAO implements Serializable{
    private List<RES_TableDTO> listTables;
    private List<RES_TableDTO> listDirtyTables;
    private List<RES_TableDTO> listCleaningTable;

    public List<RES_TableDTO> getListTables() {
        return listTables;
    }
    
    public List<RES_TableDTO> getListDirtyTable(){
        return listDirtyTables;
    }
    
    public List<RES_TableDTO> getListCleaningTables(){
        return listCleaningTable;
    }
    
     public void getTablesByStatusBusBoy(int status) throws NamingException, SQLException{
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
                    if (status == 3){
                        if (listDirtyTables == null){
                            listDirtyTables = new ArrayList<>();
                        }
                        listDirtyTables.add(dto);
                    }
                    if (status == 4){
                        if (listCleaningTable == null){
                            listCleaningTable = new ArrayList<>();
                        }
                        listCleaningTable.add(dto);
                    }
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
    
    public boolean updateTableStatus(int tableID, String userID, byte status) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try{
            con = DBUtilitizes.makeConnection();
            
            if(con != null){
                con.setAutoCommit(false);
                String sql ="UPDATE RES_Table SET tableStatus = ? WHERE tableID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, status);
                stm.setInt(2, tableID);
                int row = stm.executeUpdate();
                if(row > 0){
                    sql = "INSERT INTO RES_Status(userID, tableID, status, time) "
                                + "VALUES(?,?,?,?)";
                    stm = con.prepareStatement(sql);
                    Timestamp time = new Timestamp(System.currentTimeMillis());
                    stm.setString(1, userID);
                    stm.setInt(2, tableID);
                    stm.setByte(3, status);
                    stm.setTimestamp(4, time);
                    row = stm.executeUpdate();
                    if (row > 0) {
                        con.commit();
                        return true;
                    } else {
                        System.out.println("an error occur, rollback table status");
                        con.rollback();
                    }
                }
            }
        } catch (SQLException ex) {
            con.rollback();
            ex.printStackTrace();
            System.out.println("SQL ERROR -- Update table status fail!");
        } finally{
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

    public void getAllTables() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM RES_Table";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int tableID = rs.getInt("tableID");
                    int tableStatus = rs.getInt("tableStatus");
                    RES_TableDTO dto = new RES_TableDTO(tableID, tableStatus);
                    if (listTables == null) {
                        this.listTables = new ArrayList<>();
                    }
                    listTables.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
}
