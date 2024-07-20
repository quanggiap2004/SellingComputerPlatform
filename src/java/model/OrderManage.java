/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dal.AccountDAO;

/**
 *
 * @author acer
 */
public class OrderManage {
    private int order_id;
    private int cart_id;
    private int ac_id;
    private String createdDate;
    private String status;
    private double totalAmount;
    private String address;
    private String phone;

    public OrderManage() {
    }
    public int getOrder_id() {
        return order_id;
    }
    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public OrderManage(int order_id, int cart_id, int ac_id, String createdDate, String status, double totalAmount, String address, String phone) {
        this.order_id = order_id;
        this.cart_id = cart_id;
        this.ac_id = ac_id;
        this.createdDate = createdDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.address = address;
        this.phone = phone;
    }
    public OrderManage(int cart_id, int ac_id, String createdDate, String status, double totalAmount, String address, String phone) {
        this.cart_id = cart_id;
        this.ac_id = ac_id;
        this.createdDate = createdDate;
        this.status = status;
        this.totalAmount = totalAmount;
        this.address = address;
        this.phone = phone;
    }
    
    public String getUserNameByCartId() {
        AccountDAO accDAO = new AccountDAO();
        Account acc = accDAO.getAccountByCartId(cart_id);
        return acc.getUsername();
    }
    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getAc_id() {
        return ac_id;
    }

    public void setAc_id(int ac_id) {
        this.ac_id = ac_id;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
}
