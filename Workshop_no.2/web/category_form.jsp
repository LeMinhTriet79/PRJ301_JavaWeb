<%@page import="dto.CategoriesDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Category</title>
    <style>
        body {
            font-family: Tahoma, sans-serif;
            background-color: #dfdfdf;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .window {
            width: 300px;
            background: silver;
            border: 2px solid black;
            padding: 10px;
            box-shadow: 5px 5px 0px gray;
        }
        .title-bar {
            background: navy;
            color: white;
            padding: 5px;
            font-weight: bold;
            font-size: 21px;
            width: 100%;
            margin: -10px;
            padding: 10px;
        }
        .content {
            padding: 2px;
            margin: 10px 0px 0px -2px;
            font-size: 15px;
            font-weight: bold
        }
        input[type="text"], input[type="password"] {
            width: 96%;
            border: 2px inset gray;
            padding: 5px;
            margin: 2px 0px -4px 0px;
        }
        button {
            background: lightgray;
            border: 2px outset gray;
            padding: 5px 10px;
            font-weight: bold;
        }
        button:active {
            border: 2px inset gray;
        }
    </style>
</head>
<body>
    
    <%      // Lấy ra dữ liệu từ danh sách 
            List<CategoriesDTO> categories = (List<CategoriesDTO>) request.getAttribute("categories");
            
            // Lấy đối tượng vừa đổ ở bên Maincontroller, để cho nó giữ lại cái dữ liệu mới nhập vào
            CategoriesDTO category = (CategoriesDTO) request.getAttribute("category");
            if(category == null){
                category = new CategoriesDTO();
            }
    %>
    
    <%
        // Lấy ra những thứ vừa nhập trên thanh công cụ
            
           String txtCategory_id = request.getAttribute("txtCategory_id")+""; 
           txtCategory_id = txtCategory_id.equals("null")?"":txtCategory_id;
           
           String txtCategory_name = request.getAttribute("txtCategory_name")+""; 
           txtCategory_name = txtCategory_name.equals("null")?"": txtCategory_name;
           
           String txtDescription = request.getAttribute("txtDescription")+""; 
           txtDescription = txtDescription.equals("null")?"": txtDescription;
    %>
    
    <%
        String CategoryID_error = request.getAttribute("CategoryID_error") +""; 
        CategoryID_error = CategoryID_error.equals("null")?"":CategoryID_error;
        
        String Category_name_error = request.getAttribute("Category_name_error") +""; 
        Category_name_error = Category_name_error.equals("null")?"":Category_name_error;
        
        String Description_error = request.getAttribute("Description_error") +""; 
        Description_error = Description_error.equals("null")?"":Description_error;
    %>
    
    <form action="MainController" method="Post">
        <input type="hidden" name="action" value="add" />
        <div class="window">
            <div class="title-bar">Create New Category</div>
            <div class="content">
                Category ID <b><span style="color: red"><%= CategoryID_error %></span></b><br/>               
                <input type="text" name="txtCategory_id" value="<%= txtCategory_id %>"> <br>                    <br>                                                 
                Category Name <b><span style="color: red"><%= Category_name_error %></span></b><br/>
                <input type="text" name="txtCategory_name" value="<%= txtCategory_name != null ? txtCategory_name : "" %>"><br/>     <br>           
                Description <b><span style="color: red"><%= Description_error %></span></b><br>
                <input type="text" name="txtDescription" value="<%= txtDescription %>"> <br> <br>
                <button>Submit</button>
            </div>
        </div>
    </form>
   
</body>
</html>
