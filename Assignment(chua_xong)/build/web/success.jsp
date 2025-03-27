<%-- 
    Document   : success
    Created on : Mar 16, 2025, 10:52:27 AM
    Author     : frost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
    </head>
    <body>
        <%
            if (request.getAttribute("success") != null){
        %>
        <h1>Create successfully</h1><br/>
        <a href ="login.jsp">Click here to login</a>
        <%}else{%>
        <h1>You do not have permission to access this content</h1>
        <%}%>
    </body>
</html>
