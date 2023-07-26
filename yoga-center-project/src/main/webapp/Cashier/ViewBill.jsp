<%-- 
    Document   : ViewBill
    Created on : Jul 19, 2023, 12:52:59 PM
    Author     : localboss
--%>

<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page import="com.yowu.yogacenter.model.Bill" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cashier</title>

        <!-- Link CSS -->
        <link rel="stylesheet" href="../Asset/css/cashier.css">
        <link rel="stylesheet" href="../Asset/css/alertBoxAdmin.css">
        <link rel="stylesheet" href="../Asset/css/paginationAdmin.css">

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <!-- Google icon -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />


        <!-- Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Library JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="../js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/cashierSideMenu.jsp"></jsp:include>
                <!-- ====================== MAIN ==================== -->
                <main>
                    <div class="top">
                        <button id="menu-btn">
                            <span class="material-symbols-sharp">menu</span>
                        </button>
                        <form action="searchBillCashierController" id="search-box">
                            <input type="text" name="txtSearch" id="search-text" placeholder="Search" required>
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
                

                <h1>View Bill</h1>
                <div id="wrapper">
                    <div class="container__wrapper-box">
                        <div class="wrapper-box">
                            <table class="table-style-1">
                                <tr>

                                    <th>Bill ID</th>
                                    <th>Course</th>
                                    <th>Account</th>
                                    <th>Order Code</th>
                                    <th>Status</th>
                                    <th>Price</th>
                                    <th>Discount</th>
                                    <th>Payment Method</th>
                                    <th>Bill Date</th>
                                    <th>Payment Date</th>
                                    <th>Actions</th>
                                </tr>
                                <c:forEach items="${BILL_LIST}" var="bill">
                                    <c:if test="${bill.isActive == true}"> 
                                        <tr>
                                            <td>
                                                ${bill.id}
                                            </td>
                                            <td>
                                                ${bill.course.title}
                                            </td>

                                            <td>
                                                ${bill.account.name}
                                            </td>
                                            <td>
                                                ${bill.orderCode}
                                            </td>
                                            <td>
                                                ${Bill.getEnumIndex(bill.status).name()}
                                            </td>
                                            <td>
                                                ${bill.value}
                                            </td>
                                            <td>
                                                ${bill.discount}
                                            </td>
                                            <td>
                                                ${bill.paymentMethod}
                                            </td>
                                            <td>
                                                ${bill.date}
                                            </td>
                                            <td>
                                                ${bill.paymentDate}
                                            </td>
                                            <td>
                                                <a class="btn btn-green" href="updateBillCashierController?id=${bill.id}">Edit</a> 
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                            </table>

                        </div>
                    </div>
                </div>
                <div class="pagination">
                    <c:if test="${NUMPAGE>1}">
                        <c:if test="${PAGE>1}">
                            <a href="viewBillCashierController?page=${PAGE-1}"><i class="fa-solid fa-chevron-left"></i></a>
                            </c:if>
                            <c:forEach begin="${1}" var="i" end="${NUMPAGE}">
                            <a href="viewBillCashierController?page=${i}" <c:if test="${i==PAGE}">class="p-active"</c:if> >${i}</a>
                        </c:forEach>
                        <c:if test="${PAGE<NUMPAGE}">
                            <a href="viewBillCashierController?page=${PAGE<NUMPAGE?(PAGE+1):NUMPAGE}"><i class="fa-solid fa-chevron-right"></i></a>
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


