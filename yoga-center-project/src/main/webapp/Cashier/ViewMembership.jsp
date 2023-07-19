<%-- 
    Document   : ViewMembership
    Created on : Jul 13, 2023, 9:50:49 PM
    Author     : localboss
--%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page import="com.yowu.yogacenter.model.BillMembership" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cashier</title>
        <!-- Link CSS -->
        <link rel="stylesheet" href="../Asset/css/cashier.css"/>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/cashierSideMenu.jsp"></jsp:include>
                <main>
                    <div class="top">
                        <button id="menu-btn">
                            <span class="material-symbols-sharp">menu</span>
                        </button>
                        <form action="SearchMembershipCashierController" id="search-box">
                            <input type="text" id="search-text" placeholder="Search" required>
                            <button id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                        <div class="profile">
                            <div class="info">
                                <p>Hey, <b>Cashier</b></p>
                                <small class="text-muted">Cashier</small>
                            </div>
                            <div class="profile-photo">
                                <img src="../Asset/img/avatar/hinh-avatar-1.png" alt="">
                            </div>
                        </div>
                    </div>
                    <h1>View Membership</h1>
                    <div class="container__wrapper-box">
                        <div class="wrapper-box">
                            <table class="table-style-1">
                                <tr>
                                    <th>Membership ID</th>
                                    <th>Account Name</th>
                                    
                                    <th>Bill Status</th>
                                    <th>Bill Value</th>
                                    <th>Discount (%)</th>
                                    <th>Bill Date</th>
                                    <th>Order Code</th>
                                    <th>Payment Method</th>
                                    <th>Payment Date</th>
                                    <th>Actions</th>
                                </tr>
                            <c:forEach items="${MEMBERSHIP_LIST}" var="membership">
                                <c:if test="${membership.isActive == true}"> 
                                    <tr>
                                        <td>
                                            ${membership.id}
                                        </td>
                                        <td>
                                            ${membership.account.name}
                                        </td>
                                       
                                        <td>
                                            ${BillMembership.getEnumIndex(membership.status)}
                                        </td>
                                        <td>
                                            ${membership.value}
                                        </td>    
                                        <td>
                                            ${membership.discount}
                                        </td>
                                        <td>
                                            ${membership.date}
                                        </td>
                                        <td>
                                            ${membership.ordercode}
                                        </td>
                                        <td>
                                             ${membership.method}
                                        </td>
                                         <td>
                                             ${membership.paymentDate}
                                        </td>
                                        <td>
                                            <div class="button">
                                                <a class="btn btn-red" href="deleteMembershipCashierController?id=${membership.id}">
                                                    Delete</a> 
                                                <a class="btn btn-green" href="updateMembershipCashierController?id=${membership.id}">
                                                    Edit</a> 
                                            </div>

                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
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
        </script>
    </body>
</html>
