package com.example.the_final_term20220216.functions;

import com.example.the_final_term20220216.dao.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
    public static UserAccount login(String username,String password){
        try {
            Connection con = GetConnection.getCon();
            String sql ="SELECT id_user,user_name,email,password FROM user_account" +
                    " WHERE user_name = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,username);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            UserAccount user =null;
            while(rs.next()){
                if(count ==1) return null;
                 user = new UserAccount();
                user.setId_user(rs.getString(1));
                user.setUser_name(rs.getString(2));
                user.setEmail(rs.getString(3));
                if(!rs.getString(2).equals(username)) return null;
                if(!rs.getString(4).equals(password)) return null;
                count++;
            }
            if(count ==0) return null;
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    return null;
    }

    public static void main(String[] args) {
        System.out.println(login("thejavax","jdk7"));
    }
}
