<%-- 
    Document   : admin
    Created on : Aug 7, 2024, 11:40:23 AM
    Author     : hoadnt
--%>


<%@page import="dto.RoomDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room List Page</title>
    </head>
    <body>
        <%
            UserDTO user = (UserDTO) session.getAttribute("user");
            
        %>
        <h1 style="color: blue">Welcome <%= user.getFullName()%></h1>
        <hr/>
        <a href="MainController?action=logout" style="color: red">Logout</a>
        
        
        <hr/>
        <form method="POST">
            <input type="hidden" name="action" value="search" />
            Search <input type="text" name="searchTerm" value="" />
            <input type="submit" value="ok" />
        </form>
        
        <hr/>
        
       <%
            List<RoomDTO> listRoom = (List<RoomDTO>) request.getAttribute("listRoom");
        %>    
        
        
          <%      if(listRoom != null){ %>
          <table border="1">
              <thead>
                  <tr>
                      <th>[id]</th>
                      <th>[name]</th>
                      <th>[description]</th>
                      <th>[price]</th>
                      <th>[area]</th>
                      <th>[status]</th>
                  </tr>
              </thead>
              <tbody>
              </tbody>
          </table>

          <%
              for (RoomDTO r : listRoom) { %>
                      <table border="1">
              <thead>
                  <tr>
                      <th><%=r.getId()%>></th>
                      <th><%=r.getName()%></th>
                      <th><%=r.getDescription()%></th>
                      <th><%=r.getPrice()%></th>
                      <th><%=r.getArea()%></th>
                      <th><%=r.getStatus()%></th>
                  </tr>
              </thead>
              <tbody>
              </tbody>
          </table>
                 <% } %>
          
       
          
          
          
          
              <%  } %>
       
       
       
        
    </body>
</html>
