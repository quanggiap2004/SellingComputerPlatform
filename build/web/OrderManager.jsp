<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/style.css?v=1.">
        <link rel="stylesheet" href="./css/cartStyle.css?v=1.1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    </head>
    <body>
        <div class="container admin-header">
            <h1 class="admin-header-title">Welcome ${sessionScope.account.username}</h1>
            <button class="logout-button" onclick="logOut()">Log Out</button>
            <div class="form-container">
                <form action="AdminController" method="post" class="admin-form">
                    <input type="submit" class="form-submit-button" name="action" value="Product">
                </form>
                <form action="AdminController" method="post" class="admin-form">
                    <input type="submit" class="form-submit-button" name="action" value="Order">
                </form>
                <form action="AdminController" method="post" class="admin-form">
                    <input type="submit" class="form-submit-button" name="action" value="Account">
                </form>
            </div>
        </div>


        <div class="container cart-zone">
            <div class="row">
                <div class="search-category_title">
                    <h3>Order Management</h3>
                </div>
            </div>
        </div>
        <div>
            <table border="1px">
                <tr>
                    <td>No</td>
                    <td>Customer name</td>
                    <td>Created Date</td>
                    <td>Status</td>
                    <td>Total Amount</td>
                    <td>Address</td>
                    <td>Phone</td>
                    <td>Action</td>
                </tr>
                <c:set var="count" value="${1}"/>
                <c:forEach var="o" items="${requestScope.list}">
                    
                    <tr>

                        <td>${count}</td>
                        <td>${o.getUserNameByCartId()}</td>
                        <td>${o.createdDate}</td>
                        <td>${o.status}</td>
                        <td><fmt:formatNumber value="${o.totalAmount}" type="number" groupingUsed="false" maxFractionDigits="0"/></td>
                        <td>${o.address}</td>
                        <td>${o.phone}</td>
                        <td>
                            <input type="hidden" name="order_id" value="${o.order_id}">
                            <input type="button" onclick="deleteById(${o.order_id})" value="Delete">
                        </td>
                    </tr>
                    <c:set var="count" value="${count + 1}"/>
                </c:forEach>
            </table>
        </div>

        <script>
            function logOut() {
                window.location = "Login.jsp";
            }

            function deleteById(id) {
                window.location = "adminDelete?action=Order&id=" + id;
            }
        </script>
    </body>
</html>
