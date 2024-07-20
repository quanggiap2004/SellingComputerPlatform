/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class Cart {
    private List OrderLine;
    private int quantity;
    private double price;

    public Cart() {
        OrderLine = new ArrayList();
    }

    public Cart(List OrderLine, int quantity, double price) {
        this.OrderLine = OrderLine;
        this.quantity = quantity;
        this.price = price;
    }

    public List getOrderLine() {
        return OrderLine;
    }

    public void setOrderLine(List OrderLine) {
        this.OrderLine = OrderLine;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
