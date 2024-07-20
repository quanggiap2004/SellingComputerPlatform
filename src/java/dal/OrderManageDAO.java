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
import model.OrderManage;
import model.Product;

/**
 *
 * @author acer
 */
public class OrderManageDAO extends DBContext{
    public int insertOrder(String phone, String address, double total, String date, int acId, int cartId) {
        int rowsAffected = 0;
        String sql = "insert into Order_manage(cart_id,ac_id,created_date, status, total_amount, address, phone) "
                + "values(?,?,?,'Delivering',?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            st.setInt(2, acId);
            st.setString(3, date);
            st.setDouble(4, total);
            st.setString(5, address);
            st.setString(6, phone);
            rowsAffected = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Insert Order problem, location OrderManageDAO");
            System.out.println(e);
        }
        return rowsAffected;
    }
    
    public List<OrderManage> getAll() {
        List<OrderManage> list = new ArrayList();
        String sql = "select * from Order_manage";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                OrderManage OrderManage_line = new OrderManage(rs.getInt("order_id"),
                        rs.getInt("cart_Id"), rs.getInt("ac_id"), rs.getString("created_date"),
                        rs.getString("status"),rs.getInt("total_amount"),rs.getString("address"), rs.getString("phone"));
                list.add(OrderManage_line);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public int deleteOrderById(int id) {
        int rowsAffected = 0;
        String sql = "delete from order_manage where order_id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            rowsAffected = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("delete Order problem, location OrderManageDAO");
            System.out.println(e);
        }
        return rowsAffected;
    }
}
