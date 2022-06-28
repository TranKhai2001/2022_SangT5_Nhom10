package com.example.the_final_term20220216;

import com.example.the_final_term20220216.bean.Cart;
import com.example.the_final_term20220216.functions.CartFunctions;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowCart", value = "/ShowCart")
public class ShowCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id_user = request.getParameter("id_user");
        List<Cart> carts = CartFunctions.watch(id_user);
        String gson = new Gson().toJson(carts);
        System.out.println(gson);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
