<%-- 
    Document   : EditCourse2
    Created on : Jun 29, 2023, 7:16:57 PM
    Author     : DungVNT
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Course</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/dashboard_2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/alertBoxAdmin.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-jquery@1/dist/tinymce-jquery.min.js"></script>
        <script src="https://cdn.tiny.cloud/1/d0pdth25h6ucisyj1a2xqwiqamcmwz0so59g11ehrng09e2y/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/adminSideMenu2.jsp"></jsp:include>
                <main>
                    <div class="top">
                        <button id="menu-btn">
                            <span class="material-symbols-sharp">menu</span>
                        </button>
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
                    <h1>Update Course</h1>
                    <div id="wrapper">
                        <form action="updateCourseController" method="post" enctype="multipart/form-data">
                            <h3>Update Course</h3>
                            <div class="input__group">
                                <input type="hidden" name="txtId" value="${COURSE.id}">
                            <input type="text" name="txtTitle" value="${COURSE.title}">
                            <label for="">Title</label>
                        </div>
                        <c:if test="${UPDATE_COURSE_ERROR.courseTitleLengthError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_COURSE_ERROR.courseTitleLengthError}
                            </div>
                        </c:if>
                        <c:if test="${UPDATE_COURSE_ERROR.courseTitleDuplicateError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_COURSE_ERROR.courseTitleDuplicateError}
                            </div>
                        </c:if>
                            <p>Details</p>
                        <div class="input__group detail">
                            <textarea id="textEditor" name="txtDetail" id="detail" rows="5" value="${COURSE.detail}">${COURSE.detail}</textarea>
                        </div>
                        <c:if test="${UPDATE_COURSE_ERROR.courseDetailLengthError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_COURSE_ERROR.courseDetailLengthError}
                            </div>
                        </c:if>
                        <div class="input__group">
                            <input type="text" name="txtDuration" value="${COURSE.duration}">
                            <label for="">Duration</label>
                        </div>
                        <c:if test="${UPDATE_COURSE_ERROR.courseDurationError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_COURSE_ERROR.courseDurationError}
                            </div>
                        </c:if>
                        <div class="input__group image">
                            <input type="hidden" name="originImg" value="${COURSE.img}">
                            <input type="file" name="courseImg" accept=".png, .jpg" onchange="loadFile(this)">
                            <img id="output" src="../Asset/img/classes/${COURSE.img}" alt="img">
                        </div>
                        <div class="input__group filter">
                            <select class="input-filter" name="categoyList" id="categoy">
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
                        <div class="input__group filter">
                            <select class="input-filter" name="accountList" id="account">
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
                        <c:if test="${UPDATE_COURSE_ERROR.coursePriceError != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_COURSE_ERROR.coursePriceError}
                            </div>
                        </c:if>
                        <c:if test="${UPDATE_COURSE_ERROR.error != null}">
                            <div class="alert">
                                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                                <strong>Warning!</strong> ${UPDATE_COURSE_ERROR.error}
                            </div>
                        </c:if>   
                        <div class="input__button">
                            <button type="submit" value="Add" id="btn__Add">Update</button>
                            <button type="reset" value="Reset" id="btn__Reset" onclick="loadDefault()">Refresh</button>
                        </div>

                    </form>
                </main>
        </div>
        <script>
            
             tinymce.init({
                selector: '#textEditor',
                plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss',
                toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
                tinycomments_mode: 'embedded',
                tinycomments_author: 'Author name',
                mergetags_list: [
                    {value: 'First.Name', title: 'First Name'},
                    {value: 'Email', title: 'Email'},
                ]
            });
            
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
            var close = document.getElementsByClassName("closebtn");
            var i;

            for (i = 0; i < close.length; i++) {
                close[i].onclick = function () {
                    var div = this.parentElement;
                    div.style.opacity = "0";
                    setTimeout(function () {
                        div.style.display = "none";
                    }, 600);
                };
            }
        </script>
    </body>
</html>
