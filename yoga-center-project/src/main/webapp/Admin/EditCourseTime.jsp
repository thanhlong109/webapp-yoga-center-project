<%-- 
    Document   : EditCourseTime
    Created on : Jun 26, 2023, 4:21:30 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Course Time</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/adminAddScreen.css">
    </head>
    <body>
        <div id="wrapper">
            <form action="updateCategoryController" method="post">
                <h3>Update Course Time</h3>
                <div class="input__group">
                    <input type="time" name="txtStartTime" value="${COURSE_SCHEDULE.startTime}">
                    <label for="">Start Time</label>
                </div>
                <div class="input__group">
                    <input type="time" name="txtEndTime" value="${COURSE_SCHEDULE.endTime}">
                    <label for="">End Time</label>
                </div>
                <button type="submit" value="Add" id="btn__Add">Update</button>
            </form>                 
        </div>
    </body>
</html>
