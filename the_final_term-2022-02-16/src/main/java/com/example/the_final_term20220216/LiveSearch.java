package com.example.the_final_term20220216;

import com.example.the_final_term20220216.dao.Product;
import com.example.the_final_term20220216.functions.Search;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LiveSearch", value = "/LiveSearch")
public class LiveSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String s = request.getParameter("q");
        List<Product> products = Search.searchByName(s);
        String gson = new Gson().toJson(products);
        response.getWriter().println(gson);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
