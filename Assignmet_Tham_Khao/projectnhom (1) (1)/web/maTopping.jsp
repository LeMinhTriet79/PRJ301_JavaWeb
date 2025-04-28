<%@page import="DTO.ToppingDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="DButils.utils" %>
<html>
    <head>
        <title>Quản lý danh mục</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #fdfced;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .header {
                width: 100%;
                text-align: center;
                padding: 15px;
                font-size: 24px;
                font-weight: bold;
                background-color: #c5e1a5;
                border-radius: 10px;
            }
            .main-container {
                display: flex;
                width: 100%;
                max-width: 1200px;
                margin-top: 20px;
            }
            .sidebar {
                width: 200px;
                padding: 20px;
                background-color: #c5e1a5;
                border-radius: 10px;
                height: 100vh;
                display: flex;
                flex-direction: column;
                gap: 15px;
            }
            .sidebar-button {
                padding: 10px;
                background-color: #8faa68;
                color: white;
                text-align: center;
                font-weight: bold;
                border-radius: 20px;
                text-decoration: none;
                transition: background-color 0.3s;
            }
            .sidebar-button:hover {
                background-color: #6f8c4f;
            }
            .content {
                flex-grow: 1;
                padding: 20px;
                background-color: #eef5d8;
                border-radius: 10px;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
                margin-left: 20px;
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
                margin-top: 20px;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border: 1px solid black;
            }
            th {
                background-color: #c5e1a5;
            }
            .action-icons {
                font-size: 18px;
                cursor: pointer;
                margin: 5px;
            }
            .edit {
                color: #4caf50;
            }
            .delete {
                color: red;
            }
        </style>
    </head>
    <body>

        
        <!-- HEADER -->
        <div class="header">QUẢN LÍ TOPPING </div>

        <!-- CONTAINER CHÍNH -->
        <div class="main-container">
            <!-- SIDEBAR -->
            <div class="sidebar">
                <a href="maProducts.jsp" class="sidebar-button">QUẢN LÍ DANH MỤC</a>
                <a href="maProducts1.jsp" class="sidebar-button">QUẢN LÍ SẢN PHẨM</a>
                <a href="ToppingController" class="sidebar-button">QUẢN LÍ TOPPING</a>
                <a href="managerhomepage.jsp" class="sidebar-button">QUAY LẠI TRANG CHỦ</a>
            </div>

            <!-- NỘI DUNG CHÍNH -->
            <div class="content">
                <div class="menu">
                    <a href="maProducts.jsp" class="menu-button">Quản lí sản phẩm</a>
                    <a href="maOrders.jsp" class="menu-button">Quản lí đơn hàng</a>
                    <a href="maUser.jsp" class="menu-button">Quản lí tài khoản</a>
                </div>

                <!-- Form thêm / chỉnh sửa topping -->
        <form method="post" action="ToppingController" class="form-container">
            <input type="hidden" name="toppingId" value="<%= request.getParameter("editId") != null ? request.getParameter("editId") : "" %>">
            <input type="text" name="toppingName" placeholder="Nhập tên topping" value="<%= request.getParameter("editName") != null ? request.getParameter("editName") : "" %>" required>
            <input type="number" step="0.01" name="price" placeholder="Nhập giá" value="<%= request.getParameter("editPrice") != null ? request.getParameter("editPrice") : "" %>" required>
            <button type="submit" name="action" value="add" class="btn">Thêm</button>
            <button type="submit" name="action" value="edit" class="btn">Cập nhật</button>
        </form>

        <!-- Bảng danh sách topping -->
        <table>
            <tr>
                <th>Tên topping</th>
                <th>Giá</th>
                <th>Thao tác</th>
            </tr>
            <% List<ToppingDTO> toppings = (List<ToppingDTO>) request.getAttribute("toppings");
                if (toppings != null) {
                    for (ToppingDTO topping : toppings) {
            %>
            <tr>
                <td><%= topping.getToppingName() %></td>
                <td><%= topping.getPrice() %></td>
                <td>
                    <a href="ToppingController?editId=<%= topping.getToppingID()%>&editName=<%= topping.getToppingName()%>&editPrice=<%= topping.getPrice()%>">
                <span class="action-icons edit">✏️</span>
            </a>
                    <a href="ToppingController?action=delete&id=<%= topping.getToppingID() %>" onclick="return confirm('Bạn có chắc muốn xóa?');">
                        <span class="delete">🗑️</span>
                    </a>
                </td>
            </tr>
    <%
            }
        }
    %>
</table>

                    </body>
                    </html>