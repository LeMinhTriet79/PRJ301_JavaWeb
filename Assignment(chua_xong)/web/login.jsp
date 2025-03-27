<%-- 
    Document   : login
    Created on : Mar 14, 2025, 8:58:25 AM
    Author     : frost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="assets/css/login.css">
    </head>
    <body>
        <form action="MainController" method="POST">
            <h1>Login form</h1>
            <input type="hidden" name="action" value="login" />
            <label for="txtUsername">Username:</label>
            <input type="text" id="txtUsername" name="txtUsername" />

            <label for="txtPassword">Password:</label>
            <input type="password" id="txtPassword" name="txtPassword" />

            <input type="submit" value="Login" />
            <a href="MainController?action=guest">Login as guest</a>
            <a href="register.jsp">Don't have an account yet? Register here</a>
            <%
                if (request.getAttribute("message") != null) {
                    String message = request.getAttribute("message") + "";
            %>
            <p style ="text-align: center; color: red">Incorrect username or password</p>
            <%}%>
        </form>
    </body>
</html>
