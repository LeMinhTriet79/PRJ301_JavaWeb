<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating an appointment </title>
    </head>
    <body>
        <h1>Creating appointment</h1>
        <hr/>
        <!--your code here-->
        <form action="MainController" method="POST">
            <input type="hidden" name="action" value="add" />
    
      
            account   <input type="text" name="account" /><br/>
            partnerPhone <input type="text" name="partnerPhone" /><br/>
            partnerName <input type="text" name="partnerName" /><br/>
            timeToMeet  <input type="datetime" name="timeToMeet" /><br/>
            place <input type="text" name="place" /><br/>
            expense <input type="text" name="expense" /><br/>
            note <input type="text" name="note" /><br/>
            <input type="submit" value="Submit" /><br/>
        </form>
    </body>
</html>
