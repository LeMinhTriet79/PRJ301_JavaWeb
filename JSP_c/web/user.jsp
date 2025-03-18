<%-- 
    Document   : user
    Created on : Mar 9, 2025, 8:54:49 PM
    Author     : Minh Triet
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        UserDTO user = (UserDTO) request.getAttribute("user");
        %>
        <h1 style="color: brown">Welcome ....<%= user.getFullName() %></h1>
    </body>
</html>
