<%-- 
    Document   : create
    Created on : Mar 14, 2025, 6:33:32 PM
    Author     : frost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create</title>
        <link rel="stylesheet" href="assets/css/create.css">
    </head>
    <body>
    <div class="container">
        <h1>Create a new snack</h1>
        <div class="form-container">
            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="add"/>
                <div class="form-group">
                    <label for="txtSnackId">Snack Id:</label>
                    <input type="text" id="txtSnackId" name="txtSnackId"/>
                </div>
                <div class="form-group">
                    <label for="txtPicture">Picture:</label>
                    <input type="file" id="txtPicture" name="txtPicture"/>
                </div>
                <div class="form-group">
                    <label for="txtName">Name:</label>
                    <input type="text" id="txtName" name="txtName"/>
                </div>
                <div class="form-group">
                    <label for="txtRegion">Region:</label>
                    <select id="txtRegion" name="txtRegion">
                        <option value="Bắc">Miền Bắc</option>
                        <option value="Trung">Miền Trung</option>
                        <option value="Nam">Miền Nam</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtUnit">Unit:</label>
                    <select id="txtUnit" name="txtUnit">
                        <option value="lọ">Lọ</option>
                        <option value="hộp">Hộp</option>
                        <option value="bịch">Bịch</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtPrice">Price:</label>
                    <input type="number" id="txtPrice" name="txtPrice"/>
                </div>
                <div class="form-group">
                    <input type="submit" value="Add"/>
                </div>
            </form>
        </div>
    </div>
</body>

</html>
