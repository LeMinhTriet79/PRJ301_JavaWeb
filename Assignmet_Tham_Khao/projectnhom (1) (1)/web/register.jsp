<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký</title>
   <style>
        body {
            background: url('images/background1.jpg') no-repeat center center/cover;
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: Arial, sans-serif;
        }
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(5px);
            z-index: -1;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 400px;
            text-align: center;
        }
        h2 {
            margin-top: 0;
            color: #333;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            border: none;
            color: white;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>ĐĂNG KÝ</h2>

        <!-- Hiển thị thông báo lỗi nếu có -->
        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>

        <form action="MainController" method="POST">
            <input type="text" name="fullName" placeholder="Họ và tên" required>
            <input type="text" name="phoneNumber" placeholder="Số điện thoại" required>
            <input type="text" name="username" placeholder="Tên đăng nhập" required>
            <input type="password" name="password" placeholder="Mật khẩu" required>
            <input type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
            <button type="submit" name="action" value="register">Đăng ký</button>
        </form>
    </div>
</body>
</html>
