/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_OrderDetail;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import sample.utilis.DBUtilitizes;

/**
 *
 * @author KIETTTSE62520
 */
public class RES_OrderDetailDAO {
    
    List<RES_OrderDetailDTO> listOrderDetails;
    List<RES_OrderDetailDTO> cookingList;

    public List<RES_OrderDetailDTO> getCookingList() {
        return cookingList;
    }

    public void setCookingList(List<RES_OrderDetailDTO> cookingList) {
        this.cookingList = cookingList;
    }

    public List<RES_OrderDetailDTO> getListOrderDetails() {
        return listOrderDetails;
    }

    public void setListOrderDetails(List<RES_OrderDetailDTO> listOrderDetails) {
        this.listOrderDetails = listOrderDetails;
    }

    public void searchUndoneOrderDetail(String chefID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM RES_orderDetail INNER JOIN RES_Food"
                        + " ON RES_orderDetail.itemID = RES_Food.itemID"
                        + " INNER JOIN RES_Order ON RES_Order.orderID = RES_OrderDetail.orderID"
                        + " WHERE chefID is NULL";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    BigDecimal id = rs.getBigDecimal("id");
                    BigDecimal orderID = rs.getBigDecimal("orderID");
                    int itemID = rs.getInt("itemID");
                    Timestamp orderTime = rs.getTimestamp("orderTime");
                    //SimpleDateFormat sdf = new SimpleDateFormat();
                    //System.out.println("time: " + orderTime);
                    String name = rs.getString("name");
                    int price = rs.getInt("price");

                    RES_OrderDetailDTO dto = new RES_OrderDetailDTO();
//                    id, orderID, itemID, chefID, orderTime, name, price
                    dto.setID(id);
                    dto.setOrderID(orderID);
                    dto.setItemID(itemID);
                    dto.setChefID(chefID);
                    dto.setOrderTime(orderTime);
                    dto.setName(name);
                    dto.setPrice(price);

                    if (this.listOrderDetails == null) {
                        this.listOrderDetails = new ArrayList<>();
                    }
                    this.listOrderDetails.add(dto);
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

    public void searchCookingFood(String chefID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM RES_orderDetail INNER JOIN RES_Food"
                        + " ON RES_orderDetail.itemID = RES_Food.itemID"
                        + " INNER JOIN RES_Order ON RES_Order.orderID = RES_OrderDetail.orderID"
                        + " WHERE chefID = ? and timeReady is NULL";
                stm = con.prepareStatement(sql);
                stm.setString(1, chefID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    BigDecimal id = rs.getBigDecimal("id");
                    BigDecimal orderID = rs.getBigDecimal("orderID");
                    int itemID = rs.getInt("itemID");
                    Timestamp orderTime = rs.getTimestamp("orderTime");
                    //SimpleDateFormat sdf = new SimpleDateFormat();
                    //System.out.println("time: " + orderTime);
                    String name = rs.getString("name");
                    int price = rs.getInt("price");

                    RES_OrderDetailDTO dto = new RES_OrderDetailDTO();
//                    id, orderID, itemID, chefID, orderTime, name, price
                    dto.setID(id);
                    dto.setOrderID(orderID);
                    dto.setItemID(itemID);
                    dto.setChefID(chefID);
                    dto.setOrderTime(orderTime);
                    dto.setName(name);
                    dto.setPrice(price);
                    

                    if (this.cookingList == null) {
                        this.cookingList = new ArrayList<>();
                    }
                    this.cookingList.add(dto);
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

    public boolean updateChefId(BigDecimal id, String chefID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "UPDATE RES_OrderDetail SET chefID = ? WHERE id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, chefID);
                stm.setBigDecimal(2, id);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
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

    public boolean updateReadyTime(BigDecimal id, Timestamp timeReady) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "UPDATE RES_OrderDetail SET timeReady = ? WHERE id = ?";
                stm = con.prepareStatement(sql);
                stm.setTimestamp(1, timeReady);
                stm.setBigDecimal(2, id);
                int row = stm.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } catch (Exception e) {
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
    
    public boolean insertOrderDetail(RES_OrderDetailDTO dto) throws NamingException, SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        BigDecimal id;
        
        try {
            con = DBUtilitizes.makeConnection();
            if(con != null){
                String sql = "INSERT INTO RES_OrderDetail(orderID,itemID,chefID,isTaken,timeReady) "
                        + "VALUES(?,?,?,0,?)";
                stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stm.setBigDecimal(1, dto.getOrderID());
                stm.setInt(2, dto.getItemID());
                stm.setNull(3, java.sql.Types.CHAR);
                stm.setNull(4, java.sql.Types.TIMESTAMP);
                int row = stm.executeUpdate();
                
                if (row > 0) {
                    try (ResultSet generatedKeys = stm.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            id = generatedKeys.getBigDecimal(1);
                        } else {
                            throw new SQLException("Creating user failed, no ID obtained.");
                        }
                    }
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
    
}
