/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.RES_Food;

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
 * @author KIETTTSE62520
 */
public class RES_FoodDAO implements Serializable {

    public ArrayList<RES_FoodDTO> getFoods() throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtilitizes.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM RES_Food";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                ArrayList<RES_FoodDTO> listFoods = new ArrayList<>();
                while (rs.next()) {
                    int itemID = rs.getInt("itemID");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");
                    RES_FoodDTO dto = new RES_FoodDTO(itemID, name, price);
                    listFoods.add(dto);
                }
                return listFoods;
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
