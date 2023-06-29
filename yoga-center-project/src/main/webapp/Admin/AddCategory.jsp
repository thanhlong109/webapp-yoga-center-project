<%-- 
    Document   : AddCategory
    Created on : Jun 26, 2023, 7:27:25 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/adminAddScreen.css">
    </head>
    <body>
        <div id="wrapper">
            <form action="../admin/addCategoryController">
                <h3>Add New</h3>
                <div class="input__group">
                    <input type="text" name="txtName" required>
                    <label for="">Name</label>
                </div>
                <button type="submit" value="Add" id="btn__Add">Add</button>
                <button type="reset" value="Reset" id="btn__Reset">Refresh</button>
            </form>
        </div>
    </body>
</html>
