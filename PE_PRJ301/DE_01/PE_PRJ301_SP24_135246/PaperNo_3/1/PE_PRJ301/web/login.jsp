<%-- 
    Document   : login
    Created on : Mar 11, 2022, 9:02:11 PM
    Author     : hd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <!--your code here-->
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="login" />
            Username <input type="text" name="txtUsername"/> <br/>
            Password <input type="password" name="txtUsername"/><br/>
            <input type="submit" value="Submit" />
            
            <%
                String message = request.getAttribute("message") + "";
                message = message.equals("null")?"":message;
            %>
            <h4 style="color: red"><%= message%><h4/>
        </form>
    </body>
    
</html>

