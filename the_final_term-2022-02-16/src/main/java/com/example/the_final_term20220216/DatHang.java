package com.example.the_final_term20220216;

import com.example.the_final_term20220216.functions.Payment;
import com.example.the_final_term20220216.functions.UserAccount;
import com.example.the_final_term20220216.functions.UserAddress;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
    //runme
@WebServlet(name = "DatHang", value = "/DatHang")
public class DatHang extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username= request.getParameter("firstname");
        String phone_number = request.getParameter("my_phone_number");
        String city_province = request.getParameter("city_province");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String house_address = request.getParameter("house_address");
        String extra_infor = request.getParameter("extra-infor");
        double totalMoneyWithFee = Double.parseDouble(request.getParameter("totalMoneyWithFee"));
        UserAddress ua = new UserAddress();
        ua.setUser_name(username
        );
        ua.setPhone_number(phone_number);
        ua.setCity_province(city_province);
        ua.setDistrict(district);
        ua.setWard(ward);ua.setHouse_address(house_address);
        String line = ua.convertAddressToString();
        HttpSession s = request.getSession();
        UserAccount xx = (UserAccount) s.getAttribute("auth");
        String x = xx.getId_user();
        Payment.payment(x,line,"chưa thanh toán",totalMoneyWithFee,phone_number);
        response.sendRedirect("ListBill");
    }
}
