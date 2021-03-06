package com.example.the_final_term20220216.functions;

import com.example.the_final_term20220216.dao.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ChangePassword {
    public static boolean changePassById(String id,String newPassword){
        try {
            Connection con = GetConnection.getCon();
            String sql = "UPDATE user_account set password=? where id_user = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,newPassword);
            ps.setString(2,id);
            int result = ps.executeUpdate();
            if(result ==1){
                return true;
            }else{
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static boolean changePassByEmail(String email,String newPassword){
        try {
            Connection con = GetConnection.getCon();
            String sql = "UPDATE user_account set password=? where email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,newPassword);
            ps.setString(2,email);
            int result = ps.executeUpdate();
            if(result >=1){
                return true;
            }else{
                return false;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void main(String[] args) {
        System.out.println(changePassByEmail("thuan0373535207@gmail.com","hey javax"));
    }
}
