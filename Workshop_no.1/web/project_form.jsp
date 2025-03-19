<%-- 
    Document   : thêm dự án
    Created on : Mar 10, 2025, 7:42:26 AM
    Author     : tui nè
--%>

<%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workshop_Test</title>
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
    
    <%      //Lấy ra dữ liệu từ danh sách 
            List<ProjectDTO> projects = (List<ProjectDTO>) request.getAttribute("projects");
            
                //Lấy đối tượng vừa đổ ở bên Maincontroller, để cho nó giữ lại cái dữ liệu mới nhập vào
                    ProjectDTO project = (ProjectDTO) request.getAttribute("project");
               if(project == null){
                   project = new ProjectDTO();
               }
    %>
    
    
    <%
        //Lấy ra những thứ vừa nhập trên thanh công cụ
            
           String txtProject_id = request.getAttribute("txtProject_id")+"";
           txtProject_id = txtProject_id.equals("null")?"":txtProject_id;
           
           String txtProject_name = request.getAttribute("txtProject_name")+"";
           txtProject_name = txtProject_name.equals("null")?"": txtProject_name;
           
           String txtDescription = request.getAttribute("txtDescription")+"";
           txtDescription = txtDescription.equals("null")?"": txtDescription;
           
           String txtStatus = request.getAttribute("txtStatus")+"";
           txtStatus = txtStatus.equals("null")?"":txtStatus;
           
           String txtEstimated_launch = request.getAttribute("txtEstimated_launch")+"";
           txtEstimated_launch = txtEstimated_launch.equals("null")?"": txtEstimated_launch;

    %>
    
    <%
        String ProjecID_error = request.getAttribute("ProjecID_error") +"";
        ProjecID_error = ProjecID_error.equals("null")?"":ProjecID_error;
        
        String Project_name_error = request.getAttribute("Project_name_error") +"";
        Project_name_error = Project_name_error.equals("null")?"":Project_name_error;
        
        String Description_error = request.getAttribute("Description_error") +"";
        Description_error = Description_error.equals("null")?"":Description_error;
        
        String Status_error = request.getAttribute("Status_error") +"";
        Status_error = Status_error.equals("null")?"":Status_error;
        
        String Estimated_launch_error = request.getAttribute("Estimated_launch_error") +"";
        Estimated_launch_error = Estimated_launch_error.equals("null")?"":Estimated_launch_error;
    %>
    
    
    <form action="MainController" method="Post">
        <input type="hidden" name="action" value="add" />
        <div class="window">
            <div class="title-bar">Create New Project</div>
            <div class="content">
                Project ID <b><span style="color: red"><%= ProjecID_error%></span></b><br/>               
                <input type="text" name="txtProject_id" value="<%= txtProject_id%>" > <br>                    <br>                                                
                Project Name <b><span style="color: red"><%= Project_name_error %></span></b>                                               
                <input type="text" name="txtProject_name" value="<%= txtProject_name != null ? txtProject_name : "" %>"><br/>     <br>           
                Description <b><span style="color: red"><%= Description_error %></span></b><br>
                <input type="text" name="txtDescription" value="<%= txtDescription%>">            <br> <br>
                Status <b><span style="color: red"><%= Status_error %></span></b>  <br/>                 
                <select name="txtStatus" value="<%= txtStatus%>" >                               
                    <option value=""></option>
                    <option value="Ideation">Ideation</option>
                    <option value="Development">Development</option>
                    <option value="Launch">Launch</option>
                    <option value="Scaling">Scaling</option>
                </select> <br/><br/>
                Estimated Launch <b><span style="color: red"><%= Estimated_launch_error %></span></b><br/> 
                <input type="date" name="txtEstimated_launch" value=" <%= txtEstimated_launch%> "><br><br>
                <button>submit</button>
               
                 <%
        //In ra dòng thông báo lỗi nếu nhập sai từ bên maincontroller
        //Cần phải có một mối kết nối để lấy ra.
        //Bên kia SET thì bên lấy ra phải là GET
        //String ProjecID_error = request.getAttribute("ProjecID_error") + "";
        //NẾU nhập đúng thì message sẽ bằng Null, còn nhập "tào lao" thì message sẽ được gán cái dòng" sai dồi chế ơi! "
    %>
    <br/>    
     
            </div>
        </div>
    </form>
   
</body>
</html>
