package com.example.the_final_term20220216.functions;

import com.example.the_final_term20220216.bean.Cart;
import com.example.the_final_term20220216.dao.GetConnection;
import com.example.the_final_term20220216.dao.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartFunctions {
    public static List<Cart> watch(String id_user){
        try {
            Connection con = GetConnection.getCon();
            String sql = "select * from cart join product on cart.id_product = product.id_product join user_account on user_account.id_user = cart.id_user where cart.id_user=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,id_user);
            List<Cart> user_products = new ArrayList<>();
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Product p = new Product();
                UserAccount user = new UserAccount();
                Cart cart = new Cart();
                p.setId_product(rs.getString("id_product"));
                p.setProduct_name(rs.getString("product_name"));
                p.setProduct_type(rs.getString("product_type"));
                p.setAmount_bought(rs.getInt("amount_bought"));
                p.setAmount_imported(rs.getInt("amount_imported"));
                p.setPercent_discount(rs.getInt("percent_discount"));
                p.setPrice(rs.getDouble("price"));
                p.setShort_description(rs.getString("short_discription"));
                p.setDescription(rs.getString("discription"));
                p.setImg_url(rs.getString("img_url"));
                user.setId_user(id_user);
                user.setUser_name(rs.getString("user_name"));
                user.setEmail(rs.getString("email"));
//                user.setPassword(rs.getString("password"));
                cart.setUser(user);
                cart.setProduct(p);
                cart.setAmount(rs.getInt("c_amount_bought"));
                user_products.add(cart);
            }
            rs.close();
            return user_products;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static boolean checkDataExist(String id_template,String id,String table_name){
        try {
            Connection con = GetConnection.getCon();
            String sql = "select * from "+table_name+"  where "+id_template+" = ?";
            PreparedStatement ps  = con.prepareStatement(sql);
            ps.setString(1,id);
            ResultSet rs = ps.executeQuery();
            boolean exist = false;
            while(rs.next()){
                if(rs.getString(id_template).equals(id)){
                    exist = true;break;}
            }
            rs.close();
            return exist;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
    public static void check_amount_in_warehouse(Connection con,String id_product,int amount) throws SQLException {
        int leftAmount =0;
        String getAmount = "select amount_bought,amount_imported from product where id_product = ?";
        PreparedStatement getAmountps= con.prepareStatement(getAmount);
        getAmountps.setString(1,id_product);
        ResultSet getamountrs = getAmountps.executeQuery();
        getamountrs.next();
        int amount_bought = getamountrs.getInt(1);
        int amount_imported = getamountrs.getInt(2);
        if(!((amount_bought+amount)<=amount_imported)){
            int left_amount = amount_imported-amount_bought;
            throw new SQLException("amount left in warehouse not enough, only "+left_amount+" items left. But your amount is "+amount+" at product: "+id_product);
        }
        getamountrs.close();
    }
    public static boolean checkProductCart(String id_user,String id_product){
        try {
            Connection con = GetConnection.getCon();
            String sql = "select * from cart where id_user = ? and id_product = ?";
            PreparedStatement ps  = con.prepareStatement(sql);
            ps.setString(1,id_user);
            ps.setString(2,id_product);
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while(rs.next()){
                count++;
            }
            rs.close();
            if(count==1){
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return false;
    }
    //duplicate entry -> using updateAmount() method instead
    public static boolean insertProduct(String id_user,String id_product,int amount) {
        try {
            System.out.println("rumme0");
            if(amount<0){return false;}
            System.out.println("rumme1");
            Connection con = null;
            con = GetConnection.getCon();
            if (!checkDataExist("id_user", id_user, "user_account")) return false;
            System.out.println("rumme2");

            if (!checkDataExist("id_product", id_product, "product")) return false;
            System.out.println("rumme3");

            check_amount_in_warehouse(con, id_product, amount);
            String sql = "insert into cart(id_user,id_product,c_amount_bought) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id_user);
            ps.setString(2, id_product);
            ps.setInt(3, amount);
            int scalar = ps.executeUpdate();
            System.out.println("rumme4 scalar"+scalar);

            if (scalar == 1) return true;
            else return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    // newValue = existedAmount + amount and update newValue down database.
    public static boolean updateAmount(String id_user,String id_product,int amount)  {
        try {
            Connection con = GetConnection.getCon();
            check_amount_in_warehouse(con, id_product, amount);
            String getExistedAmountSql = "select c_amount_bought from cart where id_user = ? and id_product = ?";
            PreparedStatement getAmountps = con.prepareStatement(getExistedAmountSql);
            getAmountps.setString(1, id_user);
            getAmountps.setString(2, id_product);
            ResultSet rs = getAmountps.executeQuery();
            int existedAmount = 0;
            int count = 0;
            while (rs.next()) {
                count++;
                existedAmount = rs.getInt(1);
            }
            if (count != 1) return false;
            System.out.println(existedAmount);
//        return true;
            int newValue = existedAmount + amount;
            if (newValue < 0) {
                return false;
            }
            String sql = "update cart set c_amount_bought = ? where id_user = ? and id_product= ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, newValue);
            ps.setString(2, id_user);
            ps.setString(3, id_product);
            int scalar = ps.executeUpdate();
            if (scalar == 1) return true;
            else
                return false;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static int getAmount(String id_user,String id_product){
        try {
            Connection con = GetConnection.getCon();
            String sql = "select c_amount_bought from cart where id_user=? and id_product = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,id_user);
            ps.setString(2,id_product);
            ResultSet rs = ps.executeQuery();
            int amount = -1;
            if(rs.next()==true){
                amount = rs.getInt(1);
            }
            return amount;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    public static int deleteProduct(String id_user,String id_product) {
        try {
            Connection con = GetConnection.getCon();
            String sql = "delete from cart where id_user = ? and id_product = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id_user);
            ps.setString(2, id_product);
            return ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public static double totalMoney(String id_user){
        List<Cart> products = watch(id_user);
        double total_money = 0;
        for (Cart cart:products
             ) {
            total_money+=cart.getAmount()*cart.getProduct().getPrice();
        }
        return total_money;
    }
    public static void main(String[] args) {
//        watch("UA0004");
        System.out.println(getAmount("UA0004","PD0002"));
//        System.out.println(checkDataExist("id_product","PD0009","product"));
//            System.out.println(deleteProduct("UA0004","PD0005"));
//            System.out.println(deleteProduct("UA0006","PD0005"));
//            System.out.println(insertProduct("UA0004","PD0005",40));
//            System.out.println(insertProduct("UA0006","PD0005",2));
//            String id_user = "UA0002";
//            double totalMoneyOfCart = totalMoney(id_user);
//            System.out.println("total money of user: "+id_user+" is "+totalMoneyOfCart);
//            updateAmount("UA0004","PD0005",5);

    }

}
