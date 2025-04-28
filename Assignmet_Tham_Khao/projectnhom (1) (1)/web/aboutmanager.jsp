<%@ page import="DTO.UserDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%
    // Kiểm tra nếu có request đăng xuất
    if ("true".equals(request.getParameter("logout"))) {
        session.invalidate(); // Xóa session
        response.sendRedirect("index.jsp"); // Quay về trang chủ
        return;
    }

    // Lấy user từ session (có thể null)
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
                        <li><a href="managerhomepage.jsp">TRANG CHỦ</a></li>
                        <li><a href="menu.jsp">SẢN PHẨM</a></li>
                        <li><a href="aboutmanager.jsp">GIỚI THIỆU</a></li>
                        <li><a href="contactmanager.jsp">LIÊN HỆ</a></li>
                        <li><a href="maUser.jsp">QUẢN LÍ</a></li>
                        <li>
                            <% if (user != null) { %>
                                <form action="managerhomepage.jsp" method="post" style="display:inline;">
                                    <input type="hidden" name="logout" value="true">
                                    <button type="submit" class="login-btn">ĐĂNG XUẤT</button>
                                </form>
                            <% } %>
                        </li>
                    </ul>
                </nav>
            </div>

            <!-- Nội dung trang -->
            <div class="container">
                <h2>GR5 – Trà sữa đậm vị, giao tận tay!</h2>
                <p>GR5 là thương hiệu trà sữa online dành cho những ai yêu thích hương vị thơm ngon, tươi mát nhưng không có thời gian ra quán.</p>
                <p>Chúng tôi cam kết sử dụng nguyên liệu chất lượng cao, pha chế cẩn thận để mang đến những ly trà sữa đậm đà, chuẩn vị ngay tại nhà bạn.</p>
                <p>Menu đa dạng với nhiều loại trà sữa truyền thống như trà sữa trân châu, matcha, ô long, cùng những công thức độc quyền chỉ có tại GR5.</p>
                <p>Bạn có thể dễ dàng tùy chỉnh lượng đường, đá và topping theo sở thích, đảm bảo mỗi ly trà sữa đều phù hợp với khẩu vị của riêng bạn.</p>
                <p>GR5 hoạt động hoàn toàn online, giúp bạn đặt hàng nhanh chóng, tiện lợi mà không cần ra khỏi nhà.</p>
                <p>Chỉ cần vài thao tác đơn giản, trà sữa yêu thích sẽ được giao tận nơi, đảm bảo tươi ngon như vừa pha chế xong.</p>
                <p><b>Hãy đặt ngay một ly trà sữa từ GR5 và tận hưởng hương vị thơm ngon ngay tại nhà!</b></p>
            </div>
        </div>
    </body>
</html>
