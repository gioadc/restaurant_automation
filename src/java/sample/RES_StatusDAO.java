/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import javax.naming.NamingException;
import sample.utilis.DBUtilitizes;

/**
 *
 * @author kysik
 */
public class RES_StatusDAO {
    public boolean insert(String userID, int tableID, byte status, Timestamp time) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            if ( con != null){
                String sql = "INSERT INTO dbo.RES_Status(userID, tableID, status, time) "
                                + "VALUES(?,?,?,?)";
                
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setInt(2, tableID);
                stm.setByte(3, status);
                stm.setTimestamp(4, time);
                
                int row = stm.executeUpdate();
                
                if (row > 0){
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
