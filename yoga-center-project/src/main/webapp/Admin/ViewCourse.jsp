<%-- 
    Document   : ViewCourse
    Created on : Jun 21, 2023, 5:35:09 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
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
        <!--<link rel="stylesheet" href="../Asset/css/adminCommon.css">-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/dashboard_2.css">     
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/adminEditCategory_2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/paginationAdmin.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/alertBoxAdmin.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <style>
            .image {
                max-width: 90%;
                z-index: 1;
                overflow: hidden;
                position: relative;
            }
        </style>
    </head>
    <body>
        <div class="container">       
            <jsp:include page="../Component/adminSideMenu2.jsp"></jsp:include>
            <main>
                <div class="top">
                    <button id="menu-btn">
                        <span class="material-symbols-sharp">menu</span>
                    </button>
                    <form action="searchCourseController" id="search-box">
                        <input type="text" name="txtSearch" id="search-text" placeholder="Search anything you want" required>
                        <button type="submit" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                    <div class="profile">
                        <div class="info">
                            <p>Hey, <b>${sessionScope.account.name}</b></p>
                            <small class="text-muted">Admin</small>
                        </div>
                        <div class="profile-photo">
                            <img src="../Asset/img/avatar/${sessionScope.account.img}" alt="">
                        </div>
                    </div>
                </div>
                <h1>Course List</h1>
                <div class="container__wrapper-box">
                    <div class="wrapper-box">
                        <table class="table-style-1">
                            <tr>
                                <th>Course Title</th>
                                <th>Course Detail</th>
                                <th>Course Duration</th>
                                <th>Course Image</th>
                                <th>Category ID</th>
                                <th>Course Price</th>
                                <th>Account</th>
                                <th>Actions</th>
                            </tr>
                            <c:forEach items="${COURSE_LIST}" var="course">
                                <c:if test="${course.isActive == true}">
                                    <tr>
                                        <td>
                                            <c:out value="${course.title}" />                                  
                                        </td>
                                        <td>
                                            <c:out value="${course.detail}" />                                  
                                        </td>
                                        <td>
                                            <c:out value="${course.duration}" />                                    
                                        </td>
                                        <td>
                                            <img src="../Asset/img/classes/${course.img}" alt="img">
                                        </td>
                                        <td>
                                            <c:out value="${course.category.id}" />                                   
                                        </td>
                                        <td>
                                            <c:out value="${course.price}" />                                    
                                        </td>
                                        <td>
                                            <c:out value="${course.account.name}" />  
                                        </td> 
                                        <td style="width: 200px">
                                            <a class="btn btn-red" href="deleteCourseController?id=${course.id}">
                                                Delete</a> 
                                            <a class="btn btn-green" href="updateCourseController?id=${course.id}">
                                                Edit</a> 
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div class="pagination">
                    <c:if test="${NUMPAGE>1}">
                        <c:if test="${PAGE>1}">
                            <a href="viewCourseListController?page=${PAGE-1}"><i class="fa-solid fa-chevron-left"></i></a>
                        </c:if>
                        <c:forEach begin="${1}" var="i" end="${NUMPAGE}">
                            <a href="viewCourseListController?page=${i}" <c:if test="${i==PAGE}">class="p-active"</c:if> >${i}</a>
                        </c:forEach>
                        <c:if test="${PAGE<NUMPAGE}">
                            <a href="viewCourseListController?page=${PAGE<NUMPAGE?(PAGE+1):NUMPAGE}"><i class="fa-solid fa-chevron-right"></i></a>
                        </c:if>
                    </c:if>
                </div>  
            </main>
        </div>
        <%@include file="../Component/toast.jsp" %> 
        <script>
            <c:if test="${SEARCH_ERROR != null}">
            toast({
                title: "Opps!",
                msg: "${SEARCH_ERROR.searchError}",
                type: 'error',
                duration: 5000
            });
            </c:if>
        </script>
    </body>
</html>
