package com.example.the_final_term20220216.bean;

import com.example.the_final_term20220216.dao.Product;
import com.example.the_final_term20220216.functions.UserAccount;

public class Cart {
    UserAccount user;
    Product product;
    int amount;

    public UserAccount getUser() {
        return user;
    }

    public void setUser(UserAccount user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
