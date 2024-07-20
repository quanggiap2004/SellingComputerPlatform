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
public class Category {
    private int cat_id;
    private String cat_name;

    public Category() {
    }

    @Override
    public String toString() {
        return "Category{" + "cat_id=" + cat_id + ", cat_name=" + cat_name + '}';
    }

    public Category(int cat_id, String cat_name) {
        this.cat_id = cat_id;
        this.cat_name = cat_name;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public String getCat_name() {
        return cat_name;
    }

    public void setCat_name(String cat_name) {
        this.cat_name = cat_name;
    }
    
}
