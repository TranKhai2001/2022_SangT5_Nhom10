package com.example.the_final_term20220216.functions;

import com.example.the_final_term20220216.dao.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SendMail {
    public static boolean checkExistMail(String email) {
        try {
            Connection con = GetConnection.getCon();
            String sql ="select count(email) from user_account where email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while(rs.next()){
                count = rs.getInt(1);
            }
            if(count>=1){
                rs.close();
                ps.close();
                return true;
            }
            return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        System.out.println(checkExistMail("thuan0373535207@gmail.com"));
    }
}
