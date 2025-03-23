<%-- 
    Document   : admin
    Created on : Mar 1, 2022, 8:29:12 PM
    Author     : hd
--%>


<%@page import="pe.dto.HouseDTO"%>
<%@page import="java.util.List"%>
<%@page import="pe.dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>House List</title>
    </head>
    <body>
        <%
                UserDTO user = (UserDTO) session.getAttribute("user");
                
        %>
        <h1 style="color: blue">Welcome <%=user.getName()%></h1>    
        <hr/>
        <a href="MainController?action=logout">Logout</a><br/>
        <hr/>
        
        <%
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null")?"":searchTerm;
        %>
        
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="search" />
            Search <input type="text" name="searchTerm" value="<%=searchTerm%>" />
            <input type="submit" value="Ok" />
        </form>
        
            <hr/>
       <%
           List<HouseDTO> listHouse = (List<HouseDTO>) request.getAttribute("listHouse");
           

       
       %>
            
       <%
           if(listHouse != null){%>
               
           <table border="1">
               <thead>
                   <tr>
                       <th>[id]</th>
                       <th>[name]</th>
                       <th>[description]</th>
                       <th>[price]</th>
                       <th>[size]</th>
                       <th>[status]</th>
                       <th>action</th>
                   </tr>
               </thead>
              
           </table>
           
           <%
               for (HouseDTO h : listHouse) { %>
                    <table border="1">
               <thead>
                   <tr>
                       <th><%=h.getId()%></th>
                       <th><%=h.getName()%></th>
                       <th><%=h.getDescription()%></th>
                       <th><%=h.getPrice()%></th>
                       <th><%=h.getSize()%></th>
                       <th><%=h.getStatus()%></th>
                       <th><a href="MainController?action=delete&id=<%=h.getId()%>">delete</a></th>
                   </tr>
               </thead>
              
           </table>    
               
               
                 <%  } %>
           
           
           
        <% }%>  
       
       
            
    </body>
</html>
