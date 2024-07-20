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
                    <h3>Account Management</h3>
                </div>
            </div>
        </div>
        <div>
            <table border="1px">
                <tr>
                    <td>No</td>
                    <td>Username</td>
                    <td>Password</td>
                    <td>Phone</td>
                    <td>Email</td>
                    <td>Role</td>
                    <td>Status</td>
                    <td>Action</td>
                </tr>
                <c:set var="count" value="${1}"/>
                <c:forEach var="o" items="${requestScope.list}">
                    <tr>
                    <form action="adminUpdate" method="post">
                        <td>${count}</td>
                        <td><input type="text" name="username" value="${o.username}"></td>
                        <td><input type="text" name="password" value="${o.password}"></td>
                        <td><input type="text" name="phone" value="${o.phone}"></td>
                        <td><input type="text" name="email" value="${o.email}"></td>
                        <td><input type="text" name="role" value="${o.role}" readonly></td>
                        <td><input type="text" name="status" value="${o.status}"></td>
                        <td>
                            <input type="hidden" name="userId" value="${o.userId}">
                            <input type="hidden" name="action" value="Account">
                            <input type="submit" name="Update" value="Update">
                            <input type="button" onclick="deleteById(${o.userId})" value="Delete">
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
                window.location = "adminDelete?action=Account&id=" + id;
            }
        </script>
    </body>
</html>
