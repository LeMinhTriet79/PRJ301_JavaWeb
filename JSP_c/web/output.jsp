<%-- 
    Document   : output
    Created on : Mar 9, 2025, 2:35:52 PM
    Author     : Minh Triet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int n = (int) request.getAttribute("n");
         %>
            <h3>Bảng cửu chương <%=n%></h3>
        <%
            for (int j = 1; j <= 10; j++) {
        %>  
        <%= n%> x <%= j%> = <%= (n * j)%> <br/>
 
        <%   }
        %>
       
    </body>
</html>
