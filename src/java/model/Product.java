/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author acer
 */
public class Product {

    private int prod_id;
    private int cat_id;
    private String prod_name;
    private int quantity;
    private double price;
    private double disprice;
    private String thumbnail;
    private String description;
    private int sold;

    public Product() {
    }

    @Override
    public String toString() {
        return "Product{" + "prod_id=" + prod_id + ", cat_id=" + cat_id + ", prod_name=" + prod_name + ", quantity=" + quantity + ", price=" + price + ", disprice=" + disprice + ", thumbnail=" + thumbnail + ", description=" + description + '}';
    }

    public Product(int prod_id, String prod_name, double price, double disprice, String thumbnail) {
        this.price = price;
        this.prod_id = prod_id;
        this.prod_name = prod_name;
        this.disprice = disprice;
        this.thumbnail = thumbnail;
    }

    public Product(int prod_id, int cat_id, String prod_name, int quantity,
            double price, double disprice, String thumbnail, String description, int sold) {
        this.prod_id = prod_id;
        this.cat_id = cat_id;
        this.prod_name = prod_name;
        this.quantity = quantity;
        this.price = price;
        this.disprice = disprice;
        this.thumbnail = thumbnail;
        this.description = description;
        this.sold = sold;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getProd_id() {
        return prod_id;
    }

    public void setProd_id(int prod_id) {
        this.prod_id = prod_id;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCart_id(int cart_id) {
        this.cat_id = cart_id;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
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

    public double getDisprice() {
        return disprice;
    }

    public void setDisprice(double disprice) {
        this.disprice = disprice;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
