package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.UserAccount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DangNhap", value = "/DangNhap")
public class DangNhap extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        System.out.println("username "+username+", pass: "+pass);
        UserAccount ua = new UserDao().checkLogin(username,pass);
        request.setAttribute("userInfor",ua);
        HttpSession s = request.getSession();
        System.out.println("user account :"+ua.getUser_name());
        s.setAttribute("auth",ua);
        request.getRequestDispatcher("n.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        UserAccount ua = new UserDao().checkLogin(username,pass);
        if(ua==null){
            String error = "sai thông tin đăng nhập."

                    ;request.setAttribute("error",error);request.getRequestDispatcher("dangNhap.jsp").forward(request,response);
            return;
        }
        request.setAttribute("userInfor",ua);
        HttpSession s = request.getSession();
        s.setAttribute("auth",ua);
        String x = (String) s.getAttribute("previousPage");
        if(x==null){
            x = "TrangChu";
        }else{
            x = x.substring(1,x.length());
        }
        response.sendRedirect(x);
    }
}
