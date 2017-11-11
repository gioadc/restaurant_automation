/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_Order;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import javax.naming.NamingException;
import sample.utilis.DBUtilitizes;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_OrderDAO {

    public BigDecimal createOrder(String waiterID, int tableID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        BigDecimal orderID;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO RES_Order(waiterID, tableID, orderTime, paidTime) VALUES(?,?,?,?)";
                stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stm.setString(1, waiterID);
                stm.setInt(2, tableID);
                Timestamp orderTime = new Timestamp(System.currentTimeMillis());
                stm.setTimestamp(3, orderTime);
                stm.setNull(4, java.sql.Types.TIMESTAMP);
                int row = stm.executeUpdate();
                
                if (row > 0) {
                    try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            orderID = generatedKeys.getBigDecimal(1);
                        } else {
                            throw new SQLException("Creating user failed, no ID obtained.");
                        }
                    }
                    return orderID;
                }
            }
        } finally {
           
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
    
    public boolean updtePaidTime(BigDecimal orderID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "UPDATE RES_Order SET paidTime = ? WHERE orderID = ?";
                stm = con.prepareStatement(sql);
                Timestamp paidTime = new Timestamp(System.currentTimeMillis());
                stm.setTimestamp(1, paidTime);
                stm.setBigDecimal(2, orderID);
                int row = stm.executeUpdate();
                if(row > 0){
                    return true;
                }
            }
        } finally {
           
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public RES_OrderDTO getLastServOrder(String waiterID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            String sql = "SELECT TOP 1 * FROM RES_Order WHERE waiterID = ? and paidTime is NULL";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, waiterID);
            rs = stmt.executeQuery();
            if (rs.next()) {
                RES_OrderDTO dto = new RES_OrderDTO();
                dto.setOrderID(rs.getBigDecimal("orderID"));
                dto.setTableID(rs.getInt("tableID"));
                dto.setOrderTime(rs.getTimestamp("orderTime"));
                dto.setWaiterID(waiterID);
                return dto;
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }
}
