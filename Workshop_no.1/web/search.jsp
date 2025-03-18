<%-- 
    Document   : search
    Created on : Mar 13, 2025, 3:02:33 PM
    Author     : Minh Triet
--%>

<%@page import="dto.ProjectDTO"%>
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
       //Lấy tên ra để lắp lời chào ông cố
       UserDTO user = (UserDTO) session.getAttribute("user");//lấy ra là get, bên main là set
    %>
<%//========================================================================================================%>
    <% //Lấy ra dữ liệu vừa nhập trên thanh tìm kiếm, mục đích là giữ lại dữ liệu nhập vào trên thanh
        String searchTerm = (String) request.getAttribute("searchTerm") + "";
        //Nếu không nhập gì hết thì biến searchTerm bằng null thì nó trả lại khoảng trắng không gì hết (null), ngược lại nếu có nhập thì trả về cái vừa nhập
        searchTerm = searchTerm.equals("null") ? "":searchTerm;
    %>
<%//========================================================================================================%>
    <%
        //Lấy ra các dự án từ DB -  PROJECT
        
        
    %>

    <body>
        <h1 style="color: red">Welcome ...<%= user.getName()%> </h1>
        
        <!-- =============================================================================== -->
        <!-- tạo cái nút logout bằng form -->
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="logout" />
            <button type="submit" style="color: blue">Đăng Xuất</button>
           
        </form>
        <!-- =============================================================================== -->
        
        <!-- =============================================================================== -->
        <!-- Ô tìm kiếm dự án! Dùng form-->
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="search" /> 
            Search Project <input type="text" name="searchTerm" value="<%= searchTerm %>"/><!--Lấy ra giá trị searchTerm, nghĩa là giữ lại cái dữ liệu mới nhập vào -->
            <input type="submit" value="Search" />
        </form>
        <!-- =============================================================================== -->
        
        
        <br/>
        <br/>
        <hr/>
        
        
        
        <!-- =============================================================================== -->
        <!-- Bảng Dự Án-->
        
        <%
            if(request.getAttribute("project") != null){
            List<ProjectDTO> project = (List<ProjectDTO>)  request.getAttribute("project");
            
        %>
        
        <table border="1">
            <tr>
                <td>project_id</td>
                <td>project_name</td>
                <td>Description</td>
                <td>Status</td>
                <td>estimated_launch</td>                
            </tr>
       
        
        <%
            for (ProjectDTO p : project) {
        %>         
        <tr>
            <td><%= p.getProject_id() %></td>
            <td><%=p.getProject_name()%></td>
            <td><%= p.getDescription() %></td>
            <td><%= p.getStatus() %></td>
            <td><%= p.getEstimated_launch() %></td>   
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
        <!-- =============================================================================== -->
        
    </body>
</html>
