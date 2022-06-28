package com.example.the_final_term20220216;

import com.example.the_final_term20220216.bean.Cart;
import com.example.the_final_term20220216.functions.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ThanhToan", value = "/ThanhToan")
public class ThanhToan extends HttpServlet {
    public static double FEE = 0.1;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        UserAccount ua = (UserAccount) s.getAttribute("auth");
        if(ua==null){
            s.setAttribute("previousPage",request.getServletPath());
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        List<Cart> carts = CartFunctions.watch(ua.getId_user());
        List<UserAddress> addresses = Address.watch(ua.getId_user());

        double totalMoney = CartFunctions.totalMoney(ua.getId_user());
        double feeShip = totalMoney*FEE;
        double total = totalMoney + feeShip;

        request.setAttribute("carts",carts);
        request.setAttribute("addresses",addresses);
        request.setAttribute("cart-size",carts.size());

        request.setAttribute("totalMoney",totalMoney);
        request.setAttribute("feeShip",feeShip);
        request.setAttribute("total",total);

        request.getRequestDispatcher("thanhToan.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
