<%-- 
    Document   : newjsp
    Created on : Mar 9, 2025, 2:01:33 PM
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
        <h1 style="color: red">Hello World! JSP - TITV</h1>
        <%! int a = 9;%>
        <%
            double b;
            b = Math.sqrt(a);
        %>

        Kết quả của phép tính căn bậc 2: <%= a%> = <span style="color: red"><%=b%></span>

        <h1 style="color: red">Bảng Cửu Chương</h1>

        <%
            for (int i = 2; i < 10; i++) {
        %>
        <hr/>
        <h3>Bảng cửu chương <%=i%></h3>
        <%
            for (int j = 1; j <= 10; j++) {
        %>  
        <%= i%> x <%= j%> = <%= i * j%> <br/>
 
        <%   }
        %>
        <%
            }
        %>






    </body>
</html>
