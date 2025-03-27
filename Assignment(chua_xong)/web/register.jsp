<%-- 
    Document   : register
    Created on : Mar 16, 2025, 10:08:47 AM
    Author     : frost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>       
        <link rel="stylesheet" href="assets/css/register.css">
    </head>
    <body>
    <div class="container">
        <div class="form-container">
            <form action="MainController">
                <h1>Register</h1>
                <input type="hidden" name="action" value="register"/>
                <div class="form-group">
                    <label for="txtNewUsername">Username:</label>
                    <input type="text" id="txtNewUsername" name="txtNewUsername"/>
                </div>
                <div class="form-group">
                    <label for="txtNewFullName">Full name:</label>
                    <input type="text" id="txtNewFullName" name="txtNewFullName"/>
                </div>
                <input type="hidden" name="txtNewRole" value="user"/>
                <div class="form-group">
                    <label for="txtNewPassword">Password:</label>
                    <input type="password" id="txtNewPassword" name="txtNewPassword"/>
                </div>
                <div class="form-group">
                    <input type="submit" value="Register"/>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
