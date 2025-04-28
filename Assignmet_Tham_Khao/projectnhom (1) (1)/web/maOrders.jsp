<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DButils.utils" %>
<html>
<head>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fdfced;
        }
        .container {
            width: 80%;
            margin: auto;
            background-color: #eef5d8;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .menu {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 20px;
        }
        .menu-button {
            padding: 10px 20px;
            background-color: #a5c282;
            color: black;
            text-decoration: none;
            font-weight: bold;
            border-radius: 20px;
            transition: background-color 0.3s;
        }
        .menu-button:hover {
            background-color: #8faa68;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #f5f9e5;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid black;
        }
        th {
            background-color: #c5e1a5;
        }
        .button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-admin {
            background-color: #6b8e23;
            color: white;
        }
        .btn-delete {
            background-color: red;
            color: white;
        }
        .home-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #8faa68;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Quản lý</h2>

        <!-- MENU ĐIỀU HƯỚNG -->
        <div class="menu">
            <a href="maProducts.jsp" class="menu-button">Quản lí sản phẩm</a>
            <a href="maOrders.jsp" class="menu-button">Quản lí đơn hàng</a>
            <a href="maUser.jsp" class="menu-button">Quản lí tài khoản</a>
        </div>


<table>
    <tr>
        <th>OrderID</th>
        <th>UserID</th>
        <th>Ngày đặt</th>
        <th>Giảm giá</th>
        <th>Thành tiền</th>
        <th>Trạng thái</th>
    </tr>
    <% 
        
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
        try {
            conn = utils.getConnection();
            String sql = "SELECT OrderID, UserID, OrderDate, DiscountID, FinalAmount, ShippingStatus FROM Orders";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                String statusClass = "pending";
                String statusText = rs.getString("ShippingStatus");
                if ("Hoàn thành".equals(statusText)) {
                    statusClass = "completed";
                } else if ("Hủy đơn".equals(statusText)) {
                    statusClass = "cancelled";
                }
    %>
    <tr>
        <td>#<%= rs.getInt("OrderID") %></td>
        <td><%= rs.getInt("UserID") %></td>
        <td><%= rs.getTimestamp("OrderDate") %></td>
        <td><%= (rs.getObject("DiscountID") != null) ? rs.getInt("DiscountID") : "Không" %></td>
        <td><%= rs.getDouble("FinalAmount") %> đ</td>
        <td><span class="status <%= statusClass %>"><%= statusText %></span></td>
    </tr>
    <% 
            }
        } catch (Exception e) {
            out.println("Lỗi: " + e.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
</table>
        <a href="managerhomepage.jsp" class="home-button">Quay lại trang chủ</a>
    </div>
</body>
</html>
