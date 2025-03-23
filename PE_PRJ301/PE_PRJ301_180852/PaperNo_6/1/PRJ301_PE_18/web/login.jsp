<%-- 
    Document   : login
    Created on : Aug 7, 2024, 11:04:18 AM
    Author     : hoadnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login Information</h1>
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="login" />
            UserID  <input type="text" name="txtUserID"   /> <br/>
            Password <input type="text" name="txtPassword"  />
            <input type="submit" value="submit" />
        </form>
        <%
            String message = request.getAttribute("message") + "";
            message = message.equals("null")?"":message;
        %>
        <h3 style="color: red"><%=message%></h3>
    </body>
</html>
