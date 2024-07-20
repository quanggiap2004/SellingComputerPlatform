/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderLine;

/**
 *
 * @author acer
 */
public class CartDAO extends DBContext{
    public double getTotalMoney(int cartId) {
        String sql = "select * from cart where cart_id=?";
        double total = 0;
        try {
            List<OrderLine> list = new ArrayList();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                total = rs.getDouble("price");
            }
        } catch (Exception e) {
            System.out.println("get total money problem, location CartDAO");
            System.out.println(e);
        }
        return total;
    }
}
