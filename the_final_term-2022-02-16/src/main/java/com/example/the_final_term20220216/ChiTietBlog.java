package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Blog;
import com.example.the_final_term20220216.functions.BlogFunction;
import com.example.the_final_term20220216.functions.Search;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ChiTietBlog", value = "/ChiTietBlog")
public class ChiTietBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Blog blog = BlogFunction.searchBlogById(request.getParameter("id_blog"));
        blog.loadComment();
        System.out.println("[ROOT1] "+blog.getCommentRootBlogs().size());
        BlogFunction.arrangeToDataAndItsChildren_fixBugOnly(blog.getCommentRootBlogs());
        System.out.println("[ROOT2] "+blog.getCommentRootBlogs().size());

        List<Blog> relateBlogs = Search.searchBlogByNumber(10);
        for (Blog b:relateBlogs
             ) {
            b.loadComment();
        }
        request.setAttribute("blog",blog);
        request.setAttribute("relateBlogs",relateBlogs);
        List<Integer> numberCommentsWithRelateBlogs = new ArrayList<>(relateBlogs.size());
        for (int i = 0;i<relateBlogs.size();i++){
            numberCommentsWithRelateBlogs.add(relateBlogs.get(i).getNumberComment());
        }
        request.setAttribute("numberCommentsWithRelateBlogs",numberCommentsWithRelateBlogs);

        request.getRequestDispatcher("chitietBlog.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
