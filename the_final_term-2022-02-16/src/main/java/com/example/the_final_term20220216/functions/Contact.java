package com.example.the_final_term20220216.functions;

import com.example.the_final_term20220216.dao.GetConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Contact {
    public static void addContact(String email,String name,String phone_name,String content) {
        try {
            Connection con = GetConnection.getCon();
            String nextID = Register.nextID(con, "contact", "id_contact", "CT");
            String sql = "insert into contact values (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, nextID);
            ps.setString(2, email);
            ps.setString(3, name
            );
            ps.setString(4, phone_name);
            ps.setString(5, content);
            int clar = ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
