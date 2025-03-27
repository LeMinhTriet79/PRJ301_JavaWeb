<%-- 
    Document   : cart
    Created on : Mar 16, 2025, 3:04:54 PM
    Author     : frost
--%>

<%@page import="dto.SnackDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="assets/css/cart.css">
    </head>
    <body>
    <div class="container">
        <% if (session.getAttribute("wishlist") != null) { 
            List<SnackDTO> wishlist = (List<SnackDTO>) session.getAttribute("wishlist"); 
        %>
        <div class="header">
            <h1>List of item:</h1>
        </div>
        <div class="table-container">
            <table border="1">
                <tr>
                    <td>snackId</td>
                    <td>picture</td>
                    <td>name</td>
                    <td>region</td>
                    <td>unit</td>
                    <td>price</td>
                    <td>action</td>
                </tr>
                <% for (SnackDTO s : wishlist) { %>
                <tr>
                    <td><%=s.getSnackId()%></td>
                    <td><img src="<%=s.getPictute()%>" width="150px"></td>
                    <td><%=s.getName()%></td>
                    <td><%=s.getRegion()%></td>
                    <td><%=s.getUnit()%></td>
                    <td><%=s.getPrice()%></td>
                    <td>
                        <a href="MainController?action=buy&snackId=<%=s.getSnackId()%>&picture=<%=s.getPictute()%>&name=<%=s.getName()%>&region=<%=s.getRegion()%>&unit=<%=s.getUnit()%>&price=<%=s.getPrice()%>">Buy now</a>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
        <% } else { %>
        <div class="no-items">
            <h1>No item in the cart</h1>
        </div>
        <% } %>
    </div>
</body>

</html>
