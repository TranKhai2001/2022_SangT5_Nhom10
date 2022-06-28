package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Register;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Register", value = "/Register")
public class Register1 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("name");
        String pass = request.getParameter("pass");
        String email  =request.getParameter("email");
        boolean c = Register.registerAutoID_user(username,email,pass);
        response.getWriter().println(c);
    }
}
