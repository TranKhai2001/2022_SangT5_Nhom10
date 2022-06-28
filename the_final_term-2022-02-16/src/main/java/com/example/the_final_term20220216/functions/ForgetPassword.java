package com.example.the_final_term20220216.functions;

import com.example.the_final_term20220216.dao.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class ForgetPassword {
    //get email -> return id of it.
    public static String forgetPassword(String email){

        try {
            //check if this email exist?
            Connection con = GetConnection.getCon();
            String sqlCheck = "Select id_user from user_account where email = ?";
            PreparedStatement ps = con.prepareStatement(sqlCheck);
            ps.setString(1,email);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            String id = null;
            while(rs.next()){
                id = rs.getString(1);
                count++;
            }
            if(count ==1)
            return id;
            else{
                return null;
            }
            //auto generate new password.
            //change first and get to user!
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    //auto generate password when having and id.
    public static boolean generateAndChangeOldPass(String id){
        Random r = new Random();
        String autoPass = "123xyz";
        StringBuilder sb = new StringBuilder(autoPass);
        for (int i = 0; i < r.nextInt(1000); i++) {
            char c = (char)(r.nextInt(26) + 'a');
            sb.setCharAt(r.nextInt(sb.length()),c);
        } // prints 50 random characters from autoPass
        return ChangePassword.changePassById(id,new String(sb));

    }
    public static void main(String[] args) {
        String id = forgetPassword("thuan0373535@gmail.com");
        System.out.println(id);
        boolean isChange = generateAndChangeOldPass(id);
        System.out.println(isChange);
//        generateAndChangeOldPass("UA0005");
    }
}
