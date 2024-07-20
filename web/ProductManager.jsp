<%-- 
    Document   : ProductManager
    Created on : Mar 21, 2024, 8:19:53 PM
    Author     : acer
--%>

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
                    <h3>Product Management</h3>
                </div>
            </div>
        </div>
        <div>
            <table border="1px">
                <tr>
                    <td>No</td>
                    <td>Product Name</td>
                    <td>Category ID</td>
                    <td>Quantity</td>
                    <td>Price</td>
                    <td>Disprice</td>
                    <td>Description</td>
                    <td>Sold</td>
                    <td>Action</td>
                </tr>
                <c:set var="count" value="${1}"/>
                <c:forEach var="o" items="${requestScope.list}">
                    <tr>
                    <form action="adminUpdate" method="post">
                        <td>${count}</td>
                        <td><input type="text" name="prod_name" value="${o.prod_name}"></td>
                        <td><input type="text" name="cat_id" value="${o.cat_id}" readonly></td>
                        <td><input type="number" name="quantity" value="${o.quantity}"></td>
                        <td><input type="text" name="price"
                                   value="<fmt:formatNumber value="${o.price}" type="number" groupingUsed="false" maxFractionDigits="0"/>">
                        </td>
                        <td><input type="text" name="disprice"
                                   value="<fmt:formatNumber value="${o.disprice}" type="number" groupingUsed="false" maxFractionDigits="0"/>">
                        </td>
                        <td><input type="text" name="description" value="${o.description}" readonly></td>
                        <td><input type="text" name="sold" value="${o.sold}"></td>
                        <td>
                            <input type="hidden" name="prod_id" value="${o.prod_id}">
                            <input type="hidden" name="action" value="Product">
                            <input type="submit" name="Update" value="Update">
                            <input type="button" onclick="deleteById(${o.prod_id})" value="Delete">
                        </td>
                    </form>
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
                window.location = "adminDelete?action=Product&id=" + id;
            }
        </script>
    </body>
</html>
