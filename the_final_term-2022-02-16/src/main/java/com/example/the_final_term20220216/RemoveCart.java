package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.CartFunctions;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveCart", value = "/RemoveCart")
public class RemoveCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id_user = request.getParameter("id_user");
        String id_product = request.getParameter("id_product");
        int amount = CartFunctions.getAmount(id_user,id_product);
        boolean result = false;
        int delete = 0;
        if(amount > 0){
            delete = CartFunctions.deleteProduct(id_user,id_product);
            result = true;
        }
        response.getWriter().println(result);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
