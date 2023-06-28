<%-- 
    Document   : EditCourseSchedule
    Created on : Jun 27, 2023, 7:57:03 PM
    Author     : DungVNT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/adminAddScreen.css">
    </head>
    <body>
        <div>
            <div id="wrapper">
                <form action="updateCourseScheduleController" method="POST">
                    <h3>Update Course Schedule</h3>
                    <div class="input__group">
                        <input type="hidden" name="txtId" value="${courseSchedule.id}">
                               <label for="">ID</label>
                    </div>
                    <div class="input__group">
                        <input type="text" name="txtDateOfWeek" value="${courseSchedule.dateOfWeek}">
                               <label for="">Date Of Week</label>
                    </div>
                    <div class="input__group">
                        <input type="text" name="txtStartDate" value="${courseSchedule.startTime}">
                               <label for="">Start Time</label>
                    </div>
                    <div class="input__group">
                        <input type="text" name="txtEndDate" value="${courseSchedule.endTime}">
                               <label for="">End Time</label>
                    </div>
                    <button type="submit" value="Add" id="btn__Add">Update</button>
                    <button type="reset" value="Reset" id="btn__Reset">Refresh</button>
                </form>
            </div>                               
        </div>


    </body>
</html>
