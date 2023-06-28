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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/dashboard.css">
        <link rel="stylesheet" href="../Asset/css/adminCommon.css">
        <script src="../js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
        <style>
            img{
                width: 200px;
                height: 200px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/adminSideMenu.jsp"></jsp:include>
                <div class="right-container">
                    <div class="wrapper-box">

                        <table class="table-style-1">
                            <tr>
                                <th>Course ID</th>
                                <th>Course Title</th>
                                <th>Course Detail</th>
                                <th>Course Duration</th>
                                <th>Course Image</th>
                                <th>Category ID</th>
                                <th>Course Price</th>
                                <th>Is Active</th>
                                <th>Actions</th>
                            </tr>
                        <c:forEach items="${COURSE_LIST}" var="course">
                            <tr>
                                <td>
                                    <c:out value="${course.id}"/>                                  
                                </td>
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
                                    <input type="checkbox" name="isActived" value="ON" 
                                           <c:if test="${course.isActive}"> 
                                               checked="checked"
                                           </c:if>
                                           />
                                </td> 
                                <td>
                                    <a class="btn btn-red" href="#delete">
                                        Detete</a> 
                                    <a class="btn btn-green" href="updateCourseController?id=${course.id}">
                                        Edit</a> 
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
