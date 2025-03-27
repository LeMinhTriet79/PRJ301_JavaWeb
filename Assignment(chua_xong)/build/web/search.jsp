<%-- 
    Document   : search
    Created on : Mar 14, 2025, 9:21:20 AM
    Author     : frost
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.SnackDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link rel="stylesheet" href="assets/css/search.css">
    </head>
    <body>
        <div class="container">
            <%
                String searchTerm = request.getAttribute("searchTerm") + "";
                searchTerm = searchTerm.equals("null")?"":searchTerm;
            %>
            <% if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>
            <div class="header">
                <h1>Welcome <%=user.getFullname()%></h1>
                <form action="MainController">
                    <input type="hidden" name="action" value="logout" />
                    <input type="submit" value="Logout" /><br />
                </form>
                  <%if (AuthUtils.isAdmin(session)) {%>
                  <a href="create.jsp">Add a new project</a>
                         <% } %>
                
                <a href="cart.jsp">
                    <img src="assets/cart icon.png" width="32" height="32" alt="Cart">
                </a>
                <a href="buy.jsp">
                    <img src="assets/delivery icon.jpg" width="32" height="32" alt="Cart">
                </a>
            </div>

            <div class="search-form">
                <form action="MainController">
                    <input type="hidden" name="action" value="search" />
                    Search snack: <input type="text" name="txtSearchTerm" placeholder="Enter the name of the snack" value="<%=searchTerm%>"/><br />
                    <input type="submit" value="Search" /><br />
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
                        <td>action</td>
                    </tr>
                    
                    <% if (request.getAttribute("foundList") != null) {
                            List<SnackDTO> foundList = (List<SnackDTO>) request.getAttribute("foundList");
                            for (SnackDTO s1 : foundList) {%>
                    <tr>
                        <td><%=s1.getSnackId()%></td>
                        <td><img src="<%=s1.getPictute()%>" width="150px"></td>
                        <td><%=s1.getName()%></td>
                        <td><%=s1.getRegion()%></td>
                        <td><%=s1.getUnit()%></td>
                        <td><%=s1.getPrice()%></td>

                        <%if (AuthUtils.isAdmin(session)) {%>
                        <td>
                            <a href="edit.jsp?snackId=<%=s1.getSnackId()%>&picture=<%=s1.getPictute()%>&name=<%=s1.getName()%>&region=<%=s1.getRegion()%>&unit=<%=s1.getUnit()%>&price=<%=s1.getPrice()%>">
                                Edit
                            </a><br />
                            <a href="MainController?action=delete&deletedSnackId=<%=s1.getSnackId()%>">
                                Delete
                            </a><br />

                       </td>
                         <% } %>
                       <td> <a href="MainController?action=wish&snackId=<%=s1.getSnackId()%>&picture=<%=s1.getPictute()%>&name=<%=s1.getName()%>&region=<%=s1.getRegion()%>&unit=<%=s1.getUnit()%>&price=<%=s1.getPrice()%>">
                                Add to cart
                            </a></td>
                   </tr>         

                    
                  
                    
                           <% } %>
                            
                    <%    } %>
                </table>
            </div>
            <% } else { %>
            <div class="no-access">
                <h1>You do not have permission to access this content</h1>
            </div>
            <% }%>
        </div>
    </body>

</html>
