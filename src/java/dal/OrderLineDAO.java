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
public class OrderLineDAO extends DBContext {

    public List<OrderLine> getListByCartId(int cartId) {
        String sql = "select * from Order_line where cart_id=?";
        List<OrderLine> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderLine or = new OrderLine(rs.getInt("or_id"), rs.getInt("prod_id"), rs.getInt("order_quantity"), rs.getDouble("item_price"),
                        rs.getInt("cart_id"));
//                        public OrderLine(int or_Id, int prod_Id, int quantity, int price, int cart_id)
                list.add(or);
            }
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("getListByCartId problems, location OrderLineDAO");
        }
        return list;
    }

    public boolean orderLineInsert(String quantity, int id, int cartId) {
        String sql = "INSERT INTO [dbo].[Order_line]\n"
                + "           ([prod_id]\n"
                + "           ,[order_quantity]\n"
                + "           ,[item_price]\n"
                + "           ,[cart_id])\n"
                + "     VALUES(\n"
                + "           ?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            int trueQuantity = Integer.parseInt(quantity);
            boolean updateCheck = false;
            for (OrderLine item : getListByCartId(cartId)) {
                if (id == item.getProd_Id()) {
                    updateCheck = orderLineSelectUpdate(id, trueQuantity,cartId);
                    break;
                }
            }
            if (updateCheck) {  //kiem tra xem co OrderLine co duoc update khong
                return true;
            } else {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, id);
                ProductDAO prodDAO = new ProductDAO();
                double productPrice = prodDAO.getProductById(id).getDisprice();
                st.setInt(2, trueQuantity);
                st.setDouble(3, trueQuantity * productPrice);
                st.setInt(4, cartId);
                boolean rs = st.execute();
                if (rs == true) {
                    System.out.println("insert successful");
                }
            }
        } catch (Exception e) {
            System.out.println("orderLineInsert Problems, location at OrderLineDAO");
            System.out.println(e);
        }
        return false;
    }
    
    public boolean orderLineSelectUpdate(int id, int quantity, int cart_id) { //select thì nó sẽ tăng lên nên là phải + quantity
        String sql="update Order_line set order_quantity= order_quantity+?, item_price= item_price+? "
                + "where prod_id=? and cart_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ProductDAO prodDAO = new ProductDAO();
            double productPrice = prodDAO.getProductById(id).getDisprice();
            
            st.setInt(1, quantity);
            st.setDouble(2, quantity*productPrice);
            st.setInt(3, id);
            st.setInt(4, cart_id);
            st.execute();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Select Update Problems at OrderLineDAO");
        }
        return false;
    }
    
    public boolean orderLineCartUpdate(int id, int quantity, int prod_id) {
        String sql="update Order_line set order_quantity= ?, item_price= ? where or_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ProductDAO prodDAO = new ProductDAO();
            double productPrice = prodDAO.getProductById(prod_id).getDisprice();
            st.setInt(1, quantity);
            st.setDouble(2, quantity*productPrice);
            st.setInt(3, id);
            boolean rs = st.execute();
            return rs;
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Update cart problems");
        }
        return false;
    }
    
    public List<OrderLine> getAll(int cartId) {
        String sql = "select * from order_line where cart_id=?";
        try {
            List<OrderLine> list = new ArrayList();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartId);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                OrderLine order = new OrderLine(rs.getInt("or_id"), rs.getInt("prod_id"), 
                        rs.getInt("order_quantity"), rs.getDouble("item_price"), cartId);
                list.add(order);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public int deleteById(int or_id) {
        int rows_affected = 0;
        String sql = "delete from order_line where or_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, or_id);
            rows_affected = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("Delete's database problems");
        }
        return rows_affected;
    }
    public int deleteByCartId(int cart_id) {
        int rows_affected = 0;
        String sql = "delete from order_line where cart_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cart_id);
            rows_affected = st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("deleteByCartId problems, location OrderLineDAO");
        }
        return rows_affected;
    }
    
}
