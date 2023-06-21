<%-- 
    Document   : viewSchedule
    Created on : Jun 16, 2023, 10:05:38 PM
    Author     : DatTGT
--%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.yowu.yogacenter.repository.CourseScheduleRepository" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="Asset/css/font/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="Asset/css/schedule.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css"/>
        <link rel="stylesheet" href="Asset/css/clientFooter.css"/>
        <link rel="stylesheet" href="Asset/css/common.css"/>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
            <div class="banner">
                <h2>Timetable</h2>
                <p>For Offline Classes</p>
            </div>
            <div class="wrapper-table">

                <table>
                    <tr>
                        <th></th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                        <th>Sunday</th>
                    </tr>
                <c:if test="${scheduleList != null && scheduleList.size() gt 1}">
                    <c:forEach var="list" items="${scheduleList}">
                        <tr>
                            <td>10:00 AM</td>
                            <td></td>
                            <td rowspan="2" class="event event-bg-color-1">
                                <a class="event-title">Meditation Yoga</a>
                                <p class="event-slot">10:00 am - 12:00 pm</p>
                                <p class="event-sub-title">Yoga Center</p>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>10:00 am</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>

                            <td></td>
                        </tr>
                        <tr>
                            <td>10:00 am</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td rowspan="2" class="event event-bg-color-4">
                                <a class="event-title">Meditation Yoga</a>
                                <p class="event-slot">10:00 am - 12:00 pm</p>
                                <p class="event-sub-title">Yoga Center</p>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>10:00 am</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </c:forEach>
                </c:if>
            </table>

        </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>
