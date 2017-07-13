/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.db;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import sample.utilis.DBUtilitizes;

/**
 *
 * @author kysik
 */
public class UserDAO implements Serializable {
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
    
}
