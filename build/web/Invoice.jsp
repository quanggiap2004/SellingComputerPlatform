<%-- 
    Document   : Invoice
    Created on : Mar 21, 2024, 7:17:24 PM
    Author     : acer
--%>

<%@page import="model.Account"%>
<%@page import="model.OrderManage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css?v=1.2">
        <link rel="stylesheet" href="./css/cartStyle.css?v=1.1">
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
        <div class="banner-thankyou">
            <img src="./images/image_2b4beb5a-c164-4dab-8227-a93b46486daa_580x.webp" alt="banner">
        </div>
        <div class="container invoice">
            <div class="row">
                <div class="invoice_title">
                    <h3>Your invoice</h3>
                </div>
            </div>
            <% OrderManage ord = (OrderManage) request.getAttribute("invoice");
                Account account = (Account) session.getAttribute("account");
                String username = account.getUsername();
            %>
            <div class="row">
                <form action="checkout" method="post">
                    <div class="row Ship_date">
                        <label class="col-md-4 ship_label">Customer name:</label>
                        <input type="text" class="col-md-8 Ship-text-input" value="<%=username%>" readonly>
                        <label class="col-md-4 ship_label">Total:</label>
                        <input type="text" class="col-md-8 Ship-text-input" value="<fmt:formatNumber value="<%=ord.getTotalAmount()%>" type="number" groupingUsed="true" maxFractionDigits="0"/>"readonly>
                        <label class="col-md-4 ship_label">Order Date:</label>
                        <input type="text" class="col-md-8 Ship-text-input" name="orderDate" value="<%=ord.getCreatedDate()%>" readonly>
                        <label class="col-md-4 ship_label">Expected Arrived Date:</label>
                        <input type="text" class="col-md-8 Ship-text-input" name="deliveryDate" value="${requestScope.deliveryDate}" readonly>
                    </div>
                    <div class="row  information">
                        <label class="col-md-4 ship_label">Phone:</label>
                        <input type="text" class="col-md-8 Ship-text-input" name="phone" value="<%=ord.getPhone()%>" readonly>
                        <label class="col-md-4 ship_label">Address:</label>
                        <input type="text" class="col-md-8 Ship-text-input" name="address" value="<%=ord.getAddress()%>" readonly>
                    </div>
                </form>
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
    </body>
</html>
