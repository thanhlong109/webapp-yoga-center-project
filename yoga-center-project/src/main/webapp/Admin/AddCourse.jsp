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
            <form action="../admin/addCourseController" method="post" enctype="multipart/form-data">
                <h3>Update Course</h3>
                <div class="input__group">
                    <input type="text" name="txtTitle" required>
                    <label for="">Title</label>
                </div>
                <div class="input__group">
                    <input type="text" name="txtDetail" required>
                    <label for="">Detail</label>
                </div>
                <div class="input__group">
                    <input type="text" name="txtDuration" required>
                    <label for="">Duration</label>
                </div>
                <div class="input__group">
                    <input name="courseImg" type="file" accept="image/*" onchange="loadFile(this)" required>
                    <img id="output" src="" alt="img">                    
                    <label for="">Image</label>
                </div>
                <div class="input__group">
                    <select name="categoyList" id="category">
                        <c:forEach items="${CATEGORY_ADD_OPTIONS}" var="categoryList">
                            <c:if test="${categoryList.isActive == true }">
                                <option value="${categoryList.id}"> ${categoryList.name} </option>                              
                            </c:if>
                        </c:forEach>
                    </select>
                    <label for="">Category</label>
                </div>
                <div class="input__group">
                    <select name="accountList" id="account">
                        <c:forEach items="${ACCOUNT_ADD_OPTIONS}" var="accountList">
                            <c:if test="${accountList.isActive == true }">
                                <option value="${accountList.id}"> ${accountList.name} </option>                               
                            </c:if>
                        </c:forEach>
                    </select>
                    <label for="">Account</label>
                </div>
                <div class="input__group">
                    <input type="text" name="txtPrice" required>
                    <label for="">Price</label>
                </div>
                <button type="submit" value="Add" id="btn__Add">Update</button>
                <button type="reset" value="Reset" id="btn__Reset" onclick="loadDefault()">Refresh</button>
            </form>                 
        </div>

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
                document.getElementById("output").setAttribute("");
            };
        </script>
    </body>
</html>
