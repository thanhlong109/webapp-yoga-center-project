<%-- 
    Document   : ViewMembership
    Created on : Jun 23, 2023, 10:36:56 AM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Membership</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!--        <link rel="stylesheet" href="../Asset/css/dashboard.css">-->
        <!--        <link rel="stylesheet" href="../Asset/css/adminCommon.css">-->
        <link rel="stylesheet" href="../Asset/css/dashboard_2.css">
        <link rel="stylesheet" href="../Asset/css/adminEditCategory_2.css">
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
                        <form action="searchMembershipController" id="search-box">
                            <input type="text" name="txtSearch" id="search-text" placeholder="Search anything you want" required>
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
                    <h1>Membership List</h1>
                    <div class="container__wrapper-box">
                        <div class="wrapper-box">
                            <table class="table-style-1">
                                <tr>
                                    <th>Membership ID</th>
                                    <th>Name</th>
                                    <th>Duration</th>
                                    <th>Price(VND)</th>
                                    <th>Description</th>
                                    <th>Discount (%)</th>
                                    <th>Actions</th>
                                </tr>
                            <c:forEach items="${MEMBERSHIP_LIST}" var="membership">
                                <c:if test="${membership.isActive == true}"> 
                                    <tr>
                                        <td>
                                            ${membership.id}
                                        </td>
                                        <td>
                                            ${membership.name}
                                        </td>
                                        <td>
                                            ${membership.duration}
                                        </td>
                                        <td>
                                            ${membership.price}
                                        </td>
                                        <td>
                                            ${membership.description}
                                        </td>    
                                        <td>
                                            ${membership.discount}
                                        </td>
                                        <td>
                                            <a class="btn btn-red" href="deleteMembershipController?id=${membership.id}">
                                                Delete</a> 
                                            <a class="btn btn-green" href="updateMembershipController?id=${membership.id}">
                                                Edit</a> 
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
