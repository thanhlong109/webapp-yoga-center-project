<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class Schedule</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!--        <link rel="stylesheet" href="../Asset/css/dashboard.css">-->
        <!--        <link rel="stylesheet" href="../Asset/css/adminCommon.css">-->
        <link rel="stylesheet" href="../Asset/css/dashboard_2.css">
        <link rel="stylesheet" href="../Asset/css/adminEditCategory_2.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="../js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/adminSideMenu2.jsp"></jsp:include>
                <main>
                    <div class="top">
                        <button id="menu-btn">
                            <span class="material-symbols-sharp">menu</span>
                        </button>
                        <form action="searchClassScheduleController" id="search-box">
                            <input type="date" name="txtSearch" id="search-text" placeholder="Search by registration ID" required>
                            <button type="submit" id="btnSearch">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </form>
                        <div class="profile">
                            <div class="info">
                                <p>Hey, <b>Admin</b></p>
                                <small class="text-muted">Admin</small>
                            </div>
                            <div class="profile-photo">
                                <img src="../Asset/img/avatar/hinh-avatar-1.png" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="container__wrapper-box">
                        <div class="wrapper-box">
                            <table class="table-style-1">
                                <tr>
                                    <th>Class Schedule ID</th>
                                    <th>Registration ID</th>
                                    <th>Class Date</th>
                                    <th>Slot Start Time</th>
                                    <th>Slot End Time</th>
                                    <th>Actions</th>
                                </tr>
                            <c:forEach items="${CLASS_SCHEDULE_LIST}" var="classSchedule">
                                <c:if test="${classSchedule.status == 1}">                                
                                    <tr>
                                        <td>
                                            <c:out value="${classSchedule.id}"/>
                                        </td>
                                        <td>
                                            <c:out value="${classSchedule.registrationCourse.id}"/>
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${classSchedule.date}" pattern="dd/MM/yyyy"/>
                                        </td>
                                        <td>
                                            <c:out value="${classSchedule.startTime}"/>
                                        </td>
                                        <td>
                                            <c:out value="${classSchedule.endTime}"/>
                                        </td>    
                                        <td>
                                            <a class="btn btn-red" href="deleteClassScheduleController?id=${classSchedule.id}">
                                                Delete
                                            </a> 
                                            <a class="btn btn-green" href="updateClassScheduleController?id=${classSchedule.id}">
                                                Edit
                                            </a> 
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
