<%@page import="dto.UserDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Currency Exchange</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        header {
            background-color: #333;
            padding: 10px;
            color: #fff;
            text-align: center;
        }

        nav {
            margin-bottom: 20px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            padding: 10px;
            margin-right: 10px;
            border-radius: 5px;
            background-color: #eee;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }
    </style>
</head>

<body>
    <header>
        <h1>Currency Exchange Rates</h1>
        <%
            UserDTO user = (UserDTO)session.getAttribute("user");
           
        %>
        <h3 style="color: red"> welcome <%=user.getName() %></h3>
    </header>

    <nav>
        <form action="MainController" method="post">
        <a href="editCurrencyRate.html">Currency List</a>
        
        <a href="MainController?action=logout">Logout</a> |
         </form>
    </nav>
    
    <form id="searchForm" action="MainController">
        <label for="code">Code:</label>
        <input type="text" id="code" name="action" value="SearchCode">

        <label for="name">Name:</label>
        <input type="text" id="name" name="action" value="SearchName">

        <input type="submit" value="Search" >
    </form>

    <table>
        
        
    </table>
</body>

</html>