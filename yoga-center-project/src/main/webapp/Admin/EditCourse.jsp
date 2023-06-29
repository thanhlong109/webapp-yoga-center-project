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
            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
            }

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }
        </style>
    </head>
    <body>
        <div id="wrapper">
            <form action="updateCourseController" method="post" enctype="multipart/form-data">
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
                    <input name="courseImg" type="file" accept="image/*" onchange="loadFile(this)">
                    <input type="hidden" name="originImg" value="${COURSE.img}">
                    <img id="output" src="../Asset/img/classes/${COURSE.img}" alt="img">                    
                    <label for="">Image</label>
                </div>
                <div class="input__group">
                    <select name="categoyList" id="category">
                        <option value="${COURSE.category.id}"> ${COURSE.category.name} </option>
                        <c:forEach items="${CATEGORY_UPDATE_OPTIONS}" var="categoryList">
                            <c:if test="${categoryList.isActive == true }">
                                <c:if test="${COURSE.category.name != categoryList.name}">
                                    <option value="${categoryList.id}"> ${categoryList.name} </option>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </select>
                    <label for="">Category</label>
                </div>
                <div class="input__group">
                    <select name="accountList" id="account">
                        <option value="${COURSE.account.id}"> ${COURSE.account.name} </option>
                        <c:forEach items="${ACCOUNT_UPDATE_OPTIONS}" var="accountList">
                            <c:if test="${accountList.isActive == true }">
                                <c:if test="${COURSE.account.name != accountList.name}">
                                    <option value="${accountList.id}"> ${accountList.name} </option>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </select>
                    <label for="">Account</label>
                </div>
                <div class="input__group">
                    <input type="text" name="txtPrice" value="${COURSE.price}">
                    <label for="">Price</label>
                </div>
                <button type="submit" value="Add" id="btn__Add">Update</button>
                <button type="reset" value="Reset" id="btn__Reset" onclick="loadDefault()">Refresh</button>
            </form>                 
        </div>
        <c:if test="${UPDATE_STATUS != null}">
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                ${UPDATE_STATUS}   
            </div>
        </c:if>

        <script>
            var loadFile = function (event) {
                let reader = new FileReader();
                reader.readAsDataURL(event.files[0]);
                reader.onload = () => {
                    document.getElementById("output").setAttribute("src", reader.result);
                };
                console.log(event.files[0].name);
            };
            var loadDefault = function () {
                document.getElementById("output").setAttribute("src", "../Asset/img/classes/${COURSE.img}");
            };
        </script>
    </body>
</html>
