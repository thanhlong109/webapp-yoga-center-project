<%-- 
    Document   : ViewCourseTime
    Created on : Jun 23, 2023, 9:34:40 AM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course Schedule</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/dashboard.css">
        <link rel="stylesheet" href="../Asset/css/adminCommon.css">
        <script src="../js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/adminSideMenu.jsp"></jsp:include>
                <div class="right-container">
                    <div class="wrapper-box">

                        <table class="table-style-1">
                            <tr>
                                <th>Course Schedule ID</th>
                                <th>Course ID</th>
                                <th>Date of Week</th>
                                <th>Start Time</th>
                                <th>End Time</th>
                                <th>Actions</th>
                            </tr>
                        <c:forEach items="${COURSE_TIME_LIST}" var="courseTime">
                            <c:if test="${courseTime.isActive == true}">
                            <tr>
                                <td>
                                    ${courseTime.id}
                                </td>
                                <td>
                                    ${courseTime.course.id}
                                </td>
                                <td>
                                    ${courseTime.dateOfWeek}
                                </td>
                                <td>
                                    ${courseTime.startTime}
                                </td>
                                <td>
                                    ${courseTime.endTime}
                                </td>                                                 
                                <td>
                                    <a class="btn btn-red" href="#delete">Detete</a> 
                                    <a class="btn btn-green" href="updateCourseTimeController?id=${courseTime.id}">
                                        Edit</a> 
                                </td>
                            </tr>
                            </c:if>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>