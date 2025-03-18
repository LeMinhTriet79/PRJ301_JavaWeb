<%-- 
    Document   : bookForm
    Created on : Mar 16, 2025, 10:21:12 AM
    Author     : Minh Triet
--%>

<%@page import="dto.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            BookDTO book = new BookDTO();
            try {
                    book = (BookDTO) request.getAttribute("book");
                } catch (Exception e) {
                }
            if(book == null){
                book = new BookDTO();
            }
            
            String txtBookID_error = request.getAttribute("txtBookID_error") +"";
            txtBookID_error = txtBookID_error.equals("null")?"": txtBookID_error;
            
             String txtQuantity_error = request.getAttribute("txtQuantity_error") +"";
            txtQuantity_error = txtQuantity_error.equals("null")?"": txtQuantity_error;

                
            %>
        
        <form action="MainController" method="post" >
            <input type="hidden" name="action" value="add" />
            Book ID <input type="text" name ="txtBookID" value="<%= book.getBookID()%>" /><span style="color: red"><%= txtBookID_error%></span><br/>
            Title <input type="text" name ="txtTitle" value="<%= book.getTitle()%>"/><br/>
            Author <input type="text" name ="txtAuthor" value="<%= book.getAuthor()%>"/><br/>
            Publish Year <input type="number" name ="txtPublishYear" value="<%= book.getPublishYear()%>"/><br/>
            Price <input type="number" name ="txtPrice"value="<%= book.getPrice()%>"/><br/>
            Quantity <input type="number" name ="txtQuantity" value="<%= book.getQuantity()%>"/><span style="color: red"><%= txtQuantity_error%></span><br/>
            <input type="submit" value="Save" />
            <input type="reset" value="Reset" />
        </form>
    </body>
</html>
