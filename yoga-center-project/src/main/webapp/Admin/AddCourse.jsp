<%-- 
    Document   : AddCourse
    Created on : Jun 29, 2023, 2:32:20 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Course</title>
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
                                <p>Hey, <b>Admin</b></p>
                                <small class="text-muted">Admin</small>
                            </div>
                            <div class="profile-photo">
                                <img src="../Asset/img/avatar/hinh-avatar-1.png" alt="">
                            </div>
                        </div>
                    </div>
                    <h1>Add Course</h1>
                    <div id="wrapper">
                        <form action="../admin/addCourseController" method="post" enctype="multipart/form-data">
                            <h3>Add Course</h3>

                            <div class="input__group">
                                <input type="text" name="txtTitle" required>
                                <label for="">Title</label>
                            </div>

                            <div class="input__group detail">
                                <textarea name="txtDetail" id="detail" rows="5" required></textarea>
                                <label for="">Details</label>
                            </div>

                            <div class="input__group">
                                <input type="text" name="txtDuration" required>
                                <label for="">Duration</label>
                            </div>

                            <div class="input__group image">
                                <input type="file" name="courseImg" accept=".png, .jpg" onchange="loadFile(this)">
                                <img src="" alt="" id="output">
                            </div>

                            <div class="input__group filter">
                                <select class="input-filter" name="categoyList" id="categoy">
                                <c:forEach items="${CATEGORY_ADD_OPTIONS}" var="categoryList">
                                    <c:if test="${categoryList.isActive == true }">
                                        <option value="${categoryList.id}"> ${categoryList.name} </option>                              
                                    </c:if>
                                </c:forEach>
                            </select>
                            <label for="">Category</label>
                        </div>

                        <div class="input__group filter">
                            <select class="input-filter" name="accountList" id="account">
                                <c:forEach items="${ACCOUNT_ADD_OPTIONS}" var="accountList">
                                    <c:if test="${accountList.isActive == true }">
                                        <c:if test="${accountList.role.id == 2}">
                                        <option value="${accountList.id}"> ${accountList.name} </option>  
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <label for="">Account</label>
                        </div>
                        <div class="input__group">
                            <input type="text" name="txtPrice" required>
                            <label for="">Price</label>
                        </div>
                        <div class="input__button">
                            <button type="submit" value="Add" id="btn__Add">Add</button>
                            <button type="reset" value="Reset" id="btn__Reset">Refresh</button>
                        </div>
                    </form>
                </div>
            </main>
        </div>
        <script>
            var sidebarElements = document.querySelectorAll(".sidebar-elements");
            sidebarElements.forEach(btn => {
                $(btn).click(function () {
                    $(this).children(".sub-item").slideToggle(300);
                });
            });

            var loadFile = function (event) {
                let reader = new FileReader();
                reader.readAsDataURL(event.files[0]);
                reader.onload = () => {
                    document.getElementById("output").setAttribute("src", reader.result);
                };
                console.log(event.files[0].name);
            };
        </script>
    </body>
</html>
