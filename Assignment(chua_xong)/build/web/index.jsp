<%-- 
    Document   : guest
    Created on : Mar 18, 2025, 8:55:08 AM
    Author     : frost
--%>

<%@page import="dto.SnackDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guest</title>
        <link rel="stylesheet" href="assets/css/guest.css">
    </head>
    <body>
    <div class="container">
        <div class="header">
            <h1>Welcome guest</h1>
            <a href="login.jsp">Back to login page</a>
        </div>
        <div class="search-form">
            <form action="MainController">
                <input type="hidden" name="action" value="guestsearch"/>
                <label for="txtGuestSearchTerm">Search snack:</label>
                <input type="text" id="txtGuestSearchTerm" name="txtGuestSearchTerm" placeholder="Enter the name of the snack"/><br/>
                <input type="submit" value="Search"/><br/> 
            </form>
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
                </tr>
                <%
                    if (request.getAttribute("guestFoundList") != null) {
                        List<SnackDTO> guestFoundList = (List<SnackDTO>) request.getAttribute("guestFoundList");
                        for (SnackDTO s1 : guestFoundList) {
                %>
                <tr>
                    <td><%=s1.getSnackId()%></td>
                    <td><img src="<%=s1.getPictute()%>" width="150px"></td>
                    <td><%=s1.getName()%></td>
                    <td><%=s1.getRegion()%></td>
                    <td><%=s1.getUnit()%></td>
                    <td><%=s1.getPrice()%></td> 
                </tr>
                <%}%>
                <%} else {%>
                <%
                    if (request.getAttribute("guestSnackList") != null) {
                        List<SnackDTO> guestSnackList = (List<SnackDTO>) request.getAttribute("guestSnackList");
                        for (SnackDTO s2 : guestSnackList) {
                %>
                <tr>
                    <td><%=s2.getSnackId()%></td>
                    <td><img src="<%=s2.getPictute()%>" width="150px"></td>
                    <td><%=s2.getName()%></td>
                    <td><%=s2.getRegion()%></td>
                    <td><%=s2.getUnit()%></td>
                    <td><%=s2.getPrice()%></td>                        
                </tr>
                <%}%>
                <%}%> 
                <%}%> 
            </table>
        </div>
    </div>
</body>
</html>
