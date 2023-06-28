<%-- 
    Document   : EditCourse
    Created on : Jun 26, 2023, 4:03:12 PM
    Author     : DungVNT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Course</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/adminAddScreen.css">
        <style>
            img{
                width: 200px;
                height: 200px;
            }
        </style>
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
                    <input type="file" accept="image/*" onchange="loadFile(event)">
                    <img id="output" src="../Asset/img/classes/${COURSE.img}" alt="img">                    
                    <label for="">Image</label>
                </div>
                <div class="input__group">
                    <select name="categoyList" id="category">
                        <option value="${COURSE.category.id}"> ${COURSE.category.name} </option>
                        <c:forEach items="${CATEGORY_UPDATE_OPTIONS}" var="list">
                            <c:if test="${list.isActive == true }">
                                <c:if test="${COURSE.category.name != list.name}">
                                    <option value="${list.id}"> ${list.name} </option>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </select>
                    <label for="">Category</label>
                </div>
                <div class="input__group">
                    <input type="text" name="txtPrice" value="${COURSE.price}">
                    <label for="">Price</label>
                </div>
                <button type="submit" value="Add" id="btn__Add">Update</button>
                <button type="reset" value="Reset" id="btn__Reset">Refresh</button>
            </form>                 
        </div>
                    
        <script>
            var loadFile = function (event) {
                var image = document.getElementById('output');
                image.src = URL.createObjectURL(event.target.files[0]);
            };
        </script>
    </body>
</html>
