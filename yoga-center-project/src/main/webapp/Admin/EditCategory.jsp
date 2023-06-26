<%-- 
    Document   : EditCategory
    Created on : Jun 26, 2023, 8:20:35 AM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/adminAddScreen.css">
        <style>
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
            <form action="updateCategoryController" method="post">
                <h3>Update Category</h3>
                <div class="input__group">
                    <input type="hidden" name="txtId" value="${CATEGORY.id}">
                    <input type="text" name="txtName" value="${CATEGORY.name}">
                    <label for="">Name</label>
                </div>
                <button type="submit" value="Add" id="btn__Add">Update</button>
            </form>                 
        </div>
        <c:if test="${UPDATE_STATUS != null}">
            <div class="alert">
                <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span>
                ${UPDATE_STATUS}   
            </div>
        </c:if>
    </body>
</html>
