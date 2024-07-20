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
import model.Account;
import model.Cart;

/**
 *
 * @author acer
 */
public class AccountDAO extends DBContext {

    public Account check(String username, String pass) {
        String sql = "select *\n"
                + "from Account\n"
                + "where password = ? and username = ? and status='normal'";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, username);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                Account ad = new Account(rs.getInt("role"), rs.getInt("ac_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("phone"), rs.getString("email"), rs.getString("status"));
                return ad;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public int getCartIdByUserId(int id) {
        String sql = "select * from Cart where ac_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("cart_id");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }

    public int createAccount(String name, String password, String email, String phone) {
        int rowsAffected = 0;
        String sql = "insert into Account(role,username,password,phone,email,status)"
                + "values(0,?,?,?,?,'normal')";
        boolean usernameCheck = true;
        List<String> userList = getAllUsername();
        for (String u : userList) {
            if (name.equals(u)) {
                usernameCheck = false;
            }
        }
        if (usernameCheck) {
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, name);
                st.setString(2, password);
                st.setString(3, phone);
                st.setString(4, email);
                rowsAffected = st.executeUpdate();
            } catch (Exception e) {
                System.out.println("Create account problem, location AccountDAO");
                System.out.println(e);
            }
        }

        return rowsAffected;
    }

    public List<String> getAllUsername() {
        List<String> userList = new ArrayList();
        String sql = "select * from Account ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                userList.add(rs.getString("username"));
            }
            return userList;
        } catch (Exception e) {
            System.out.println(e);
            System.out.println("get all username problems, location AccountDAO");
        }
        return null;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList();
        String sql = "select * from Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account ad = new Account(rs.getInt("role"), rs.getInt("ac_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("phone"), rs.getString("email"), rs.getString("status"));
                list.add(ad);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Get all Account problem");
            System.out.println(e);
        }
        return null;
    }

    public int updateAccountById(String username, String password, String phone, String email, String status, int role, int userId) {

        int rowsAffected = 0;
        String sql = "update Account set role=?, username=?, password=?, phone=?, email=?, status=? where ac_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, role);
            st.setString(2, username);
            st.setString(3, password);
            st.setString(4, phone);
            st.setString(5, email);
            st.setString(6, status);
            st.setInt(7, userId);
            rowsAffected = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Update Account problems");
            System.out.println(e);
        }
        return rowsAffected;
    }

    public int deleteAccById(int id) {
        int rowsAffected = 0;
        String sql = "update Account set status='locked' where ac_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            rowsAffected = st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Delete Account problems");
            System.out.println(e);
        }
        return rowsAffected;
    }

    public Account getAccountByCartId(int id) {
        System.out.println(id);
        String sql = "SELECT *\n"
                + "FROM Account\n"
                + "JOIN Cart ON Account.ac_id = Cart.ac_id\n"
                + "WHERE Cart.cart_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account ad = new Account(rs.getInt("role"), rs.getInt("ac_id"), rs.getString("username"), rs.getString("password"),
                        rs.getString("phone"), rs.getString("email"), rs.getString("status"));
                return ad;
            }
        } catch (Exception e) {
            System.out.println("get account by cart_id problem location AccountDAO");
            System.out.println(e);
        }
        return null;
    }
}
