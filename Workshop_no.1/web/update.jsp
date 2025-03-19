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

    <body style="background-color: #dfdfdf;">
        <h1 style="    color: white;
    background: navy;
    margin: -8px -8px 0px;
    padding: 19px;">Welcome ...<%= user.getName()%> </h1>
        
    
    
        <!-- =============================================================================== -->
        <!-- tạo cái nút logout bằng form -->
       
        <hr/>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="logout" />
            <button type="submit" style="background: lightgray;
    border: 2px outset gray;
    
    font-weight: bold;">Logout</button>
           
        </form>
        
        <hr/>
        <!-- =============================================================================== -->
        
        <!-- =============================================================================== -->
        <!-- Ô tìm kiếm dự án! Dùng form-->
        <form action="MainController" method="post" style="font-weight: bold">
            <input type="hidden" name="action" value="search" /> 
            Search Project <input type="text" name="searchTerm" value="<%= searchTerm %>"/><!--Lấy ra giá trị searchTerm, nghĩa là giữ lại cái dữ liệu mới nhập vào -->
            <input style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold;" type="submit" value="Search" />
        </form>
        <!-- =============================================================================== -->
        <hr/>
        
        <!-- nút chuyển đến trang tạo dự án mới-->
        <form action="project_form.jsp" method="post">
            <input type="hidden" name="action" value="add" />
            <button type="submit" style="background: lightgray;  border: 2px outset gray;  font-weight: bold;">New Project</button>
           
        </form>
        
        <form action="update.jsp" method="POST">
            <input type="hidden" name="action" value="update" />
            <input type="submit" value="Update Status"  style="background: lightgray;  border: 2px outset gray;  font-weight: bold;"/>
        </form>
        
        
        
        <hr/>
        
        
        
        
        <!-- =============================================================================== -->
        <!-- Bảng Dự Án-->
        
        <%
            if(request.getAttribute("projects") != null){
            List<ProjectDTO> projects = (List<ProjectDTO>)  request.getAttribute("projects");
            
        %>
        
        <table border="1">
            <tr>
                <td style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold; text-align: center">Project ID</td>
                <td style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold; text-align: center">Project Name</td>
                <td style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold; text-align: center">Description</td>
                <td style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold; text-align: center">Status</td>
                <td style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold; text-align: center">Estimated Launch</td> 
                <td style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold; text-align: center">Update Status</td>
            </tr>
       
        
        <%
            for (ProjectDTO p : projects) {
        %>         
        <tr>
            <td style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold; text-align: center"><%= p.getProject_id() %></td>
            <td><%=p.getProject_name()%></td>
            <td><%= p.getDescription() %></td>
            <td><%= p.getStatus() %></td>
            <td><%= p.getEstimated_launch() %></td>
            <td style="background: lightgray;
    border: 2px outset gray;
    font-weight: bold; text-align: center"><a href="update.jsp" ><img src="images/Gartoon-Team-Gartoon-Misc-Stock-Edit-Bookmarks.512.png" width="25px"/></a></td>
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
