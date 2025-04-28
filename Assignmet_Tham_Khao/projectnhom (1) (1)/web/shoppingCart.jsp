<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giỏ hàng của tôi</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="cart-container">
        <h2>Giỏ hàng của tôi</h2>

        <%
            // Nhận dữ liệu sản phẩm
            String productName = request.getParameter("name");
            String price = request.getParameter("price");
            String image = request.getParameter("image");
            String[] toppings = request.getParameterValues("topping"); // Lấy tất cả topping được chọn

            if (productName == null || price == null || image == null) {
        %>
            <p>Giỏ hàng trống!</p>
        <%
            } else {
        %>
            <div class="cart-item">
                <img src="<%= image %>" alt="<%= productName %>" width="100">
                <div class="item-info">
                    <strong><%= productName %></strong><br>
                    <p>Topping: 
                        <%= (toppings != null) ? String.join(", ", toppings) : "Không có" %>
                    </p>
                    <strong>Tổng: <%= price %>đ</strong>
                </div>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
