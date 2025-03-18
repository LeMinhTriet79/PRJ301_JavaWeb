<%-- 
    Document   : user
    Created on : Mar 9, 2025, 8:54:49 PM
    Author     : Minh Triet
--%>

<%@page import="dto.BookDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
        <%@include file="header.jsp" %>
        <%           
            UserDTO user = (UserDTO) session.getAttribute("user");
        %>
        <% //Cái này để giữ lại mấy cái chữ vừa gõ
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>
        <h1 style="color: brown">Welcome ....<%= user.getFullName()%></h1>
        <hr/>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="search"/>
            Search Books <input type="text" name="searchTerm" value="<%= searchTerm%>" /><%//Cái này để giữ lại mấy cái chữ vừa gõ%>
            <input type="submit" value="Search" />
        </form>
            
            <a href="bookForm.jsp">
                Add
            </a>
            
        <br/>
        <br/>
        <%
            if (request.getAttribute("books") != null) {
                List<BookDTO> books = (List<BookDTO>) request.getAttribute("books");
        %>
        <table border="1">
            <tr>
                <td>BookID</td>
                <td>Title</td>
                <td>Author</td>
                <td>PublishYear</td>
                <td>Price</td>
                <td>Quantity</td>
                <td>Action</td>
                <td>Edit</td>
            </tr>

            <%
                for (BookDTO b : books) {
            %>    
            <tr>
                <td><%=b.getBookID()%></td>
                <td><%=b.getTitle()%></td>
                <td><%=b.getAuthor()%></td>
                <td><%=b.getPublishYear()%></td>
                <td><%=b.getPrice()%></td>
                <td><%=b.getQuantity()%></td>
                <td>
                    <a href="MainController?action=delete&id=<%=b.getBookID()%>&searchTerm<%=searchTerm%>">
                        <img src="assets/images/Custom-Icon-Design-Pretty-Office-8-Trash-can.256.png" style="width: 25px"/>
                    </a>
                </td>
                <td>
                    <a href="bookForm_edit.jsp">
                        <img src="assets/images/Custom-Icon-Design-Pretty-Office-9-Edit-file.256.png" style="width: 25px"/>
                    </a>
                </td>
            </tr>
            <%
                }
            %>
        </table>


        <% } else { %>
        You do not have permission to access this content<%= searchTerm%>
        <% }%>

        <a href="MainController?action=logout">Logout</a>
    </body>
</html>
