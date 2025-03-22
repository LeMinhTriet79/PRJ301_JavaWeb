<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
    </head>
    <body>
        <h1>Login</h1>
        <hr/>
        <!--your code here-->
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="login" />
            Username <input type="text" name="txtUsername" /> <br/>
            Password <input type="password" name="txtPassword" /> <br/>
            <input type="submit" value="Submit" />
            <%
                String message = request.getAttribute("message") + "";
                message = message.equals("null")?"":message;
            %>
           
        </form>
             <h4 style="color: red"> <%= message%><h4/>
              
    </body>
</html>
