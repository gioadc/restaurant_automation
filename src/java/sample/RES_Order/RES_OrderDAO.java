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
        ResultSet rs = null;
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
        return null;
    }
}
