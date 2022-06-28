package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Address;
import com.example.the_final_term20220216.functions.UserAccount;
import com.example.the_final_term20220216.functions.UserAddress;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowDiaChi", value = "/ShowDiaChi")
public class ShowDiaChi extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("auth")==null) {
            session.setAttribute("previousPage", request.getServletPath());
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        List<UserAddress> addresses = Address.watch(ua.getId_user());
        request.setAttribute("addresses",addresses);
        request.getRequestDispatcher("thongTinTaiKhoan/soDiaChi.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
