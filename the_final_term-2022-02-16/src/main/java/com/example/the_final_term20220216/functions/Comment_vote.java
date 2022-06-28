package com.example.the_final_term20220216.functions;

import com.example.the_final_term20220216.dao.GetConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class Comment_vote {

    public static void insert_comment_blog(String id_blog, String father_id_blog, String id_user, String comment_content) {
        try {
            Connection con = GetConnection.getCon();
            String id_comment_blog = Register.nextID(con, "comment_blog", "id_comment_blog", "BL");
            System.out.println(id_comment_blog);
            String sql = "insert into comment_blog values (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id_comment_blog);
            ps.setString(2, id_blog);
            ps.setString(3, father_id_blog);
            ps.setString(4, id_user);
            ps.setInt(7, 0);
            ps.setString(5, comment_content);
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            ps.setTimestamp(6, date);
            int scalar = ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    //check owner first and remove next!.
    public static void remove_comment_blog(String id_comment_blog,String id_user) throws SQLException, ClassNotFoundException {
        Connection con = GetConnection.getCon();
        String sql =  "select count(id_user) from comment_blog where id_comment_blog = ? and id_user = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,id_comment_blog);
        ps.setString(2,id_user);
        ResultSet rs = ps.executeQuery();
        rs.next();
        if(!(rs.getInt(1)==1))throw new SQLException("user "+id_user+" not the owner of comment " +id_comment_blog);
        rs.close();
        sql = "delete from comment_blog where id_comment_blog = ? and id_user = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1,id_comment_blog);
        ps.setString(2,id_user);
        int scalar = ps.executeUpdate();
    }
    public static  HashMap<String,IComment> read_comment_hash_blog(String id_blog) throws SQLException, ClassNotFoundException {
        Connection con = GetConnection.getCon();
        String sql = "SELECT * FROM comment_blog WHERE id_blog = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,id_blog);
        ResultSet rs = ps.executeQuery();
        HashMap<String,IComment> raw_comment_blogs = new HashMap<String,IComment>();
        while(rs.next()){
            CommentBlog co = new CommentBlog();
            co.setId_comment_blog(rs.getString(1));
            co.setId_blog(rs.getString(2));
            co.setFather_id_blog(rs.getString(3));
            co.setId_user(rs.getString(4));
            co.setComment_content(rs.getString(5));
            co.setDate_post(rs.getDate(6));
            co.setLike(rs.getInt(7));
            raw_comment_blogs.put(co.getId_comment_blog(),co);
        }
        rs.close();
        return raw_comment_blogs;
    }
        public static List<CommentBlog> read_comment_blog(String id_blog) throws SQLException, ClassNotFoundException {
        HashMap<String,IComment> raw_comment_blogs = read_comment_hash_blog(id_blog);
        System.out.println("raw"+raw_comment_blogs.size());
        List<IComment> halfResult = arrange(raw_comment_blogs);
        System.out.println("sizeblog haflResult: "+halfResult.size());
        List<CommentBlog> result = new ArrayList<>();
        for (int i = 0; i < halfResult.size(); i++) {
            result.add((CommentBlog)halfResult.get(i));
        }
        return result;
    }

    //get all data
    //arrange it more correct
    public static  HashMap<String,IComment> read_comment_hash_product(String id_product) throws SQLException, ClassNotFoundException {
        Connection con = GetConnection.getCon();
        String sql = "SELECT * FROM comment_product WHERE id_product = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,id_product);
        ResultSet rs = ps.executeQuery();
        HashMap<String,IComment> raw_comment_products = new HashMap<String,IComment>();
        while(rs.next()){
            CommentProduct co = new CommentProduct();
            co.setId_comment_product(rs.getString(1));
            co.setId_product(rs.getString(2));
            co.setFather_id_product(rs.getString(3));
            co.setId_user(rs.getString(4));
            co.setNum_star(rs.getInt(5));
            co.setComment_content(rs.getString(6));
            co.setDate_post(rs.getDate(7));
            raw_comment_products.put(co.getId_comment_product(),co);
        }
        rs.close();
        return raw_comment_products;
    }
    public static List<CommentProduct> read_comment_product(String id_product) throws SQLException, ClassNotFoundException {
        HashMap<String,IComment> raw_comment_products = read_comment_hash_product(id_product);
        List<IComment> halfResult = arrange(raw_comment_products);
        List<CommentProduct> result = new ArrayList<>();
        for (int i = 0; i < halfResult.size(); i++) {
            result.add((CommentProduct)halfResult.get(i));
        }
        return result;
    }
    /**
     *
     * @param comments
     * @return the list of root comment.
     */
    private static List<IComment> arrange(HashMap<String,IComment> comments){
        List<IComment> rootComment = new ArrayList<IComment>();
        for (String key: comments.keySet()) {
            IComment c = comments.get(key);
            if(c.getFatherID()==null || c.getFatherID().equals("null")||c.getFatherID().equals("NULL")){
                rootComment.add(c);
                continue;
            }
            if(comments.containsKey(c.getFatherID())){
//                comments.get(c.getFatherID()).addChild(c);
                c.setParent(comments.get(c.getFatherID()).id());
                //find root id
                String superid = returnRoot(comments,c.getFatherID());
                comments.get(superid).addChild(c);
                //
                System.out.println("[JDK8]"+c.getFatherID());
                if(comments.get(c.getFatherID())!=null)
                    System.out.println("[SPECIAL CASE]"+comments.get(c.getFatherID()).id());
                else
                    System.out.println("[OH NO,SOMETHING WRONG]"+c.getFatherID()+", "+c.id());
            }
        }
        return rootComment;
    };
    public static String returnRoot(HashMap<String,IComment> comments,String superid){
        String fatherid = comments.get(superid).getFatherID();
        if(fatherid==null||comments.containsKey(fatherid)==false)return superid;
        else{
            return returnRoot(comments, fatherid);
        }
    }
    public static void insert_comment_product(String id_product,String father_id_product,String id_user,int num_star,String comment_content)  {
        try {
            Connection con = GetConnection.getCon();
            String id_comment_product = Register.nextID(con, "comment_product", "id_comment_product", "CP");
            String sql = "insert into comment_product values (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id_comment_product);
            ps.setString(2, id_product);
            ps.setString(3, father_id_product);
            ps.setString(4, id_user);
            ps.setInt(5, num_star);
            ps.setString(6, comment_content);
            java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            ps.setTimestamp(7, date);
            int scalar = ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
    //check if this id_user own the id_comment!
    public static void remove_comment_product(String id_comment_product,String id_user) throws SQLException, ClassNotFoundException {
        Connection con = GetConnection.getCon();
        String sql =  "select count(id_user) from comment_product where id_comment_product = ? and id_user = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,id_comment_product);
        ps.setString(2,id_user);
        ResultSet rs = ps.executeQuery();
        rs.next();
        if(!(rs.getInt(1)==1))throw new SQLException("user "+id_user+" not the owner of comment " +id_comment_product);
        rs.close();
        sql = "delete from comment_product where id_comment_product = ? and id_user = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1,id_comment_product);
        ps.setString(2,id_user);
        int scalar = ps.executeUpdate();
        System.out.println(scalar);
    }
    public static void vote_like(String id_comment_blog) throws SQLException, ClassNotFoundException {
        int newLike = getLike(id_comment_blog)+1;
        Connection con = GetConnection.getCon();
        String sql = "update comment_blog set num_like = ? where id_comment_blog = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,newLike);
        ps.setString(2,id_comment_blog);
        int scalar = ps.executeUpdate();
        if(scalar<2) System.out.println("good!"+scalar);
        else System.out.println("something wrong.!");
    }
    public static int getLike(String id_comment_blog) throws SQLException, ClassNotFoundException {
        Connection con = GetConnection.getCon();
        String sql = "select num_like from comment_blog where id_comment_blog = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,id_comment_blog);
        ResultSet rs = ps.executeQuery();
        int value = 0;
        while(rs.next()) {
             value = rs.getInt(1);
        }
        rs.close();
        return value;
    }
    public static int getNumStar(String id_comment_product) throws SQLException, ClassNotFoundException {
        Connection con = GetConnection.getCon();
        String sql = "select num_star from comment_product where id_comment_product = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,id_comment_product);
        ResultSet rs = ps.executeQuery();
        int value = 0;
        while(rs.next()) {
            value = rs.getInt(1);
        }
        rs.close();
        return value;
    }
    public static void vote_star(String id_comment_product) throws SQLException, ClassNotFoundException {
        int newLike = getNumStar(id_comment_product)+1;
        if(newLike>=5)return;
        Connection con = GetConnection.getCon();
        String sql = "update comment_product set num_star = ? where id_comment_product = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1,newLike);
        ps.setString(2,id_comment_product);
        int scalar = ps.executeUpdate();
        if(scalar<2) System.out.println("good!"+scalar);
        else System.out.println("something wrong.!");
    }
    public static void printComment(String indent,IComment comment){
//        CommentProduct c1 = (CommentProduct) comment;
        CommentBlog c1 = (CommentBlog) comment;
        System.out.println(indent +c1.getId_user()+": "+c1.getComment_content());
        for (IComment c:comment.getChildren()) {
            printComment(indent+"   ",c);
        }
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        insert_comment_product("PD0005",null,"UA0004",4,"this is kind of nice");
//        remove_comment_product("CP0010","UA0004");
//        List<CommentProduct> c = read_comment_product("PD0007");
//        List<CommentBlog> c = read_comment_blog("BL0001");
//        for (int i = 0; i < c.size(); i++) {
//            printComment("",c.get(i));
//        }
//        insert_comment_blog("BL0001",null,"UA0001","this is good");
//        remove_comment_blog("BL0010","UA0001");
//        System.out.println(getLike("CB0001"));

//        String id_comment_blog = "CB0001";
//        System.out.println(getLike(id_comment_blog));
//        vote_like(id_comment_blog);
//        System.out.println(getLike(id_comment_blog));

        String id_comment_product = "CP0001";
        System.out.println(getNumStar(id_comment_product));
        vote_star(id_comment_product);
        System.out.println(getNumStar(id_comment_product));

    }

}
