package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Comment_vote;
import com.example.the_final_term20220216.functions.Register;
import com.example.the_final_term20220216.functions.UserAccount;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCommentProduct", value = "/AddCommentProduct")
public class AddCommentProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id_product = request.getParameter("id_product");
        if(session.getAttribute("auth")==null) {
            session.setAttribute("previousPage","/ChiTietSanPham?id_product="+id_product );
            response.sendRedirect("dangNhap.jsp");
            return;
        }
        int numStar = Integer.parseInt(request.getParameter("numStar"));
        String comment = request.getParameter("comment");
        UserAccount ua = (UserAccount) session.getAttribute("auth");
        String id_user = ua.getId_user();
        Comment_vote.insert_comment_product(id_product,"null",id_user,numStar,comment);
        response.sendRedirect("ChiTietSanPham?id_product="+id_product);
    }
}
