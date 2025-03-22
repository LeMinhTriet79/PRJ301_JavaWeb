<%-- 
    Document   : admin
    Created on : Mar 1, 2022, 8:29:12 PM
    Author     : hd
--%>


<%@page import="java.util.LinkedList"%>
<%@page import="pe.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="pe.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>product Page</title>
    </head>
    <body>
        <%
            UserDTO user =(UserDTO) session.getAttribute("user");
        %>
        
        
         <% 
             String searchTerm = request.getAttribute("searchTerm") + "";
             searchTerm = searchTerm.equals("null")?"":searchTerm;
             List<ProductDTO> productList = (List<ProductDTO>) request.getAttribute("productList");
         
         %>
        
        <h1 style="color: red"> Welcome <%=user.getFullName()%></h1>
         <hr/>
         <a href="MainController?action=logout" style="color: blue">Logout</a>
         <hr/>
         <form action="MainController" method="POST">
             <input type="hidden" name="action" value="search" />
             Search   <input type="text" name="searchTerm"  value="<%=searchTerm%>" />
          <input type="submit" value="OK" />
         </form>
         
         <hr/>
          <table border="1">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>name</th>
                        <th>description</th>
                        <th>price</th>
                        <th>size</th>
                        <th>status</th>
                        <th>action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        <%
            if(productList != null) { %>
             
           <%
               for (ProductDTO p : productList) { %>
                       <table border="1">
                <thead>
                    <tr>
                        <th><%=p.getId()%></th>
                        <th><%=p.getName()%></th>
                        <th><%=p.getDescription()%></th>
                        <th><%=p.getPrice()%></th>
                        <th><%=p.getSize()%></th>
                        <th><%=p.getStatus()%></th>
                        <th><a href="MainController?action=delete&id=<%=p.getId()%>&searchTerm=<%=searchTerm%>">delete</a></th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
                   <%}%>
        

                
          <% } %>
        
      
         
         
    </body>
</html>
