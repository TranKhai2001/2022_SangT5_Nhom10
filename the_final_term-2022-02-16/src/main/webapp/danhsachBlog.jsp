<%@ page import="com.example.the_final_term20220216.functions.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.the_final_term20220216.functions.UserAccount" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Blog </title>
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
                        <li><a href="#">Giao h??ng mi???n ph?? cho t???t c??? ????n h??ng t??? 200K</a></li>
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
                        <!--                                <option value="eur">??? EUR (Euro)</option>-->
                        <!--                                <option value="usd" selected>$ USD (Dollar)</option>-->
                        <!--                                <option value="usd">?? GBP (Pound)</option>-->
                        <!--                                <option value="usd">?? JPY (Yen)</option>-->
                        <!--                                <option value="usd">?? VND (VND)</option>-->
                        <!--                            </select>-->
                        <!--                        </li>-->
                        <!--                        <li class="horz-menu-item lang">-->
                        <!--                            <select name="language">-->
                        <!--                                <option value="fr">French (EUR)</option>-->
                        <!--                                <option value="en" selected>English (USD)</option>-->
                        <!--                                <option value="ger">Germany (GBP)</option>-->
                        <!--                                <option value="jp">Japan (JPY)</option>-->
                        <!--                                <option value="jp">Vi???t Nam (VND)</option>-->
                        <!--                            </select>-->
                        <!--                        </li>-->
                        <%
                            UserAccount ua = (UserAccount) request.getAttribute("auth");
                            if(ua==null){%>
                        <li><a href="dangNhap.jsp" class="login-link"><i class="biolife-icon icon-login"></i>????ng nh???p/</a> <a href="dangKy.jsp"> ????ng k??</a></li>
                        <%}else {%>
                        <li><a href="thongTinTaiKhoan/thongTinTaiKhoan.jsp" class="login-link"><i class="biolife-icon icon-login"></i>xin ch??o <%=ua.getUser_name()%> <a href="LogOut">/ Tho??t</a></li>
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
                                <li class="menu-item"><a href="TrangChu" style="color:red;">Trang ch???</a></li>
                                <li class="menu-item"><a href="KhuyenMai"> khuy???n m??i</a></li>
                                <li class="menu-item"><a href="BanChay">S???n ph???m HOT</a></li>
                                <li class="menu-item"><a href="ChinhSachGiaoHang">Ch??nh s??ch </a></li>
                                <li class="menu-item"><a href="DanhSachBlog">Blog</a></li>
                                <li class="menu-item"><a href="lienHe.jsp">Li??n h???</a></li>
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
                                        <span class="title">Gi??? h??ng c???a b???n </span>
                                        <span class="sub-total" id="money-total-cart">0.00</span>

                                    </a>

                                    <div class="cart-content" >
                                        <div class="cart-inner">



                                            <ul class="products" id="products-cart">

                                            </ul>






                                            <p class="btn-control">
                                                <a href="gioHangCuaBan.jsp" class="btn view-cart">Xem gi??? h??ng </a>
                                                <a href="ThanhToan" class="btn">Thanh to??n</a>
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
                                <span class="menu-title">Danh s??ch s???n ph???m</span>
                                <span class="angle" data-tgleclass="fa fa-caret-down"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                            </div>
                            <div class="wrap-menu">
                                <ul class="menu clone-main-menu">
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="KhuyenMai" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Top s???n ph???m khuy???n m??i</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="BanChay" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Top s???n ph???m b??n ch???y</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="CacLoaiSanPham?type=traicay" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>Tr??i c??y</a>
                                    </li>
                                    <li class="menu-item menu-item-has-children has-megamenu">
                                        <a href="CacLoaiSanPham?type=raucu" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-fruits"></i>Rau c???</a>
                                    </li>
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fresh Berries"><i class="biolife-icon icon-grape"></i>Q???a m???ng</a>-->
                                    <!--                                    </li>-->
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Vegetables"><i class="biolife-icon icon-fruits"></i>Rau c??? qu??? gia v???</a>-->
                                    <!--                                    </li>-->
                                    <!--                                    <li class="menu-item menu-item-has-children has-megamenu">-->
                                    <!--                                        <a href="cacLoaiSanPham.jsp" class="menu-name" data-title="Fruit"><i class="biolife-icon icon-fruits"></i>C??c lo???i qu??? nh???p kh???u</a>-->
                                    <!--                                    </li>-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-8 padding-top-2px">
                        <div class="header-search-bar layout-01">
                            <form action="#" class="form-search" name="desktop-seacrh" method="get">
                                <input list="livesearch" type="text" name="s" class="input-text" value="" onkeyup="showResult(this.value)" placeholder="T??m ki???m s???n ph???m...">
                                <%--                                <button type="submit" class="btn-submit"><i class="biolife-icon icon-search"></i></button>--%>
                                <ul id="livesearch">

                                </ul>
                            </form>

                        </div>
                        <div class="live-info">
                            <p class="telephone"><i class="fa fa-phone" aria-hidden="true"></i><b class="phone-number">(+900) 123 456 7891</b></p>
                            <p class="working-time">Th??? 2-6: 8:30am-7:30pm; Th??? 7-CN: 9:30am-4:30pm</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>


    <!--Hero Section-->
    <div class="hero-section hero-background style-02">
        <h1 class="page-title">Organic Fruits</h1>
        <nav class="biolife-nav">
            <ul>
                <li class="nav-item"><a href="index-2.jsp" class="permal-link">Home</a></li>
                <li class="nav-item"><span class="current-page">Our Blog</span></li>
            </ul>
        </nav>
    </div>

    <!-- Page Contain -->
    <div class="page-contain blog-page">
        <div class="container">
            <!-- Main content -->
            <div id="main-content" class="main-content">

                <div class="row">

                    <!--articles block-->
                    <ul class="posts-list main-post-list">
                        <%
                            for (Blog b:(List<Blog>)request.getAttribute("blogs")
                            ) {
                                String link = "ChiTietBlog?id_blog="+b.getId_blog();

                        %>
                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="post-item effect-04 style-bottom-info">
                                <div class="thumbnail">
                                    <a href=<%=link%>> class="link-to-post"><img src=<%=b.getImg_url()%> width="370" height="270" alt=""></a>
                                </div>
                                <div class="post-content">
                                    <h4 class="post-name"><a href=<%=link%> class="linktopost"><%=b.getName()%></a></h4>
                                    <p class="post-archive"><b class="post-cat"></b><span class="post-date"><%=b.getDate_post().toString()%></span><span class="author"><%=b.getAuthor()%></span></p>
                                    <p class="excerpt"><%=b.getShort_discription()%></p>
                                    <div class="group-buttons">
                                        <a  class="btn readmore" href=<%=link%>>T??m hi???u th??m</a>
                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number"><%=b.getNumberComment()%></span></a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%}%>
<%--                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">--%>
<%--                            <div class="post-item effect-04 style-bottom-info">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-05.jpg" width="370" height="270" alt=""></a>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">11+ l???i ??ch s???c kh???e c???a d??u t??y, nh???ng ??i???u c???n l??u ??</a></h4>--%>
<%--                                    <p class="post-archive"><b class="post-cat">ORGANIC</b><span class="post-date"> / 26-12</span><span class="author">????ng b???i: Braum J.Teran</span></p>--%>
<%--                                    <p class="excerpt">Khi nh???c ?????n d??u t??y, ch???c h???n ai c??ng bi???t r?? v??? nh???ng l???i ??ch s???c ?????p m?? lo???i th???c ph???m n??y mang l???i...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">T??m hi???u th??m</a>--%>
<%--                                        <a href="#" class="btn count-number liked"><i class="biolife-icon icon-heart-1"></i><span class="number">20</span></a>--%>
<%--                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number">06</span></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">--%>
<%--                            <div class="post-item effect-04 style-bottom-info">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-04.jpg" width="370" height="270" alt=""></a>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">11+ l???i ??ch s???c kh???e c???a d??u t??y, nh???ng ??i???u c???n l??u ??</a></h4>--%>
<%--                                    <p class="post-archive"><b class="post-cat">ORGANIC</b><span class="post-date"> / 26-12</span><span class="author">????ng b???i: Braum J.Teran</span></p>--%>
<%--                                    <p class="excerpt">Khi nh???c ?????n d??u t??y, ch???c h???n ai c??ng bi???t r?? v??? nh???ng l???i ??ch s???c ?????p m?? lo???i th???c ph???m n??y mang l???i...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">T??m hi???u th??m</a>--%>
<%--                                        <a href="#" class="btn count-number liked"><i class="biolife-icon icon-heart-1"></i><span class="number">20</span></a>--%>
<%--                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number">06</span></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">--%>
<%--                            <div class="post-item effect-04 style-bottom-info">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-03.jpg" width="370" height="270" alt=""></a>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">5 l?? do b???n c???n th??m qu??? m???ng trong cu???c s???ng ??? Fitbit Blog</a></h4>--%>
<%--                                    <p class="post-archive"><b class="post-cat">ORGANIC</b><span class="post-date"> / 26-12</span><span class="author">????ng b???i: Braum J.Teran</span></p>--%>
<%--                                    <p class="excerpt">??n b???t k??? lo???i tr??i c??y n??o c??ng l?? m???t ?????ng th??i l??nh m???nh. Nh??ng n???u b???n th???c s??? mu???n...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">T??m hi???u th??m</a>--%>
<%--                                        <a href="#" class="btn count-number liked"><i class="biolife-icon icon-heart-1"></i><span class="number">20</span></a>--%>
<%--                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number">06</span></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">--%>
<%--                            <div class="post-item effect-04 style-bottom-info">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-06.jpg" width="370" height="270" alt=""></a>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">Tr??i d??u t???m: M??n ??n ngon, v??? thu???c qu??!</a></h4>--%>
<%--                                    <p class="post-archive"><b class="post-cat">ORGANIC</b><span class="post-date"> / 26-12</span><span class="author">????ng b???i: Braum J.Teran</span></p>--%>
<%--                                    <p class="excerpt">N??i ?????n d??u t???m, ai c??ng ngh?? ngay ?????n v???i v??c, t?? l???a. Nh??ng d??u t???m c??ng l?? m???t c??y thu???c qu?? v???i nhi???u c??ng d???ng kh??c nhau...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">T??m hi???u th??m</a>--%>
<%--                                        <a href="#" class="btn count-number liked"><i class="biolife-icon icon-heart-1"></i><span class="number">20</span></a>--%>
<%--                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number">06</span></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">--%>
<%--                            <div class="post-item effect-04 style-bottom-info">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-02.jpg" width="370" height="270" alt=""></a>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">4 ??i???u s??? x???y ra n??u b???n kh??ng ch???u ??n rau</a></h4>--%>
<%--                                    <p class="post-archive"><b class="post-cat">ORGANIC</b><span class="post-date"> / 26-12</span><span class="author">????ng b???i: Braum J.Teran</span></p>--%>
<%--                                    <p class="excerpt">Ch???c c??c b???n c??ng ???? nghe gi???ng gi???i qu?? nhi???u v??? l???i ??ch c???a vi???c ??n rau ????ng kh??ng? Tuy nhi??n, c?? v??? nh?? nh???ng b??i gi???ng n??y...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">T??m hi???u th??m</a>--%>
<%--                                        <a href="#" class="btn count-number liked"><i class="biolife-icon icon-heart-1"></i><span class="number">20</span></a>--%>
<%--                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number">06</span></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">--%>
<%--                            <div class="post-item effect-04 style-bottom-info">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-05.jpg" width="370" height="270" alt=""></a>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">11+ l???i ??ch s???c kh???e c???a d??u t??y, nh???ng ??i???u c???n l??u ??</a></h4>--%>
<%--                                    <p class="post-archive"><b class="post-cat">ORGANIC</b><span class="post-date"> / 26-12</span><span class="author">????ng b???i: Braum J.Teran</span></p>--%>
<%--                                    <p class="excerpt">Khi nh???c ?????n d??u t??y, ch???c h???n ai c??ng bi???t r?? v??? nh???ng l???i ??ch s???c ?????p m?? lo???i th???c ph???m n??y mang l???i...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">T??m hi???u th??m</a>--%>
<%--                                        <a href="#" class="btn count-number liked"><i class="biolife-icon icon-heart-1"></i><span class="number">20</span></a>--%>
<%--                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number">06</span></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">--%>
<%--                            <div class="post-item effect-04 style-bottom-info">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-04.jpg" width="370" height="270" alt=""></a>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">11+ l???i ??ch s???c kh???e c???a d??u t??y, nh???ng ??i???u c???n l??u ??</a></h4>--%>
<%--                                    <p class="post-archive"><b class="post-cat">ORGANIC</b><span class="post-date"> / 26-12</span><span class="author">????ng b???i: Braum J.Teran</span></p>--%>
<%--                                    <p class="excerpt">Khi nh???c ?????n d??u t??y, ch???c h???n ai c??ng bi???t r?? v??? nh???ng l???i ??ch s???c ?????p m?? lo???i th???c ph???m n??y mang l???i...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">T??m hi???u th??m</a>--%>
<%--                                        <a href="#" class="btn count-number liked"><i class="biolife-icon icon-heart-1"></i><span class="number">20</span></a>--%>
<%--                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number">06</span></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                        <li class="post-elem col-lg-4 col-md-4 col-sm-6 col-xs-12">--%>
<%--                            <div class="post-item effect-04 style-bottom-info">--%>
<%--                                <div class="thumbnail">--%>
<%--                                    <a href="chitietBlog.jsp" class="link-to-post"><img src="assets/images/our-blog/post-thumb-03.jpg" width="370" height="270" alt=""></a>--%>
<%--                                </div>--%>
<%--                                <div class="post-content">--%>
<%--                                    <h4 class="post-name"><a href="chitietBlog.jsp" class="linktopost">5 l?? do b???n c???n th??m qu??? m???ng trong cu???c s???ng ??? Fitbit Blog</a></h4>--%>
<%--                                    <p class="post-archive"><b class="post-cat">ORGANIC</b><span class="post-date"> / 20 Nov, 2018</span><span class="author">Posted By: Braum J.Teran</span></p>--%>
<%--                                    <p class="excerpt">??n b???t k??? lo???i tr??i c??y n??o c??ng l?? m???t ?????ng th??i l??nh m???nh. Nh??ng n???u b???n th???c s??? mu???n...</p>--%>
<%--                                    <div class="group-buttons">--%>
<%--                                        <a href="chitietBlog.jsp" class="btn readmore">T??m hi???u th??m</a>--%>
<%--                                        <a href="#" class="btn count-number liked"><i class="biolife-icon icon-heart-1"></i><span class="number">20</span></a>--%>
<%--                                        <a href="#" class="btn count-number commented"><i class="biolife-icon icon-conversation"></i><span class="number">06</span></a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </li>--%>
                    </ul>

                </div>

                <!--Panigation Block-->
                <div class="biolife-panigations-block ">
                    <ul class="panigation-contain">
                        <li><a href="#" class="link-page">1</a></li>
                        <li><a href="#" class="link-page">2</a></li>
                        <li><a href="#" class="link-page">3</a></li>
                        <li><span class="sep">....</span></li>
                        <li><a href="#" class="link-page">20</a></li>
                        <li><a href="#" class="link-page next"><i class="fa fa-angle-right" aria-hidden="true"></i></a></li>
                    </ul>
                </div>

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
            strVar += "                                                            <div class=\"product-title\"><a  class=\"product-name\">vui l??ng ????ng nh???p ????? m??? ch???c n??ng gi??? h??ng<\/a><\/div>";
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
                    realData += "                                                                <ins><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+mydata[i].product.price_discount+" ??<\/span><\/ins>";
                    realData += "                                                                <del><span class=\"price-amount\"><span class=\"currencySymbol\"><\/span>"+mydata[i].product.price+" ??<\/span><\/del>";
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
</body>

</html>