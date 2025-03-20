<%-- 
    Document   : login
    Created on : Mar 10, 2025, 7:42:26 AM
    Author     : Minh Triet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workshop_no.01</title>
    <style>
        body {
            font-family: Tahoma, sans-serif;
            background-color: #dfdfdf;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .window {
            width: 300px;
            background: silver;
            border: 2px solid black;
            padding: 10px;
            box-shadow: 5px 5px 0px gray;
        }
        .title-bar {
            background: navy;
            color: white;
            padding: 5px;
            font-weight: bold;
            font-size: 21px;
            width: 100%;
            margin: -10px;
            padding: 10px;
        }
        .content {
            padding: 2px;
            margin: 10px 0px 0px -2px;
            font-size: 15px;
        }
        input[type="text"], input[type="password"] {
            width: 96%;
            border: 2px inset gray;
            padding: 5px;
            margin: 2px 0px -4px 0px;
        }
        button {
            background: lightgray;
            border: 2px outset gray;
            padding: 5px 10px;
            font-weight: bold;
        }
        button:active {
            border: 2px inset gray;
        }
    </style>
</head>
<body>
    <form action="MainController" method="Post">
        <input type="hidden" name="action" value="login" />
        <div class="window">
            <div class="title-bar">Login</div>
            <div class="content">
                Username:
                <input type="text" name="txtUsername" placeholder="admin..."><br><br>
                Password:
                <input type="password" name="txtPassword" placeholder="123..."><br><br>
                <button>submit</button>
                 <%
                    String message = request.getAttribute("message") + "";
                    message = message.equals("null")?"": message;
                %>
             <h4 style="color: red"><%=message%></h4>
            </div>
        </div>
    </form>
   
</body>
</html>
