/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_User;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;
import sample.utilis.DBUtilitizes;

/**
 *
 * @author kysik
 */
public class RES_UserDAO implements Serializable {
    private String name;
    private int role;
    public boolean checkLogin(String username, String password) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        boolean result = false;
        
        try {
            con = DBUtilitizes.makeConnection();
            String sql = "SELECT * FROM RES_User WHERE userID = ? and password = ?";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            if (rs.next()) {
                result = true;
                this.role = rs.getInt("role");
                this.name = rs.getString("name");
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
        return result;
    }

    public String getName() {
        return name;
    }

    public int getRole() {
        return role;
    }

    public ArrayList<RES_UserDTO> getEmployee() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM RES_User";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                ArrayList<RES_UserDTO> listEmployees = new ArrayList<>();
                while (rs.next()) {
                    String userID = rs.getString("userID");
                    String password = rs.getString("password");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    int role = rs.getInt("role");
                    RES_UserDTO dto = new RES_UserDTO(userID, password, name, phone, role);
                    listEmployees.add(dto);
                }
                return listEmployees;
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

    public boolean deleteEmployee(String userID) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "DELETE FROM RES_User WHERE userID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);

                int row = stm.executeUpdate();
                if (row > 0) {
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

    public boolean updateUserDetail(String userID, String password, String name, String phone) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "UPDATE RES_User SET password = ?, name = ?, phone = ? WHERE userID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, name);
                stm.setString(3, phone);
                stm.setString(4, userID);
                int row = stm.executeUpdate();
                if (row > 0) {
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

    public boolean createNewEmployee(String userID, String password, String name, String phone, int role)
            throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "Insert into RES_User VALUES(?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, password);
                stm.setString(3, name);
                stm.setString(4, phone);
                stm.setInt(5, role);
                int row = stm.executeUpdate();
                if (row > 0) {
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
