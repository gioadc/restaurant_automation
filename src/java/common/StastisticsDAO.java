/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.naming.NamingException;
import sample.RES_OrderDetail.RES_OrderDetailDTO;
import sample.utilis.DBUtilitizes;

/**
 *
 * @author kysik
 */
public class StastisticsDAO {
    private Map<String, Object> data; //include income, total, dateOfWeek[1,...,7]

    public StastisticsDAO() {
        data = new HashMap<>();
    }
    
    public Map getStastisticInTimeRange(Timestamp from, Timestamp to) throws SQLException, NamingException {
        Connection con = null;
        
        try {
            con = DBUtilitizes.makeConnection();
            getCommonStastistic(con, from, to);
            getFoodsByDateInTimeRange(con, from, to);
            return this.data;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
    
    public Map<String, Object> getCommonStastistic(Connection con, Timestamp from, Timestamp to) throws SQLException {
        
        String sql = "SELECT SUM(quantity * price) as income, SUM(quantity) as total FROM RES_Food inner join" +
                "	(SELECT itemID, COUNT(*) as quantity FROM RES_OrderDetail" +
                "		WHERE orderID IN (" +
                "			SELECT orderID FROM RES_Order WHERE orderTime BETWEEN ? AND ?)" +
                "		GROUP BY itemID" +
                "	) as detail" +
                "	on RES_Food.itemID = detail.itemID";
            
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setTimestamp(1, from);
        stmt.setTimestamp(2, to);
        ResultSet rs = stmt.executeQuery();
        Map<String, Object> commonData = new HashMap<>();
        if (rs.next()) {
            commonData.put("income", rs.getBigDecimal("income"));
            commonData.put("total", rs.getBigDecimal("total"));
        }
        
        sql = "SELECT AVG(DATEDIFF(SECOND, orderTime, paidTime)) as turnaroundTime FROM RES_Order"
                    + " WHERE paidTime IS NOT NULL"
                    + " AND orderTime BETWEEN ? AND ?";
        stmt = con.prepareStatement(sql);
        stmt.setTimestamp(1, from);
        stmt.setTimestamp(2, to);
        rs = stmt.executeQuery();
        if (rs.next()) {
            commonData.put("turnaroundTime", rs.getBigDecimal("turnaroundTime"));
        }
        
        sql = "SELECT AVG(DATEDIFF(SECOND, orderTime, timeReady)) as prepareTime" +
                " FROM RES_OrderDetail" +
                " INNER JOIN RES_Order" +
                "   ON RES_Order.orderID = RES_OrderDetail.orderID" +
                " WHERE timeReady IS NOT NULL"
                    + " AND orderTime BETWEEN ? AND ?";
        stmt = con.prepareStatement(sql);
        stmt.setTimestamp(1, from);
        stmt.setTimestamp(2, to);
        rs = stmt.executeQuery();
        if (rs.next()) {
            commonData.put("prepareTime", rs.getBigDecimal("prepareTime"));
        }
        
        rs.close();
        stmt.close();
        
        this.data.putAll(commonData);
        return commonData;
        
    }
    
    public Map<String, Object> getEmployeeStastistic(Connection con, Timestamp from, Timestamp to) throws SQLException {
        
        //Bus boy
        String sql = "SELECT RES_User.userID, name, role, number FROM RES_User" +
                "	INNER JOIN" +
                "		(SELECT userID, COUNT(time) as number FROM RES_Status" +
                "			WHERE status = 0" +
                "			GROUP BY userID" +
                "                     WHERE orderTime BETWEEN ? AND ?" +
                "             ) as detail" +
                "		ON detail.userID = RES_User.userID" +
                "	WHERE RES_User.role = 4" +
                "       ORDER BY number DESC";
            
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setTimestamp(1, from);
        stmt.setTimestamp(2, to);
        ResultSet rs = stmt.executeQuery();
        
        Map<String, Object> userData = new HashMap();
        
        ArrayList<Map<String, Object>> listBusboy = new ArrayList<>();

        while (rs.next()) {
            Map<String, Object> record = new HashMap<>();
            record.put("userID", rs.getString("userID"));
            record.put("name", rs.getString("name"));
            record.put("role", rs.getInt("role"));
            record.put("number", rs.getInt("number"));
            listBusboy.add(record);
        }
        userData.put("busboy", listBusboy);
        
        //Host
        sql = "SELECT RES_User.userID, name, role, number FROM RES_User" +
                "	INNER JOIN" +
                "		(SELECT userID, COUNT(time) as number FROM RES_Status" +
                "			WHERE status = 1" +
                "			GROUP BY userID" +
                "                     WHERE orderTime BETWEEN ? AND ?" +
                "             ) as detail" +
                "		ON detail.userID = RES_User.userID" +
                "	WHERE RES_User.role = 1" +
                "       ORDER BY number DESC";
        
        stmt.setTimestamp(1, from);
        stmt.setTimestamp(2, to);
        rs = stmt.executeQuery();
        
        ArrayList<Map<String, Object>> listHost = new ArrayList<>();

        while (rs.next()) {
            Map<String, Object> record = new HashMap<>();
            record.put("userID", rs.getString("userID"));
            record.put("name", rs.getString("name"));
            record.put("role", rs.getInt("role"));
            record.put("number", rs.getInt("number"));
            listBusboy.add(record);
        }
        userData.put("host", listHost);
        
        //Chef
        sql = "SELECT RES_User.userID, name, role, number FROM RES_User" +
                "	INNER JOIN" +
                "		(SELECT userID, COUNT(time) as number FROM RES_OrderDetail" +
                "			WHERE status = 1" +
                "			GROUP BY userID" +
                "                     WHERE orderTime BETWEEN ? AND ?" +
                "             ) as detail" +
                "		ON detail.userID = RES_User.userID" +
                "	WHERE RES_User.role = 1" +
                "       ORDER BY number DESC";
        
        stmt.setTimestamp(1, from);
        stmt.setTimestamp(2, to);
        rs = stmt.executeQuery();
        
        ArrayList<Map<String, Object>> listChef = new ArrayList<>();

        while (rs.next()) {
            Map<String, Object> record = new HashMap<>();
            record.put("userID", rs.getString("userID"));
            record.put("name", rs.getString("name"));
            record.put("role", rs.getInt("role"));
            record.put("number", rs.getInt("number"));
            listBusboy.add(record);
        }
        userData.put("host", listHost);
        
        
        rs.close();
        stmt.close();
        
        this.data.putAll(userData);
        return userData;
        
    }
    
    public Map<String, Object> getFoodsByDateInTimeRange(Connection con, Timestamp from, Timestamp to) throws SQLException {
        
        String sql = "SELECT RES_Food.itemID, RES_Food.name, RES_Food.price, detail.quantity"
                + "   FROM RES_Food"
                + "   INNER JOIN"
                + "   (SELECT itemID, COUNT(itemID) as quantity FROM RES_OrderDetail"
                + "           WHERE orderID IN ("
                + "                   SELECT orderID FROM RES_Order"
                + "                           WHERE DATEPART(dw,orderTime) = ?"
                + "                             AND orderTime BETWEEN ? AND ?"
                + "           )"
                + "           GROUP BY itemID) as detail"
                + "   ON detail.itemID = RES_Food.itemID"
                + "   ORDER BY detail.quantity DESC";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setTimestamp(2, from);
        stmt.setTimestamp(3, to);
        
        Map<String, Object> dataByDateOfWeek = new HashMap<>();
        ResultSet rs = null;
        for (int i = 1; i < 8; i++) {
            ArrayList<RES_OrderDetailDTO> list = new ArrayList<>();
            stmt.setInt(1, i);
            rs = stmt.executeQuery();
            stmt.setInt(1, i);
            
            while (rs.next()) {
                RES_OrderDetailDTO dto = new RES_OrderDetailDTO();
                dto.setItemID(rs.getInt("itemID"));
                dto.setName(rs.getString("name"));
                dto.setPrice(rs.getInt("price"));
                dto.setQuantity(rs.getInt("quantity"));
                list.add(dto);
            }
            
            if (list.isEmpty()) {
                dataByDateOfWeek.put(i+"", null);
            } else {
                dataByDateOfWeek.put(i+"", list);
            }
        }
        this.data.put("dateOfWeek", dataByDateOfWeek);
        if (rs != null) {
            rs.close();
        }
        stmt.close();
        
        return dataByDateOfWeek;
        
    }
    
    public ArrayList<RES_OrderDetailDTO> getFoodsInTimeRange(Timestamp from, Timestamp to) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            con = DBUtilitizes.makeConnection();
            String sql = "SELECT * FROM RES_Food inner join" +
                "	(SELECT itemID, COUNT(*) as quantity FROM RES_OrderDetail" +
                "		WHERE orderID IN (" +
                "			SELECT orderID FROM RES_Order WHERE orderTime BETWEEN ? AND ?)" +
                "		GROUP BY itemID" +
                "	) as detail" +
                "	on RES_Food.itemID = detail.itemID"
                    + " ORDER BY detail.quantity DESC";
            
            stmt = con.prepareStatement(sql);
            stmt.setTimestamp(1, from);
            stmt.setTimestamp(2, to);
            rs = stmt.executeQuery();
            ArrayList<RES_OrderDetailDTO> list = new ArrayList<>();
            while (rs.next()) {
                RES_OrderDetailDTO dto = new RES_OrderDetailDTO();
                dto.setItemID(rs.getInt("itemID"));
                dto.setName(rs.getString("name"));
                dto.setQuantity(rs.getInt("quantity"));
                dto.setPrice(rs.getInt("price"));
                list.add(dto);
            }
            if (!list.isEmpty()) {
                return list;
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

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
    
}
