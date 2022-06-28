package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Comment_vote;
import com.example.the_final_term20220216.functions.UserAccount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCommentBlog", value = "/AddCommentBlog")
public class AddCommentBlog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id_blog = request.getParameter("id_blog");
        if(session.getAttribute("auth")==null) {
            session.setAttribute("previousPage","/ChiTietBlog?id_blog="+id_blog );
            response.sendRedirect("dangNhap.jsp");
            return;
        }
//        int numStar = Integer.parseInt(request.getParameter("numStar"));
//        String comment = request.getParameter("comment");
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        String father_id_blog = request.getParameter("father_id_blog");
        String comment_content = request.getParameter("message");
        String id_user = ua.getUser_name();
        Comment_vote.insert_comment_blog(id_blog, father_id_blog,id_user,comment_content);
        response.sendRedirect("ChiTietBlog?id_blog="+id_blog);
    }
}
