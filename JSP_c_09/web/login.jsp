<%-- 
    Document   : login
    Created on : Mar 9, 2025, 7:58:55 PM
    Author     : Minh Triet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file ="header.jsp"%>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login" />
            User ID: <input type="text" name="strUserID"  /><br/>
            Password: <input type="password" name="strPassword" />
            <input type="submit" value="Login" />
        </form>
        
        <% 
            String message = request.getAttribute("message") + "";
        %>
        <%=message.equals("null")?"":message%>
        
        
        <%@include file="footer.jsp" %>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
