package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Address;
import com.example.the_final_term20220216.functions.UserAccount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteAddress", value = "/DeleteAddress")
public class DeleteAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("auth")==null) {
            session.setAttribute("previousPage", request.getServletPath());
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        String id_address = request.getParameter("id_address");
        String id_user = ua.getId_user();
        System.out.println("run hi"+id_user+", "+id_address);
        Address.removeAddress(id_user,id_address);
        System.out.println("finish remove");
        response.sendRedirect("ShowDiaChi");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
