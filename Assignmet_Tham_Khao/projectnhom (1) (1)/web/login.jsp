<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('images/background1.jpg') no-repeat center center/cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
        }
        
        /* Tạo lớp mờ cho background */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.5); /* Màu trắng với độ trong suốt 50% */
            backdrop-filter: blur(5px); /* Làm mờ nền */
            z-index: -1;
        }
        
        .login-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 500px;
            height: 300px;
            text-align: center;
            position: relative;
            
           
        }
        .login-container h2 {
            margin-bottom: 30px;
            
            
        }
        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-left: -8px;
        }
        .login-container button {
            width: 520px;
            padding: 10px;
            background: #86a67e;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: -8px;
        }
        .login-container button:hover {
            background: #6c8b63;
        }
        .login-container a {
            display: block;
            margin-top: 10px;
            text-decoration: none;
            color: #007BFF;
        }
        
    </style>
</head>
<body>
   <div class="login-container">
    <h2>Đăng Nhập</h2>      
    
    <%
        // Lấy trang trước đó từ request, nếu không có thì về trang chủ
        String redirect = request.getParameter("redirect");
        if (redirect == null || redirect.isEmpty()) {
            redirect = "index.jsp";
        }
    %>

    <form action="./MainController" method="POST">
        <input type="hidden" name="redirect" value="<%= redirect %>"> <!-- Giữ lại trang trước đó -->

        <input type="text" name="username" placeholder="Tên đăng nhập" required>
        <input type="password" name="password" placeholder="Mật khẩu" required>

        <button type="submit" name="action" value="login">Đăng nhập</button>
        <button type="button" onclick="location.href='register.jsp'">Đăng ký</button>
    </form>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <h3 style="color: red;"><%= error %></h3>
    <% } %>
</div>


</body>
</html>
