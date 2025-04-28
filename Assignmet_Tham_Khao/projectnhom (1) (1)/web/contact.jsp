<%@page import="DTO.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%
    // Lấy user từ session
    UserDTO user = (UserDTO) session.getAttribute("USER");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Web Milk Tea</title>
        <link rel="stylesheet" href="css/style1.css">
    </head>
    <body>
        <div class="body-section">
            <div class="banner">
                <nav>
                    <ul>
                        <a href="index.jsp">
                            <div class="LOGO"><img src="images/logogr5.jpg" alt="Logo"> </div>
                        </a>
                        <li><a href="index.jsp">TRANG CHỦ</a></li>
                        <li><a href="menu.jsp">SẢN PHẨM</a></li>
                        <li><a href="about.jsp">GIỚI THIỆU</a></li>
                        <li><a href="contact.jsp">LIÊN HỆ</a></li>
                        <li>
                            <% if (user == null) { %>
                               <a href="login.jsp?redirect=contact.jsp" class="login-btn">ĐĂNG NHẬP</a>
                            <% } else { %>
                               <a href="MainController?action=logout" class="login-btn">ĐĂNG XUẤT</a>
                            <% } %>
                        </li>
                    </ul>
                </nav>
            </div>

            <!-- Nội dung chính -->
            <div class="container">
                <h2>📍 Liên hệ GR5</h2>
                <div class="contact-info">
                    <p><b>🏠 Địa chỉ:</b> Trường Đại học FPT, Vinhomes Grand Park, Lê Văn Việt</p>
                    <p>📧 <b>Email:</b> trasuagr5@gmail.com</p>
                    <p>📞 <b>Hotline:</b> 0399 776 025 | 0345 678 901</p>
                    <p>🛵 Đặt ngay để thưởng thức trà sữa thơm ngon tại nhà!</p>
                </div>
            </div>
        </div>
    </body>
</html>
