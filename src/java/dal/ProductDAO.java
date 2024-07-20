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
import model.Category;
import model.Product;

/**
 *
 * @author acer
 */
public class ProductDAO extends DBContext{
    public List<Product> getBestSellerProduct() {
        List<Product> list = new ArrayList();
        String sql = "exec GetTopSellingProducts";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
//public Product(int prod_id, String prod_name, double disprice)
            while(rs.next()) {
                Product prod = new Product(rs.getInt("prod_id"),rs.getInt("cat_id"),rs.getString("prod_name"), rs.getInt("quantity"),
                        rs.getDouble("price"),rs.getDouble("disprice"), rs.getString("thumbnail"),rs.getString("description"),rs.getInt("sold"));
                list.add(prod);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Product> getAll() {
        List<Product> list = new ArrayList();
        String sql = "select * from Product where forSale=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Product prod = new Product(rs.getInt("prod_id"),rs.getInt("cat_id"),rs.getString("prod_name"), rs.getInt("quantity"),
                        rs.getDouble("price"),rs.getDouble("disprice"), rs.getString("thumbnail"),rs.getString("description"),rs.getInt("sold"));
                list.add(prod);
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public Product getProductById(int id) {
        String sql = "select * from Product where prod_id =? and forSale=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
//                public Product(int prod_id, int cart_id, String prod_name, int quantity, 
//            double price, double disprice, String thumbnail, String description)
                Product prod = new Product(rs.getInt("prod_id"),rs.getInt("cat_id"),rs.getString("prod_name"), rs.getInt("quantity"),
                        rs.getDouble("price"),rs.getDouble("disprice"), rs.getString("thumbnail"),rs.getString("description"),rs.getInt("sold"));
                return prod;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
     public List<Product> getAllByCategory(String cat_id){
        List<Product> list = new ArrayList();
        String sql = "select * from Product where cat_id=? and forSale=1";
        System.out.println("here");
        try {
            int id= Integer.parseInt(cat_id);
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Product prod = new Product(rs.getInt("prod_id"),rs.getInt("cat_id"),rs.getString("prod_name"), rs.getInt("quantity"),
                        rs.getDouble("price"),rs.getDouble("disprice"), rs.getString("thumbnail"),rs.getString("description"),rs.getInt("sold"));
                list.add(prod);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Get all by category problems, location ProductDAO");
            System.out.println(e);
        }
        return null;
    }
    public List<Product> searchByName(String name){
        List<Product> list = new ArrayList();
        String sql = "select * from Product where prod_name like '%" + name +"%' and forSale=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Product prod = new Product(rs.getInt("prod_id"),rs.getInt("cat_id"),rs.getString("prod_name"), rs.getInt("quantity"),
                        rs.getDouble("price"),rs.getDouble("disprice"), rs.getString("thumbnail"),rs.getString("description"),rs.getInt("sold"));
                list.add(prod);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Search by name problems, location ProductDAO");
            System.out.println(e);
        }
        return null;
    }
    
//    String prod_name = request.getParameter("prod_name");
//                int quantity = Integer.parseInt(request.getParameter("quantity"));
//                double price = Double.parseDouble(request.getParameter("price"));
//                double disprice = Double.parseDouble(request.getParameter("disprice"));
//                int sold = Integer.parseInt(request.getParameter("sold"));
    public int updateProduct(int prod_id,String prod_name, int quantity, double price, double disprice, int sold) {
        int rowsAffected = 0;
        String sql = "update product set prod_name=?, quantity=?, price=?, disprice=?, sold=? where prod_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, prod_name);
            st.setInt(2, quantity);
            st.setDouble(3, price);
            st.setDouble(4, disprice);
            st.setInt(5, sold);
            st.setInt(6, prod_id);
            rowsAffected = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update product problems");
            System.out.println(e);
        }
        return rowsAffected;
    }
    
    public boolean deleteProdById(int id) {
        String sql="update Product set forSale = 0 where prod_id=" +id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.execute();
            return true;
        } catch (Exception e) {
            System.out.println("deleteProdById problems location ProductDAO");
            System.out.println(e);
        }
        return false;
    }
}
