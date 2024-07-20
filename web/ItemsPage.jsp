<%-- 
    Document   : ItemsPageDemo
    Created on : Mar 21, 2024, 12:34:50 AM
    Author     : acer
--%>

<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css?v=1.1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    </head>
    <body>
        <div class="menu-bar">
            <a href="Home.jsp" class="logo">
                <img class="logo-img" src="https://file.hstatic.net/200000636033/file/logo_fd11946b31524fbe98765f34f3de0628.svg">
            </a>
            <div class="menu-bar-right">
                <a href="Home.jsp">Trang Chủ</a>
                <!-- Dropdown Menu -->
                <div class="dropdown">
                    <a href="#" class="dropbtn">Danh Mục</a>
                    <div class="dropdown-content">
                        <jsp:useBean id="category" class="dal.CategoryDAO"/>
                        <c:forEach var="cat" items="${category.all}">
                            <a href="cat?cat_id=${cat.cat_id}&cat_name=${cat.cat_name}">${cat.cat_name}</a>
                        </c:forEach>
                    </div>
                </div>
                <form action="search" method="post" class="search-container">
                    <input type="hidden" name="action" value="Search">
                    <input type="text" name="Search" class="search-input" placeholder="Tìm kiếm...">
                    <button type="submit" class="search-button"><img src="./images/211817_search_strong_icon.png"></button>
                </form>
                <a href="#hotline">Hotline</a>
                <% Account acc = (Account) session.getAttribute("account");
                    if(acc == null) {
                        
                    
                %>
                <a href="Login.jsp">Login</a>
                <%}else{
                %>
                 <a href="out">Log Out</a>
                <%    }
                %>
                <a href="cart">
                    <img class="cart_icon" src="./images/9025885_shopping_cart_icon.png">
                </a>
            </div>
        </div>
        <div class="product-zone">
            <div class="container">
                <div class="product-top">
                    <span><img src="./images/3669170_home_ic_icon.png"></span><p>Trang chủ</p><span>&#10230</span><p>Zenbook</p>
                </div>
                <div class="row">
                    <div class="product-items">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="product-items_img">
                                    <img src="./images/${sessionScope.items.thumbnail}">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="product-items_info">
                                    <div class="product-items_info_name">
                                        <h3>${sessionScope.items.prod_name}</h3>
                                    </div>
                                    <div class="product-items_info_price">
                                        <h4>Giá: <fmt:formatNumber value=" ${sessionScope.items.disprice}" type="number" groupingUsed="true" maxFractionDigits="0"/> VND</h4>
                                    </div>
                                    <div class="product-items_info_description">
                                        <h4>Thông tin chung:</h4>
                                        <p>${sessionScope.items.description}</p>
                                    </div>
                                    <div>
                                        <button class="plus">+</button>
                                        <span class="num">1</span>
                                        <button class="minus">-</button>
                                        <button onclick="submitOrder(${sessionScope.items.prod_id})">Add to cart</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="footer-clean">
                <footer>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-3 item">
                                <h3>Dịch vụ</h3>
                                <ul>
                                    <li><a href="#">Kinh doanh laptop</a></li>
                                    <li><a href="#">Sửa chữa</a></li>
                                    <li><a href="#">Bảo trì laptop</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 item">
                                <h3>Về chúng tôi</h3>
                                <ul>
                                    <li><a href="#">Giới thiệu</a></li>
                                    <li><a href="#">Đội ngũ</a></li>
                                    <li><a href="#">Sản phẩm</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 item">
                                <h3>Tổng đài hỗ trợ</h3>
                                <ul>
                                    <li><a href="#">Hotline: <span class="footer-info">18001069</span></a></li>
                                    <li><a href="#">Bảo hành: <span class="footer-info">19001001</span></a></li>
                                    <li><a href="#">Email: <span class="footer-info">cskh@gearvn.com</span></a></li>
                                </ul>
                            </div>
                            <div class="col-lg-3 item social"><a href="#"><i class="icon ion-social-facebook"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-instagram"></i></a>
                                <p class="copyright">GearVN © 2021</p>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="./js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
