<%-- 
    Document   : signUpDemo
    Created on : Mar 19, 2024, 4:42:42 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="./css/signUpStyle.css">
    </head>

    <body>
        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form action="signIn" method="post">
                    <h1>Create Account</h1>
                    <input type="text" name="name" placeholder="Name" required/>
                    <input type="password" name="password" placeholder="Password" required/>
                    <input type="email" name="email" placeholder="Email" required/>
                    <input type="text" name="phone" placeholder="Phone" required/>
                    <input type="submit" class="logIn-page-button" value="Sign In">
                </form>
            </div>
            <div class="overlay-container">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button onclick="moveToLogin()" class="ghost">Log In</button>
                    </div>
            </div>
        </div>
    </body>
    <script type="text/javascript">
        function moveToLogin() {
            window.location = "Login.jsp"
        }
    </script>
</html>
