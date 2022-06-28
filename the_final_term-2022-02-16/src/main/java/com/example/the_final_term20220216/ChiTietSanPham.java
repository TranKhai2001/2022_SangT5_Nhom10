package com.example.the_final_term20220216;

import com.example.the_final_term20220216.dao.Product;
import com.example.the_final_term20220216.functions.BlogFunction;
import com.example.the_final_term20220216.functions.ProductFunction;
import com.example.the_final_term20220216.functions.Search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ChiTietSanPham", value = "/ChiTietSanPham")
public class ChiTietSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("run to chi tiet san pham,id: "+request.getParameter("id_product"));
        Product p = Search.searchProductById(request.getParameter("id_product"));
        p.loadComment();
        request.setAttribute("product",p);
        //set set number attributes
        request.setAttribute("numberstarsArray", ProductFunction.returnNumberStar(p.getRawCommentProducts()));
        //relate products:
        request.setAttribute("relateProducts",ProductFunction.searchProductByTypeAndQuantity(p.getProduct_type(),5));
        request.getRequestDispatcher("chiTietSanPham.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
