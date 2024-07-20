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
public class Account {
    private int userId;
    private int role;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String status;
    public Account() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Account(int role, String username, String password) {
        this.role = role;
        this.username = username;
        this.password = password;
    }
    
    public Account(int role, int userId, String username, String password, String phone, String email, String status) {
        this.userId = userId;
        this.role = role;
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
