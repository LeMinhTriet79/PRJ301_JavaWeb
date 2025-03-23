<%@page import="pe.appointment.AppointmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="pe.account.AccountDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of the appointments </title>
    </head>
    <body>
        <h1>The appointments</h1>
        <hr/>
        <!--your code here-->
        <%
            AccountDTO acc =(AccountDTO) session.getAttribute("acc");
            
        %>
        <h3 style="color: red"s> Welcome <%= acc.getFullName()%></h3>
        <a href="MainController?action=logout" style="color: red">Logout</a>
        
        <%
            if(acc.getRoleDB().equals("super")){ %>
                <a href="create.jsp" style="color: blue">Create</a>
                
          <%  }else{ %>
                If you are admin, you can create a appointments
          <%}%>
        
        
       
        
         
        <hr/>
        <%
            if(request.getAttribute("applist") != null){
                List<AppointmentDTO> applist = (List<AppointmentDTO>) request.getAttribute("applist");
            
            %>
               
            <table border="1">
                <thead>
                    <tr>
                        <th>idApp</th>
                        <th>account</th>
                        <th>partnerPhone</th>
                        <th>partnerName</th>
                        <th>timeToMeet</th>
                        <th>place</th>
                        <th>expense</th>
                        <th>note</th>
                    </tr>
                    
        <%
            for (AppointmentDTO app : applist) {
          %> 
          <tr>
              <th><%= app.getIdApp()%></th>
              <th><%=app.getAccount() %></th>
              <th><%=app.getPartnerName()%></th>
              <th><%=app.getPartnerPhone() %></th>
              <th><%=app.getTimeToMeet() %></th>
              <th><%=app.getPlace()%></th>
              <th><%=app.getExpense()%></th>
              <th><%=app.getNote()%></th>
              
          </tr>

     <% 
                 }
        %>            
                    
                </thead>
                <tbody>
                </tbody>
            </table>

            
            
            
            <% 
                } else {
            %>
            <h3>Null</h3>
            <%
                }
            %>
        
    </body>
</html>
