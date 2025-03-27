<%-- 
    Document   : edit
    Created on : Mar 15, 2025, 8:38:13 AM
    Author     : frost
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <link rel="stylesheet" href="assets/css/edit.css">
    </head>
    <body>
    <div class="container">
        <h1>Edit snack</h1>
        <div class="form-container">
            <form action="MainController">
                <input type="hidden" name="action" value="edit"/>
                <div class="form-group">
                    <label for="txtNewSnackId">New snackId:</label>
                    <input type="text" id="txtNewSnackId" name="txtNewSnackId" value="<%=request.getParameter("snackId")%>" readonly/>
                </div>
                <div class="form-group">
                    <label for="txtNewPicture">New picture:</label>
                    <input type="file" id="txtNewPicture" name="txtNewPicture" value="<%=request.getParameter("picture")%>"/>
                </div>
                <div class="form-group">
                    <label for="txtNewName">New name:</label>
                    <input type="text" id="txtNewName" name="txtNewName" value="<%=request.getParameter("name")%>"/>
                </div>
                <div class="form-group">
                    <label for="txtNewRegion">New region:</label>
                    <select id="txtNewRegion" name="txtNewRegion">
                        <option value="Bắc" <%= "Bắc".equals(request.getParameter("region")) ? "selected" : "" %>>Miền Bắc</option>
                        <option value="Trung" <%= "Trung".equals(request.getParameter("region")) ? "selected" : "" %>>Miền Trung</option>
                        <option value="Nam" <%= "Nam".equals(request.getParameter("region")) ? "selected" : "" %>>Miền Nam</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtNewUnit">New unit:</label>
                    <select id="txtNewUnit" name="txtNewUnit">
                        <option value="lọ" <%= "lọ".equals(request.getParameter("unit")) ? "selected" : "" %>>Lọ</option>
                        <option value="hộp" <%= "hộp".equals(request.getParameter("unit")) ? "selected" : "" %>>Hộp</option>
                        <option value="bịch" <%= "bịch".equals(request.getParameter("unit")) ? "selected" : "" %>>Bịch</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="txtNewPrice">New price:</label>
                    <input type="number" id="txtNewPrice" name="txtNewPrice" value="<%=request.getParameter("price")%>"/>
                </div>
                <div class="form-group">
                    <input type="submit" value="Edit"/>
                </div>
            </form>
        </div>
    </div>
</body>

</html>
