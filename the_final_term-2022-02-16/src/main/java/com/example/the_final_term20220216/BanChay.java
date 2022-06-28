package com.example.the_final_term20220216;

import com.example.the_final_term20220216.dao.Product;
import com.example.the_final_term20220216.functions.ProductClassification;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BanChay", value = "/BanChay")
public class BanChay extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = ProductClassification.productHot(10);
        for (Product p :
                products) {
            p.loadComment();
        }
        System.out.println("[SIZE]"+ products.size());
        request.setAttribute("productHot",products);
        request.getRequestDispatcher("banChay.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
