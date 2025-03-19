<%@page import="dto.CategoriesDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
       // Lấy tên ra để lắp lời chào
       UserDTO user = (UserDTO) session.getAttribute("user");//lấy ra là get, bên main là set
    %>
    
    <% // Lấy ra dữ liệu vừa nhập trên thanh tìm kiếm, mục đích là giữ lại dữ liệu nhập vào trên thanh
        String searchTerm = (String) request.getAttribute("searchTerm") + "";
        // Nếu không nhập gì hết thì biến searchTerm bằng null thì nó trả lại khoảng trắng không gì hết (null), ngược lại nếu có nhập thì trả về cái vừa nhập
        searchTerm = searchTerm.equals("null") ? "" : searchTerm;
    %>

    <body style="background-color: #dfdfdf;">
        <h1 style="color: white; background: navy; margin: -8px -8px 0px; padding: 19px;">Welcome ...<%= user.getName() %></h1>

        <hr/>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="logout" />
            <button type="submit" style="background: lightgray; border: 2px outset gray; font-weight: bold;">Logout</button>
        </form>
        <hr/>

        <!-- Ô tìm kiếm danh mục -->
        <form action="MainController" method="post" style="font-weight: bold">
            <input type="hidden" name="action" value="search" />
            Search Category <input type="text" name="searchTerm" value="<%= searchTerm %>"/>
            <input style="background: lightgray; border: 2px outset gray; font-weight: bold;" type="submit" value="Search" />
        </form>
        <hr/>

        <!-- nút chuyển đến trang tạo danh mục mới -->
        <form action="category_form.jsp" method="post">
            <input type="hidden" name="action" value="add" />
            <button type="submit" style="background: lightgray; border: 2px outset gray; font-weight: bold;">New Category</button>
        </form>
        <form action="update.jsp" method="POST">
            <input type="hidden" name="action" value="update" />
            <input type="submit" value="Update Status" style="background: lightgray; border: 2px outset gray; font-weight: bold;"/>
        </form>
        <hr/>

        <!-- Bảng Danh Mục -->
        <%
            if(request.getAttribute("categories") != null){
                List<CategoriesDTO> categories = (List<CategoriesDTO>) request.getAttribute("categories");
        %>

        <table border="1">
            <tr>
                <td style="background: lightgray; border: 2px outset gray; font-weight: bold; text-align: center">Category ID</td>
                <td style="background: lightgray; border: 2px outset gray; font-weight: bold; text-align: center">Category Name</td>
                <td style="background: lightgray; border: 2px outset gray; font-weight: bold; text-align: center">Description</td>
                <td style="background: lightgray; border: 2px outset gray; font-weight: bold; text-align: center">Update Status</td>
            </tr>

        <%
            for (CategoriesDTO cat : categories) {
        %>         
        <tr>
            <td style="background: lightgray; border: 2px outset gray; font-weight: bold; text-align: center"><%= cat.getCategory_id() %></td>
            <td><%= cat.getCategory_name() %></td>
            <td><%= cat.getDescription() %></td>
            <td style="background: lightgray; border: 2px outset gray; font-weight: bold; text-align: center"><a href="update.jsp"><img src="images/Gartoon-Team-Gartoon-Misc-Stock-Edit-Bookmarks.512.png" width="25px"/></a></td>
        </tr>

        <%     
                }
           %>

        <%
            } else {
        %>
        Không tìm thấy!
        <%
          }   
        %>
    </body>
</html>
