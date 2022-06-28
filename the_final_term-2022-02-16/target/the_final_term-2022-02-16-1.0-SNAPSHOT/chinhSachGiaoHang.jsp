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
    <title>chính sách giao hàng</title>
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
        <h1 class="page-title">CHÍNH SÁCH GIAO HÀNG</h1>
        <nav class="biolife-nav">
            <ul>
                <li class="nav-item"><a href="index-2.jsp" class="permal-link">Trang chủ</a></li>
                <li class="nav-item"><span class="current-page">Các Blog</span></li>
            </ul>
        </nav>
    </div>

    <!-- Page Contain -->
    <div class="page-contain blog-page left-sidebar">
        <div class="container">
            <div class="row">

                <!-- Main content -->
                <div id="main-content" class="main-content col-lg-9 col-md-8 col-sm-12 col-xs-12">

                    <!--Single Post Contain-->
                    <div class="single-post-contain">

                        <div class="post-head">
                            <div class="thumbnail">
                                <figure><img src="assets/images/blogpost/chinhSachGiaoHang.jpg" width="470" height="335" alt=""></figure>
                            </div>
                            <h2 class="post-name"></h2>
                        </div>

                        <div class="post-content">
                            <h1 style="font-size: 30px ;color: black">GIAO HÀNG TẠI RAU SẠCH THỰC PHẨM MIỀN TÂY</h1>
                            <p>Nhằm đáp ứng nhu cầu rất cao về sử dụng rau củ quả an toàn, tập trung các loại rau củ quả tốt cho sức khỏe cho người tiêu dùng.</p>
                            <p>CÔNG TY TNHH MTV THỰC PHẨM MIỀN TÂY kinh doanh theo tiêu chí “ tất cả vì lợi ích của khách hàng”. Chúng tôi chuyên cung cấp rau củ quả sạch cho các nhà hàng, khách sạn, bếp ăn công ty, trường học ... trên địa bàn thành phố Hồ Chí Minh và các tỉnh lân cận do vậy quý doanh nghiệp nào có nhu cầu hợp tác vui lòng liên hệ với chúng tối theo số: 0935 976 226 - 0906 305 212</p>
                            <h1  style="font-size: 24px ;color: black">HÌNH THỨC GIAO HÀNG LINH HOẠT, NHANH CHÓNG:</h1>
                            <p>- Chốt đơn hàng trước chiều hôm nay, giao hàng trong sáng hôm sau theo giờ quy định của khách hàng.</p>
                            <p >- Miễn phí giao hàng cho tổng đơn hàng trị giá trên 500,000 đồng.</p>
                            <p >- Nhận đổi trả hàng nếu hàng không đạt yêu cầu.</p>
                            <p >Cam kết luôn duy trì giá với mức theo sát giá thị trường, giá ngang bằng với các điểm chợ sỉ.</p>
                            <p >RAU CỦ QUẢ luôn được đóng gói sạch sẽ trước khi giao hàng.</p>
                            <p ><em><strong>Mọi chi tiết xin liên hệ:</strong></em></p>
                            <p>Địa chỉ: 861/72/11 Trần Xuân Soạn, P. Tân Hưng, Quận 7, TP. HCM</p>
                            <p>Điện thoại:&nbsp;0909 632 112 - 0906 305 212</p>
                            <p>Email:&nbsp;mekongfreshfood@gmail.com</p>
                            <p>Website: rausachgiasi.com</p>

                        </div>

                    </div>

                </div>

                <!-- Sidebar -->
                <aside id="sidebar" class="sidebar blog-sidebar col-lg-3 col-md-4 col-sm-12 col-xs-12">

                    <div class="biolife-mobile-panels">
                        <span class="biolife-current-panel-title">Sidebar</span>
                        <a class="biolife-close-btn" href="#" data-object="open-mobile-filter">&times;</a>
                    </div>

                    <div class="sidebar-contain">



                        <!--Categories Widget-->
                        <div class="widget biolife-filter">
                            <h4 class="wgt-title">Các loại chính</h4>
                            <div class="wgt-content">
                                <ul class="cat-list">
                                    <li class="cat-list-item"><a href="#" class="cat-link">Các sản phẩm khuyễn mãi</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">các sản phẩm bán chạy</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">Trái cây</a></li>
                                    <li class="cat-list-item"><a href="#" class="cat-link">rau,củ,quả</a></li>
                                </ul>
                            </div>
                        </div>
                        <!--Posts Widget-->
                        <div class="widget posts-widget">
                            <h4 class="wgt-title">Bài viết gần đây</h4>
                            <div class="wgt-content">
                                <ul class="posts">
                                    <%
                                        for (Blog b:(List<Blog>)request.getAttribute("relateBlogs")
                                             ) {
                                            String link = "ChiTietBlog?id_blog="+b.getId_blog();

                                    %>
                                    <li>
                                        <div class="wgt-post-item">
                                            <div class="thumb">
                                                <a href=<%=link%>>><img src=<%=b.getImg_url()%>> width="80" height="58" alt=""></a>
                                            </div>
                                            <div class="detail">
                                                <h4 class="post-name"><a style="font-size: 13px" href=<%=link%>><%=b.getName()%>></a></h4>
                                                <p class="post-archive"><%=b.getDate_post().toString()%>><span class="comment"><%=b.getNumberComment()%>> Bình luận</span></p>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href=""><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
<%--                                                <p class="post-archive">12-22<span class="comment">08 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-01.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">Lưu trữ và bảo quản rau củ cũng là một “nghệ thuật”</a></h4>--%>
<%--                                                <p class="post-archive">22-12<span class="comment">15 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-02.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">4 điều sẽ xảy ra nếu như bạn không ăn rau</a></h4>--%>
<%--                                                <p class="post-archive">20-12<span class="comment">06 Bình luận</span></p>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </li>--%>
<%--                                    <li>--%>
<%--                                        <div class="wgt-post-item">--%>
<%--                                            <div class="thumb">--%>
<%--                                                <a href="chitietBlog.jsp"><img src="assets/images/blogpost/post-wgt-03.jpg" width="80" height="58" alt=""></a>--%>
<%--                                            </div>--%>
<%--                                            <div class="detail">--%>
<%--                                                <h4 class="post-name"><a href="chitietBlog.jsp" style="font-size: 13px">11+lợi ích sức khỏe của dâu tây,những điều cần lưu ý</a></h4>--%>
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
</body>

</html>