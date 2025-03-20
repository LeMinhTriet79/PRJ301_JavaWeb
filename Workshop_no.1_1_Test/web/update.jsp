<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Project Status</title>
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
            font-weight: bold;
        }
        input[type="text"], input[type="password"], select {
                width: 96%;
    border: 2px inset gray;
    padding: 6px 0px;
    margin: 7px 0px -4px 0px;
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

    <form action="MainController" method="post">
        <input type="hidden" name="action" value="updateStatus" />
        <div class="window">
            <div class="title-bar">Update Project Status</div>
            <div class="content">
                <label for="projectId">Project ID:</label>
                <input type="text" id="projectId" name="projectId" value="<%= request.getParameter("projectId") %>" readonly /><br/> 
                <br/>
                <label for="status">New Status:</label>
                <select name="status" id="status">
                    <option value="Ideation">Ideation</option>
                    <option value="Development">Development</option>
                    <option value="Launch">Launch</option>
                    <option value="Scaling">Scaling</option>
                </select><br/>
                <br/>
                <button type="submit">Update Status</button>
            </div>
        </div>
    </form>

    <% String message = (String) request.getAttribute("message");
       if (message != null) { %>
        <p style="color: red; text-align: center;"><%= message %></p>
    <% } %>

</body>
</html>
