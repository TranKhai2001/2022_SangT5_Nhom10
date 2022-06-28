package com.example.the_final_term20220216;

import com.example.the_final_term20220216.dao.Product;
import com.example.the_final_term20220216.functions.ProductClassification;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CacLoaiSanPham", value = "/CacLoaiSanPham")
public class CacLoaiSanPham extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        List<Product> productsHot = new ArrayList<>();
        List<Product> productsKhuyenMai= new ArrayList<>();

        int limit = 10;
        if(type.equals("traicay")){
            productsHot = ProductClassification.productTypeTraiCayHot(limit);
            productsKhuyenMai = ProductClassification.productTypeTraiCayKhuyenMai(limit);
        }
        else{
            productsKhuyenMai = ProductClassification.productTypeRauCuKhuyenMai(limit);
            productsHot = ProductClassification.productTypeRauCuHot(limit);

        }
        for (Product p :
                productsHot) {
            p.loadComment();
        }
        for (Product p :
                productsKhuyenMai) {
            p.loadComment();
        }
        request.setAttribute("productsHot",productsHot);
        request.setAttribute("productsKhuyenMai",productsKhuyenMai);
        request.setAttribute("type",type);
        System.out.println("[HOT] "+productsHot.size());
        System.out.println("[KHUYEN MAI] "+productsKhuyenMai.size());

        request.getRequestDispatcher("cacLoaiSanPham.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
