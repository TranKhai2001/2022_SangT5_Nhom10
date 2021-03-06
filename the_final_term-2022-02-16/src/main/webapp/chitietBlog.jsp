<%@ page import="com.example.the_final_term20220216.functions.Blog" %>
<%@ page import="com.example.the_final_term20220216.functions.CommentBlog" %>
<%@ page import="com.example.the_final_term20220216.functions.IComment" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.example.the_final_term20220216.ChiTietBlog" %>
<%@ page import="com.example.the_final_term20220216.functions.UserAccount" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>chi tiết Blog</title>
    <link href="https://fonts.googleapis.com/css?family=Cairo:400,600,700&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400i,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu&amp;display=swap" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/slick.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/main-color.css">
</head>
<body class="biolife-body">

    <!-- Preloader -->
    <div id="biof-loading">
        <div class="biof-loading-center">
            <div class="biof-loading-center-absolute">
                <div class="dot dot-one"></div>
                <div class="dot dot-two"></div>
                <div class="dot dot-three"></div>
            </div>
        </div>
    </div>

    <!-- HEADER -->
    <header id="header" class="header-area style-01 layout-03">
        <div class="header-top bg-main hidden-xs">
            <div class="container">
                <div class="top-bar left">
                    <ul class="horizontal-menu">
                        <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i>Organic@company.com</a></li>
                        <li><a href="#">Giao hàng miễn phí cho tất cả đơn hàng từ 200K</a></li>
                    </ul>
                </div>
                <div class="top-bar right">
                    <ul class="social-list">
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                    </ul>
                    <ul class="horizontal-menu">
                        <!--                        <li class="horz-menu-item currency">-->
                        <!--                            <select name="currency">-->
                        <!--                                <option value="eur">€ EUR (Euro)</option>-->
                        <!--                                <option value="usd" selected>$ USD (Dollar)</option>-->
                        <!--                                <option value="usd">£ GBP (Pound)</option>-->
                        <!--                                <option value="usd">¥ JPY (Yen)</option>-->
                        <!--                                <option value="usd">đ VND (VND)</option>-->
                        <!--                            </select>-->
                        <!--                        </li>-->
                        <!--                        <li class="horz-menu-item lang">-->
                        <!--                            <select name="language">-->
                        <!--                                <option value="fr">French (EUR)</option>-->
                        <!--                                <option value="en" selected>English (USD)</option>-->
                        <!--                                <option value="ger">Germany (GBP)</option>-->
                        <!--                                <option value="jp">Japan (JPY)</option>-->
                        <!--                                <option value="jp">Việt Nam (VND)</option>-->
                        <!--                            </select>-->
                        <!--                        </li>-->
                        <%
                        UserAccount ua = (UserAccount) session.getAttribute("auth");
                        if(ua==null){%>
                        <li><a href="dangNhap.jsp" class="login-link"><i class="biolife-icon icon-login"></i>Đăng nhập/</a> <a href="dangKy.jsp"> Đăng ký</a></li>
                        <%}else {%>
                        <li><a href="thongTinTaiKhoan/thongTinTaiKhoan.jsp" class="login-link"><i class="biolife-icon icon-login"></i>xin chào <%=ua.getUser_name()%> <a href="LogOut">/ Thoát</a></li>
                        <%}%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="header-middle biolife-sticky-object ">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-md-6 col-xs-6">
                        <a href="TrangChu" class="biolife-logo"><img src="assets/images/organic-3.png" alt="biolife logo" width="135" height="34"></a>
                    </div>
                    <div class="col-lg-7 col-md-7 hidden-sm hidden-xs">
                        <div class="primary-menu">
                            <ul class="menu biolife-menu clone-main-menu clone-primary-menu" id="primary-menu" data-menuname="main menu">
                                <li class="menu-item"><a href="TrangChu" >Trang chủ</a></li>
                                <li class="menu-item"><a href="KhuyenMai"> khuyễn mãi</a></li>
                                <li class="menu-item"><a href="BanChay">Sản phẩm HOT</a></li>
                                <li class="menu-item"><a href="ChinhSachGiaoHang">Chính sách </a></li>
                                <li class="menu-item"><a href="DanhSachBlog">Blog</a></li>
                                <li class="menu-item"><a href="lienHe.jsp">Liên hệ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-md-6 col-xs-8">
                        <div class="biolife-cart-info">
                            <div class="mobile-search">
                                <a href="javascript:void(0)" class="open-searchbox"><i class="biolife-icon icon-search"></i></a>
                                <div class="mobile-search-content">
                                    <form action="#" class="form-search" name="mobile-seacrh" method="get">
                                        <a href="#" class="btn-close"><span class="biolife-icon icon-close-menu"></span></a>
                                        <input type="text" name="s" class="input-text" value="" placeholder="Search here...">
                                        <button type="submit" class="btn-submit">go</button>
                                    </form>
                                </div>
                            </div>
                            <div class="wishlist-block hidden-sm hidden-xs">
                                <a href="#" class="link-to">
                                    <!--                                    <span class="icon-qty-combine">-->
                                    <!--                                        <i class="icon-heart-bold biolife-icon"></i>-->
                                    <!--                                        &lt;!&ndash;                                    <span class="qty">4</span>&ndash;&gt;-->
                                    <!--                                    </span>-->
                                </a>
                            </div>
                            <div class="minicart-block" onmouseover="executeData()">
                                <div class="minicart-contain">
                                    <!--                                    <a href="javascript:void(0)" class="link-to">-->
                                    <a href="gioHangCuaBan.jsp" class="link-to">
                                            <span class="icon-qty-combine">
                                                <i class="icon-cart-mini biolife-icon"><i style="color:#b9b6b6;"></i></i>
                                                <!--                                            <span class="qty">8</span>-->
                                            </span>
                                        <span class="title">Giỏ hàng của bạn </span>
                                        <span class="sub-total" id="money-total-cart">0.00</span>

                                    </a>

                                    <div class="cart-content" >
                                        <div class="cart-inner">



                                            <ul class="products" id="products-cart">

                                            </ul>






                                            <p class="btn-control">
                                                <a href="gioHangCuaBan.jsp" class="btn view-cart">Xem giỏ hàng </a>
                                                <a href="ThanhToan" class="btn">Thanh toán</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="mobile-menu-toggle">
                                <a class="btn-toggle" data-object="open-mobile-menu" href="javascript:void(0)">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bottom hidden-sm hidden-xs">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-4">
                        <div class="vertical-menu vertical-category-block">
                            <div class="block-title">
                                <span class="menu-icon">
                                    <span class="line-1"></span>
                                    <span class="line-2"></span>
                                    <span class="line-3"></span>
                                </span>
                                <span class="menu-title">Danh sách sản phẩm</span>
                                <span class="angle" data-tgleclass="fa fa-caret-down"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                            </div>
                            <div class="wrap-menu">
                                <ul class="menu clone-main-menu">
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="KhuyenMai" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Top sản phẩm khuyến mãi</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="BanChay" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Top sản phẩm bán chạy</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="CacLoaiSanPham?type=traicay" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Trái cây</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="CacLoaiSanPham?type=raucu" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-fruits"></i>Rau củ</a>
                                    </li>
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fresh Berries"><i class="biolife-icon icon-grape"></i>Qủa mọng</a>-->
                                    <!--                                    </li>-->
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-fruits"></i>Rau củ quả gia vị</a>-->
                                    <!--                                    </li>-->
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Các loại quả nhập khẩu</a>-->
                                    <!--                                    </li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 padding-top-2px">
                        <div class="header-search-bar layout-01">
                            <form action="#" class="form-search" name="desktop-seacrh" method="get">
                                <input list="livesearch" type="text" name="s" class="input-text" value="" onkeyup="showResult(this.value)" placeholder="Tìm kiếm sản phẩm...">
                                <%--                                <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>--%>
                                <ul id="livesearch">

                                </ul>
                            </form>

                        </div>
                        <div class="live-info">
                            <p class="telephone"><i class="fa fa-phone" aria-hidden="true"></i><b class="phone-number">(+900) 123 456 7891</b></p>
                            <p class="working-time">Thứ 2-6: 8:30am-7:30pm; Thứ 7-CN: 9:30am-4:30pm</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!--Hero Section-->
    <div class="hero-section hero-background style-02">
        <h1 class="page-title">Blog Biolife Shop</h1>
        <nav class="biolife-nav">
            <ul>
                <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
                <li class="nav-item"><span class="current-page">Blog</span></li>
            </ul>
        </nav>
    </div>

    <!-- Page Contain -->
    <div class="page-contain blog-page left-sidebar">
        <div class="container">
            <div class="row">
                <% Blog blog = (Blog) request.getAttribute("blog");

                %>
                <!-- Main content -->
                <div id="main-content" class="main-content col-lg-9 col-md-8 col-sm-12 col-xs-12">

                    <!--Single Post Contain-->
                    <div class="single-post-contain">

                        <div class="post-head">
                            <div class="thumbnail">
                                <figure><img src=<%=blog.getImg_url()%> width="870" height="635" alt=""></figure>
                            </div>
                            <h2 class="post-name"><%=blog.getName()%></h2>
                            <p class="post-archive"><b class="post-cat"></b><span class="post-date"> <%=blog.getDate_post().toString()%></span><span class="author"><%=blog.getAuthor()%></span></p>
                        </div>

                        <div class="post-content">
                            <p><%=blog.getContent()%></p>
<%--                            <%--%>
<%--                                System.out.println(blog.getContent());%>--%>
<%--                            <p>1. Tuyệt đối không rửa rau, củ, quả trước khi mang đi cất trữ.Điều đó sẽ khiến rau, củ, quả dễ bị ủng, thối. Bạn chỉ cần lau qua bằng giấy ăn hoặc khăn khô là được.</p>--%>
<%--                            <p>2. Không nên để rau, củ, quả trong môi trường ẩm ướt bởi như vậy sẽ khiến chúng nhanh hỏng.Các bạn nên đặt giấy ăn khô và những chiếc túi hay hộp bảo quản rau, củ, quả.</p>--%>
<%--                            <p>3. Tuyệt đối không cho các loại rau quả này vào tủ lạnh!Ớt chuông, dưa chuột, cà chua cần được bảo quản ở nhiệt độ phòng, nếu không chúng sẽ nhanh hỏng và dễ mất chất.</p>--%>
<%--                            <p>4. Rau, củ, quả đã cắt hoặc gọt vỏ cần cho vào hộp kín.Như vậy sẽ khiến cho thực phẩm của bạn giữ được lâu hơn và hạn chế tình trạng mất chất.</p>--%>
<%--                            <p>5. Không nên để rau, củ, quả ở nhiệt độ quá lạnh.Đừng nghĩ rằng điều đó sẽ giúp bảo quản lâu hơn, trái lại nó còn khiến thực phẩm của bạn nhanh hỏng hơn khi rã đông đó.</p>--%>
<%--                            <p>6. Một số loại rau quả không nên để cùng nhau.Chúng ta không nên để chung chuối, quả mơ, dưa hấu, lê, mận, xoài, và cà chua với một trong các loại rau quả bao gồm táo, cà tím, dưa hấu, khoai tây, bí ngô, cà rốt và bông cải xanh. Điều đó sẽ khiến rau quả của bạn nhanh bị hỏng.</p>--%>
<%--                            <p>7. Muốn bảo quản rau củ ở nhiệt độ phòng, hãy để chúng ở vị trí thông thoáng.Tránh cho vào hộp hay túi nilon ở nhiệt độ thường, như vậy thực phẩm sẽ nhanh bị ủng, thối…</p>--%>
<%--                            <p>8. Muốn giữ nho tươi lâu, hãy cho vào túi polyetylen hoặc hộp nhựa.Với nho hay cherry, bạn nên cho vào túi polyetylen hoặc hộp nhựa rồi đặt vào tủ lạnh.</p>--%>
<%--                            <p>9. Không nên cho chuối vào tủ lạnh.Thay vào đó, các bạn hãy để ở nhiệt độ phòng và bọc phần cuống lại bằng màng bọc thực phẩm.</p>--%>
                            <blockquote>
                                <address>
<%--                                    <span>Nguồn từ <a href="#" class="author">Koan Conella</a></span>--%>
                                </address>
                            </blockquote>
                        </div>

                        <div class="post-foot">



                            <div class="auth-info">
                                <div class="ath">
                                    <a href="#" class="avata"><img src="assets/images/blogpost/author-02.png" width="29" height="28" alt="Christian Doe">Christian Doe</a>
<!--                                    <span class="count-item viewer"><i class="fa fa-eye" aria-hidden="true"></i>630</span>-->
                                    <span class="count-item commented"><i class="fa fa-commenting" aria-hidden="true"></i>26</span>
                                </div>
                                <div class="socials-connection">
                                    <span class="title">Chia sẻ:</span>
                                    <ul class="social-list">
                                        <li><a href="#" class="socail-link"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="socail-link"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="socail-link"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="socail-link"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="socail-link"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>

                    </div>

                    <!--Comment Block-->
                    <div class="post-comments">
                        <h3 class="cmt-title">Bình luân<sup>(26)</sup></h3>
                        <%
                            System.out.println("on jsp file: "+blog.getCommentRootBlogs().size());
                            for (CommentBlog b:blog.getCommentRootBlogs()
                                 ) {

                            }%>
                        <div class="comment-form">
                            <form action="#" method="post" name="frm-post-comment">
                                <p class="form-row">
                                    <textarea name="txt-comment" id="txt-comment-ath-3364" cols="30" rows="10" placeholder="Viết bình luận của bạn"></textarea>
                                    <a href="#" class="current-author"><img src="assets/images/blogpost/viewer-avt.png" width="41" height="41" alt=""></a>
                                </p>
                                <p class="form-row last-btns">
                                    <button type="submit" class="btn btn-sumit">Đăng bình luận</button>
                                </p>
                            </form>
                        </div>

                        <div class="comment-list">

                            <ol class="post-comments lever-0">
<%--                                <li class="comment-elem">--%>
<%--                                    <div class="wrap-post-comment">--%>

<%--                                        <div class="cmt-inner">--%>
<%--                                            <div class="auth-info">--%>
<%--                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-02.png" alt="" width="29" height="28">Người nào đó</a>--%>
<%--                                                <span class="cmt-time">4 days ago</span>--%>
<%--                                            </div>--%>
<%--                                            <div class="cmt-content">--%>
<%--                                                <p>Bài viết có những chia sẻ thú vị và bổ ích</p>--%>
<%--                                            </div>--%>
<%--                                            <div class="cmt-fooot">--%>
<%--                                                <a href="#" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>

<%--                                        <div class="comment-resposes">--%>
<%--                                            <ol class="post-comments lever-1">--%>
<%--                                                <li class="comment-elem">--%>
<%--                                                    <div class="wrap-post-comment">--%>
<%--                                                        <div class="cmt-inner">--%>
<%--                                                            <div class="auth-info">--%>
<%--                                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-03.png" alt="" width="29" height="28">admin</a>--%>
<%--                                                                <span class="cmt-time">4 days ago</span>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="cmt-content">--%>
<%--                                                                <p>Cám ơn bạn!</p>--%>

<%--                                                            </div>--%>
<%--                                                            <div class="cmt-fooot">--%>
<%--                                                                <a href="#" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </li>--%>
<%--                                            </ol>--%>
<%--                                        </div>--%>
<%--&lt;%&ndash;                                        <div class="comment-resposes">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            <ol class="post-comments lever-1">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                <li class="comment-elem">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    <div class="wrap-post-comment">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        <div class="cmt-inner">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <div class="auth-info">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-03.png" alt="" width="29" height="28">admin</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <span class="cmt-time">4 days ago</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <div class="cmt-content">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <p>Cám ơn bạn! 2</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            <div class="cmt-fooot">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                                <a href="#" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                        </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                    </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                                </li>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                            </ol>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        </div>&ndash;%&gt;--%>

<%--                                    </div>--%>
<%--                                </li>--%>

    <%int count = 0; for (CommentBlog commentBlog: blog.getCommentRootBlogs()
            ) {
        System.out.println("[SIZE]"+blog.getCommentRootBlogs().size());
        count++;
%>
    <li class="comment-elem">
                                    <div class="wrap-post-comment">

                                        <div class="cmt-inner">

                                            <div class="auth-info">
                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-02.png" alt="" width="29" height="28"><%=commentBlog.getId_user()%></a>
                                                <span class="cmt-time"><%=commentBlog.getDate_post().toString()%></span>
                                            </div>
                                            <div class="cmt-content">
                                                <p><%=commentBlog.getComment_content()%></p>
                                            </div>
                                            <!--cmt-fooot-->
                                            <div class="cmt-fooot">
                                                <a type="button" onclick="runme(<%=count%>)" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>
                                            </div>
                                            <form action="AddCommentBlog" method="post" id="<%=count%>" hidden >
                                                <textarea type="text" name="message" rows="4" cols="50"></textarea>
                                                <input type="hidden" name="father_id_blog" value="<%=commentBlog.getId_comment_blog()%>">
                                                <input type="hidden" name="id_blog" value="<%=commentBlog.getId_blog()%>">
                                                <button type="submit" value="send response"> gửi phản hồi</button>
                                            </form>
                                        </div>
<%--                                        <%request.setAttribute("count",count);%>--%>
<%--                                        <%request.setAttribute("node",commentBlog);%>--%>
<%--                                        <jsp:forward page="ChildCommentBlog.jsp"/>--%>
<%--                                        <%count = Integer.parseInt(request.getAttribute("count").toString());%>--%>
                                        <% for (IComment x: commentBlog.getChildren()
                                        ) {
    CommentBlog child = (CommentBlog) x;
        count++;
                                        %>

                                        <div class="comment-resposes">
                                            <ol class="post-comments lever-1">
                                                <li class="comment-elem">
                                                    <div class="wrap-post-comment">
                                                        <div class="cmt-inner">
                                                            <div class="auth-info">
                                                                <a href="#" class="author-contact"><img src="assets/images/blogpost/author-03.png" alt="" width="29" height="28">@<b style="color:green;"><%=child.getParent()+" "%></b><%=child.getId_user()%></a>
                                                                <span class="cmt-time"><%=child.getDate_post().toString()%></span>
                                                            </div>
                                                            <div class="cmt-content">
                                                                <p><%=child.getComment_content()%></p>
                                                            </div>
                                                            <div class="cmt-fooot">
                                                                <a type="button" onclick="runme(<%=count%>)" class="btn btn-response"><i class="fa fa-commenting" aria-hidden="true"></i>Phản hồi</a>
                                                            </div>
                                                            <form action="AddCommentBlog" method="post" id="<%=count%>" hidden >
                                                                <textarea type="text" name="message" rows="4" cols="50"></textarea>
                                                                <input type="hidden" name="father_id_blog" value="<%=child.getId_comment_blog()%>">
                                                                <input type="hidden" name="id_blog" value="<%=child.getId_blog()%>">
                                                                <button type="submit" value="send response"> gửi phản hồi</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ol>
                                        </div>
                                        <%}%>

                                    </div>
                                </li>
                                <%}%>
                            </ol>

<%--                            <div class="biolife-panigations-block ">--%>
<%--                                <ul class="panigation-contain">--%>
<%--                                    <li><span class="current-page">1</span></li>--%>
<%--                                    <li><a href="#" class="link-page">2</a></li>--%>
<%--                                    <li><a href="#" class="link-page">3</a></li>--%>
<%--                                    <li><span class="sep">....</span></li>--%>
<%--                                    <li><a href="#" class="link-page">20</a></li>--%>
<%--                                    <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                        </div>

                    </div>

                </div>

                <!-- Sidebar -->
                <aside id="sidebar" class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">
                    <div class="sidebar-contain">

                        <!--Posts Widget-->
                        <div class="widget posts-widget">
                            <h4 class="wgt-title">Bài viết gần đây</h4>
                            <div class="wgt-content">
                                <ul class="posts">
                                    <%
                                        List<Integer> numbersComment = (List<Integer>) request.getAttribute("numberCommentsWithRelateBlogs");
                                        Iterator<Integer> itor = numbersComment.iterator();
                                        for (Blog b:(List<Blog>)request.getAttribute("relateBlogs")
                                             ) {
                                            int numberComment = itor.next();
        String link = "ChiTietBlog?id_blog="+b.getId_blog();
                                    %>
                                    <li>
                                        <div class="wgt-post-item">
                                            <div class="thumb">
                                                <a href=<%=link%>><img src=<%=b.getImg_url()%> width="80" height="58" alt=""></a>
                                            </div>
                                            <div class="detail">
                                                <h4 class="post-name"><a style="font-size: 13px;" href=<%=link%>><%=b.getName()%></a></h4>
                                                <p class="post-archive"><%=b.getDate_post().toString()%>><span class="comment"><%=numberComment%>> Bình luận</span></p>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="#"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="blog-post.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
                                </ul>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>

    <!-- FOOTER -->
    <jsp:include page="Footer.jsp"/>


    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>
    <script>
        var formatter = new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND',

            // These options are needed to round to whole numbers if that's what you want.
            //minimumFractionDigits: 0, // (this suffices for whole numbers, but will print 2500.10 as $2,500.1)
            //maximumFractionDigits: 0, // (causes 2500.99 to be printed as $2,501)
        });
        function executeData(){
            <%
            String id = "";
            if(ua==null){
            %>
            let strVar = "";
            strVar += "<li>";
            strVar += "                                                    <div href=\"dangNhap.jsp\" class=\"minicart-item\">";
            strVar += "                                                        <div class=\"left-info\">";
            strVar += "                                                            <div class=\"product-title\"><a  class=\"product-name\">vui lòng đăng nhập để mở chức năng giỏ hàng<\/a><\/div>";
            strVar += "                                                        <\/div>";
            strVar += "                                                    <\/div>";
            strVar += "                                                <\/li>";
            document.getElementById("products-cart").innerHTML=strVar;
            return ;
            <%}else{
                id = ua.getId_user();
            }%>

            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                let realData = "";
                let mydata = JSON.parse(this.responseText);
                console.log(mydata);
                let totalmoney = 0.0;
                for(let i =0;i<mydata.length;i++){
                    // console.log("");
                    let line = "ChiTietSanPham?id_product="+mydata[i].product.id_product;
                    realData += "<li>";
                    realData += "                                                    <div class=\"minicart-item\">";
                    realData += "                                                        <div class=\"thumb\">";
                    realData += "                                                            <a href=\""+line+"\"><img src=\""+mydata[i].product.img_url+"\" width=\"90\" height=\"90\" alt=\"National Fresh\"><\/a>";
                    realData += "                                                        <\/div>";
                    realData += "                                                        <div class=\"left-info\">";
                    realData += "                                                            <div class=\"product-title\"><a href=\""+line+"\" class=\"product-name\">"+mydata[i].product.product_name+"<\/a><\/div>";
                    realData += "                                                            <div class=\"price\">";
                    realData += "                                                                <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+mydata[i].product.price_discount+" đ<\/span><\/ins>";
                    realData += "                                                                <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+mydata[i].product.price+" đ<\/span><\/del>";
                    realData += "                                                            <\/div>";
                    realData += "                                                            <div class=\"qty\">";
                    realData += "                                                                <label for=\"cart[id123][qty]\">Qty:<\/label>";
                    realData += "                                                                <input type=\"number\" class=\"input-qty\" name=\"cart[id123][qty]\" id=\"cart[id123][qty]\" value=\""+mydata[i].amount+"\" disabled>";
                    realData += "                                                            <\/div>";
                    realData += "                                                        <\/div>";
                    realData += "                                                    <\/div>";
                    realData += "                                                <\/li>";
                    totalmoney+=parseFloat(mydata[i].amount)*parseFloat(mydata[i].product.price_discount);
                }


                document.getElementById("money-total-cart").innerHTML = formatter.format(totalmoney);
                document.getElementById("products-cart").innerHTML = realData;
            }
            let va = Math.random();
            xhttp.open("GET", "ShowCart?id_user=<%=id%>&x="+va);
            xhttp.send();

        }
    </script>
    <script>
        function showResult(str) {
            if (str.length==0) {
                document.getElementById("livesearch").innerHTML="";
                return;
            }
            var xmlhttp=new XMLHttpRequest();
            xmlhttp.onreadystatechange=function() {
                try {
                    let va = JSON.parse(this.responseText);
                    let searchResult = "";
                    console.log(va);
                    if (this.readyState==4 && this.status==200) {
                        for(let i =0;i<va.length;i++) {
                            // searchResult += "<option type='submit'  value=\"\">";
                            searchResult += "  <li ><a href='ChiTietSanPham?id_product="+va[i].id_product+"'>"+va[i].product_name+"<\/a><\/li>";

                            // document.getElementById("livesearch").style.border="1px solid #A5ACB2";
                        }
                        console.log(searchResult)
                        document.getElementById("livesearch").innerHTML = searchResult;

                    }
                }
                    //catch json error
                catch(err) {
                }

            }
            xmlhttp.open("GET","LiveSearch?q="+str,true);
            xmlhttp.send();
        }
    </script>

    <!-- Scroll Top Button -->
    <a class="btn-scroll-top"><i class="biolife-icon icon-left-arrow"></i></a>

    <script src="assets/js/jquery-3.4.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.countdown.min.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/jquery.nicescroll.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/biolife.framework.js"></script>
    <script src="assets/js/functions.js"></script>
    <script>
        var textarea = $('#w3review');
        $("#popup").click(function(){

            // To show it
            textarea.show("fast");

        });
        // To get the value
        var value = textarea.val();
    </script>
    <script>
        function runme(count){
            $("#"+count).toggle();
        }
    </script>
<%--    <script>--%>
<%--        const addressBtn = document.getElementById('js-address-btn')--%>
<%--        const modal = document.getElementById('js-account-modal')--%>
<%--        const modalClose = document.getElementsByClassName('js-account-modal-close')--%>

<%--        function hideModal() {--%>
<%--            modal.classList.remove('modal-open')--%>
<%--        }--%>

<%--        function showModal(){--%>
<%--            modal.classList.add('modal-open')--%>
<%--        }--%>

<%--        addressBtn.addEventListener('click', showModal)--%>

<%--        for (const closeBtn of modalClose) {--%>
<%--            closeBtn.addEventListener('click', hideModal)--%>
<%--        }--%>

<%--    </script>--%>
</body>

</html>