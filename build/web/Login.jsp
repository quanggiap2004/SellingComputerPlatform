<%-- 
    Document   : loginDemo
    Created on : Mar 19, 2024, 3:50:38 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="./css/loginStyle.css?v=1.2">
    </head>

    <body>
        <div class="container" id="container">
            <c:set var="cookie" value="${pageContext.request.cookies}"/>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Log In</h1>
                    <input type="text" name="username" value="${cookie.cuser.value}" placeholder="Username" />
                    <input type="password" name="password" value="${cookie.cpass.value}" placeholder="Password" />
                    <div class="rem_box">
                        <input type="checkbox" name="rem" ${(cookie.crem.value != null?'checked':'')} value="ON">
                        <p>Remember me</p>
                    </div>
                    <input type="submit" class="logIn-page-button" value="Log In">
                    <p>${requestScope.ms}</p>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-right">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button onclick="moveToSignUp()" class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        function moveToSignUp() {
            window.location = "SignUp.jsp";
        }
    </script>
</html>
