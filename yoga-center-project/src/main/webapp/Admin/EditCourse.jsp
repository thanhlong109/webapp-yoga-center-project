<%-- 
    Document   : EditCourse
    Created on : Jun 26, 2023, 4:03:12 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Course</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/adminAddScreen.css">
    </head>
    <body>
        <div id="wrapper">
            <form action="updateCategoryController" method="post">
                <h3>Update Course</h3>
                <div class="input__group">
                    <input type="hidden" name="txtId" value="${COURSE.id}">
                    <input type="text" name="txtTitle" value="${COURSE.title}">
                    <label for="">Title</label>
                </div>
                <div class="input__group">
                    <input type="text" name="txtDetail" value="${COURSE.detail}">
                    <label for="">Detail</label>
                </div>
                <div class="input__group">
                    <input type="text" name="txtDuration" value="${COURSE.duration}">
                    <label for="">Duration</label>
                </div>
                <div class="input__group">
                    <input type="text" name="txtPrice" value="${COURSE.price}">
                    <label for="">Price</label>
                </div>
                <button type="submit" value="Add" id="btn__Add">Update</button>
            </form>                 
        </div>
    </body>
</html>
