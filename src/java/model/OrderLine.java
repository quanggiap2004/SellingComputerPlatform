/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dal.ProductDAO;

/**
 *
 * @author acer
 */
public class OrderLine {
    private int or_Id;
    private int prod_Id;
    private int quantity;
    private double price;
    private int cart_id;

    public OrderLine() {
    }

    @Override
    public String toString() {
        return "OrderLine{" + "or_Id=" + or_Id + ", prod_Id=" + prod_Id + ", quantity=" + quantity + ", price=" + price + ", cart_id=" + cart_id + '}';
    }
    
    public OrderLine(int or_Id, int prod_Id, int quantity, double price, int cart_id) {
        this.or_Id = or_Id;
        this.prod_Id = prod_Id;
        this.quantity = quantity;
        this.price = price;
        this.cart_id = cart_id;
    }

    public int getOr_Id() {
        return or_Id;
    }

    public void setOr_Id(int or_Id) {
        this.or_Id = or_Id;
    }
    public Product getProduct() {
        ProductDAO prodDAO = new ProductDAO();
        Product prod = prodDAO.getProductById(this.prod_Id);
        return prod;
    }
    public int getProd_Id() {
        return prod_Id;
    }

    public void setProd_Id(int prod_Id) {
        this.prod_Id = prod_Id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return getProduct().getDisprice()*quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }
    
}
