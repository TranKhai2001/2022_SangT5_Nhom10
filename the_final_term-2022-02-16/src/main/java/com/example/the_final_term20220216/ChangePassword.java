package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.UserAccount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "ChangePassword", value = "/ChangePassword")
public class ChangePassword extends HttpServlet {
    //this is change password
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("password");
        HttpSession session = request.getSession(false);
        if(session.getAttribute("auth")==null){
            session.setAttribute("previousPage", request.getServletPath());
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        boolean state= false;
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        System.out.println("s: "+s+", iduser = "+ua.getId_user()+", username = "+ua.getUser_name());
        state = com.example.the_final_term20220216.functions.ChangePassword.changePassById(ua.getId_user(),s);
        response.getWriter().println(state);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Enumeration<String> arr = request.getParameterNames();
        System.out.println("--------------");
        while(arr.hasMoreElements()){
            System.out.println(arr.nextElement());
        }
        String s = request.getParameter("password");
        HttpSession session = request.getSession(false);
        if(session.getAttribute("auth")==null){
            session.setAttribute("previousPage", request.getServletPath());
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        boolean state= false;
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        System.out.println("in do post s: "+s+", iduser = "+ua.getId_user()+", username = "+ua.getUser_name());
        state = com.example.the_final_term20220216.functions.ChangePassword.changePassById(ua.getId_user(),s);
        response.getWriter().println(state);
    }
}
