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
        <link rel="stylesheet" href="../Asset/css/alertBoxAdmin.css"/>
        <link rel="stylesheet" href="../Asset/css/paginationAdmin.css"/>
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
                        <form action="searchBillMembershipCashierController" id="search-box">
                            <input type="text" id="search-text" name="txtSearch" placeholder="Search" required>
                            <button id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
                        <div class="profile">
                            <div class="info">
                                <p>Hey, <b>${sessionScope.account.name}</b></p>
                            <small class="text-muted">Cashier</small>
                        </div>
                        <div class="profile-photo">
                            <img src="../Asset/img/avatar/${sessionScope.account.img}" alt="">
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
                                            ${membership.orderCode}
                                        </td>
                                        <td>
                                            ${membership.paymentMethod}
                                        </td>
                                        <td>
                                            ${membership.paymentDate}
                                        </td>
                                        <td>
                                            <div class="button">
                                             
                                                <a class="btn btn-green" href="updateMembershipCashierController?id=${membership.id}">
                                                    Edit</a> 
                                            </div>

                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                     <div class="pagination">
                    <c:if test="${NUMPAGE>1}">
                        <c:if test="${PAGE>1}">
                            <a href="viewMembershipCashierController?page=${PAGE-1}"><i class="fa-solid fa-chevron-left"></i></a>
                            </c:if>
                            <c:forEach begin="${1}" var="i" end="${NUMPAGE}">
                            <a href="viewMembershipCashierController?page=${i}" <c:if test="${i==PAGE}">class="p-active"</c:if> >${i}</a>
                        </c:forEach>
                        <c:if test="${PAGE<NUMPAGE}">
                            <a href="viewMembershipCashierController?page=${PAGE<NUMPAGE?(PAGE+1):NUMPAGE}"><i class="fa-solid fa-chevron-right"></i></a>
                        </c:if>
                    </c:if>
                </div>
            </main>
        </div>
        <%@include file="../Component/toast.jsp" %>
                            <script>
                                <c:if test="${SEARCH_ERROR != null}">
                                    toast({
                                       title: "Oops!",
                                       msg: "${SEARCH_ERROR.searchError}",
                                       type: 'error',
                                       duration: 5000
                                    });
                                </c:if>
                            </script>
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

