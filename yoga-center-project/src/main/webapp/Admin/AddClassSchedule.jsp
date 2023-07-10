<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Schedule</title>
        <!-- Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <!-- Google icon -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!-- Link CSS  -->
        <link rel="stylesheet" href="../Asset/css/dashboard_2.css">
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
                        <form action="" id="search-box">
                            <input type="text" id="search-text" placeholder="Search anything you want" required>
                            <button id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                        <div class="profile">
                            <div class="info">
                                <p>Hey, <b>An</b></p>
                                <small class="text-muted">Admin</small>
                            </div>
                            <div class="profile-photo">
                                <img src="../Asset/img/avatar/hinh-avatar-1.png" alt="">
                            </div>
                        </div>
                    </div>
                    <h1>Add Schedule</h1>
                    <div id="wrapper">
                        <form action="../admin/addClassScheduleController" method="POST">
                            <h3>Add Schedule</h3>
                            <div class="input__group filter">
                                <select class="input-filter" name="registrationList" id="registrationCourse">
                                <c:forEach items="${LIST_REGISTRATION}" var="registrationList">
                                        <option value="${registrationList.id}"> 
                                            ${registrationList.id} 
                                        </option>                              
                                </c:forEach>
                            </select>
                            <label for="">Registration Course ID</label>
                        </div>
                        <div class="input__group">
                            <input type="date" name="txtDate" required">
                            <label for="">Class Date</label>
                        </div>
                        <div class="input__group">
                            <input type="text" name="txtStartDate" required">
                            <label for="">Start Time</label>
                        </div>
                        <div class="input__group">
                            <input type="text" name="txtEndDate" required">
                            <label for="">End Time</label>
                        </div>
                        <div class="input__button">
                            <button type="submit" value="Add" id="btn__Add">Add</button>
                            <button type="reset" value="Reset" id="btn__Reset">Refresh</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
    </body>
</html>
