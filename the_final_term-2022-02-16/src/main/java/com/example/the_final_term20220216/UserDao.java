package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Login;
import com.example.the_final_term20220216.functions.UserAccount;

public class UserDao {
    public UserAccount checkLogin(String username,String password){
        UserAccount user = Login.login(username,password);
        if(user==null||!user.getUser_name().equals(username)) return null;
        return user;
    }

}
