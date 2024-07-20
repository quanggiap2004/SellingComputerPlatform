<%@page import="model.Account"%>
<%@page import="dal.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css?v=1.1">
        <link rel="stylesheet" href="./css/cartStyle.css?v=1.1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <script type="text/javascript">
            function deleteById(id) {
                window.location = "delete?id=" + id;
            }
        </script>
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
        <div class="banner">
            <img src="./images/banner.jpg" alt="banner">
        </div>

        <div class="container cart-zone">
            <div class="row">
                <div class="search-category_title">
                    <h3>Your order</h3>
                </div>
            </div>
            <div class="row">
                <table border="1px">
                    <tr>
                        <td>No</td>
                        <td>Name</td>
                        <td>Quantity</td>
                        <td>Price</td>
                        <td>Total Price</td>
                    </tr>
                    <c:set var="count" value="${1}"/>
                    <c:forEach var="o" items="${requestScope.cart}">
                        <tr>
                            <td>${count}</td>
                            <td>${o.getProduct().getProd_name()}</td>
                            <td>${o.quantity}</td>
                            <td><fmt:formatNumber value="${o.getProduct().getDisprice()}" type="number" groupingUsed="true" maxFractionDigits="0"/> VND</td>
                            <td><fmt:formatNumber value="${o.price}" type="number" groupingUsed="true" maxFractionDigits="0"/> VND</td>
                        </tr>
                        <c:set var="count" value="${count + 1}"/>
                    </c:forEach>
                    <% CartDAO cartDAO = new CartDAO();
                        int cartId = (int) session.getAttribute("cartId");
                        double total = cartDAO.getTotalMoney(cartId);
                    %>
                    <tr class="total-row">
                        <td colspan="4">Total</td>
                        <td colspan="1"><fmt:formatNumber value="<%=total%>" type="number" groupingUsed="true" maxFractionDigits="0"/> VND</td>
                    </tr>
                </table>

            </div>
        </div>


        <div class="container shipping">
            <div class="row">
                <div class="search-category_title">
                    <h3>Shipping information</h3>
                </div>
            </div>
            <div class="row">
                <form action="checkout" method="post">
                    <div class="row Ship_date">
                        <label class="col-md-4 ship_label">Order Date:</label>
                        <input type="text" class="col-md-8 Ship-text-input" name="orderDate" value="${requestScope.orderDate}" readonly>
                        <label class="col-md-4 ship_label">Expected Arrived Date:</label>
                        <input type="text" class="col-md-8 Ship-text-input" name="deliveryDate" value="${requestScope.deliveryDate}" readonly>
                    </div>
                    <div class="row  information">
                        <label class="col-md-4 ship_label">Phone:</label>
                        <input type="text" class="col-md-8 Ship-text-input" name="phone">
                        <label class="col-md-4 ship_label">Address:</label>
                        <input type="text" class="col-md-8 Ship-text-input" name="address">
                    </div>
                    <input type="hidden" name="total" value="<%=total%>">
                    <div class="row">
                        <input class="Ship-submit-input" type="submit" name="action" value="Confirm">
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
