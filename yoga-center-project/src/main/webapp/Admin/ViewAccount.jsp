<%-- 
    Document   : ViewAccount
    Created on : Jun 21, 2023, 7:45:37 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Account</title>
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
        <!-- Link CSS -->
        <link rel="stylesheet" href="../Asset/css/dashboard_2.css">
        <link rel="stylesheet" href="../Asset/css/adminEditCategory_2.css">
        <!-- Library JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="../js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
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
                        <form action="searchAccountController" id="search-box">
                            <input name="txtSearch" type="text" id="search-text" placeholder="Search anything you want" required>
                            <button type="submit" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
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
                    <h1>Account List</h1>
                    <div class="container__wrapper-box">
                        <div class="wrapper-box">
                            <table class="table-style-1">
                                <tr>
                                    <th>Account ID</th>
                                    <th>Account Image</th>
                                    <th>Account Name</th>
                                    <th>Account Email</th>
                                    <th>Account Phone</th>
                                    <th>Social ID</th>
                                    <th>Role</th>
                                    <th>Actions</th>
                                </tr>
                            <c:forEach items="${ACCOUNT_LIST}" var="account">
                                <c:if test="${account.isActive== true}"> 
                                <tr>
                                    <td>
                                        ${account.id}
                                    </td>
                                    <td>
                                        <img class="image" src="../Asset/img/account/${account.img}" alt="img">  
                                    </td>
                                    <td>
                                        ${account.name}
                                    </td>
                                    <td>
                                        ${account.email}
                                    </td>
                                    <td>
                                        ${account.phone}
                                    </td>
                                    <td>
                                        ${account.socialID}
                                    </td>
                                    <td>
                                        ${account.role.name}
                                    </td>                                                                                   
                                    <td>
                                        <a class="btn btn-red" href="deleteAccountController?id=${account.id}">
                                            Delete</a> 
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
