<%-- 
    Document   : buy
    Created on : Mar 26, 2025, 5:59:54 PM
    Author     : frost
--%>

<%@page import="dto.SnackDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buy</title>
        <link rel="stylesheet" href="assets/css/buy.css">
    </head>
    <body>
    <div class="container">
        <% if (session.getAttribute("buyingList") != null) { 
            List<SnackDTO> buyingList = (List<SnackDTO>) session.getAttribute("buyingList"); 
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
                    <td>status</td>
                </tr>
                <% for (SnackDTO s : buyingList) { %>
                <tr>
                    <td><%=s.getSnackId()%></td>
                    <td><img src="<%=s.getPictute()%>" width="150px"></td>
                    <td><%=s.getName()%></td>
                    <td><%=s.getRegion()%></td>
                    <td><%=s.getUnit()%></td>
                    <td><%=s.getPrice()%></td>
                    <td style="color: red">Đợi xác nhận</td>
                </tr>
                <% } %>
            </table>
        </div>
        <div class="back-link">
            <a href="cart.jsp">Back to cart</a><br/>
            <a href="search.jsp">Back to main page</a>
        </div>
        <% } else { %>
        <div class="no-items">
            <h1>No item in the cart</h1>
        </div>
        <% } %>
    </div>
</body>

</html>
