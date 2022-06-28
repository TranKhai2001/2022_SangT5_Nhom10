package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Blog;
import com.example.the_final_term20220216.functions.Search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ChinhSachGiaoHang", value = "/ChinhSachGiaoHang")
public class ChinhSachGiaoHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Blog> relateBlogs = Search.searchBlogByNumber(10);
        for (Blog b:relateBlogs
        ) {
            b.loadComment();
        }
        request.setAttribute("relateBlogs",relateBlogs);
        request.getRequestDispatcher("chinhSachGiaoHang.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
