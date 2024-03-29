<%-- 
    Document   : ViewBill
    Created on : Jun 21, 2023, 7:25:37 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.yowu.yogacenter.model.Bill" %>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Course</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/dashboard_2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/adminEditCategory_2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/paginationAdmin.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/alertBoxAdmin.css">
        <!-- Library JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/adminSideMenu2.jsp"></jsp:include>
                <main>
                    <div class="top">
                        <button id="menu-btn">
                            <span class="material-symbols-sharp">menu</span>
                        </button>
                        <form action="searchBillController" id="search-box">
                            <input name="txtSearch" type="text" id="search-text" placeholder="Search anything you want" required>
                            <button type="submit" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </form>
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
                <c:if test="${SEARCH_ERROR != null}">
                    <div class="alert">
                        <span class="closebtn" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                        <strong>Warning!</strong> ${SEARCH_ERROR.searchError}
                    </div>
                </c:if>
                <h1>Bill List</h1>
                <div class="container__wrapper-box">
                    <div class="wrapper-box">
                        <table class="table-style-1">
                            <tr>
                                <th>Course</th>
                                <th>Account</th>
                                <th>Bill Status</th>
                                <th>Bill Value</th>
                                <th>Bill Discount</th>
                                <th>Bill Date</th> 
                                <th>Order Code</th> 
                                <th>Payment Method</th> 
                                <th>Payment Date</th> 
                            </tr>
                            <c:forEach items="${BILL_LIST}" var="bill">
                                <c:if test="${bill.isActive == true}"> 
                                    <tr>
                                        <td>
                                            ${bill.course.title}
                                        </td>
                                        <td>
                                            ${bill.account.name}
                                        </td>
                                        <td>
                                            ${Bill.getEnumIndex(bill.status)}
                                        </td>
                                        <td>
                                            ${bill.value}
                                        </td>
                                        <td>
                                            ${bill.discount}
                                        </td>
                                        <td>
                                            ${bill.date}
                                        </td>   
                                        <td>
                                            ${bill.orderCode}
                                        </td> 
                                        <td>
                                            ${bill.paymentMethod}
                                        </td> 
                                        <td>
                                            ${bill.paymentDate}
                                        </td> 
                                    </tr>
                                </c:if>
                            </c:forEach>

                        </table>
                    </div>
                </div>
                <div class="pagination">
                    <c:if test="${NUMPAGE>1}">
                        <c:if test="${PAGE>1}">
                            <a href="viewBillListController?page=${PAGE-1}"><i class="fa-solid fa-chevron-left"></i></a>
                            </c:if>
                            <c:forEach begin="${1}" var="i" end="${NUMPAGE}">
                            <a href="viewBillListController?page=${i}" <c:if test="${i==PAGE}">class="p-active"</c:if> >${i}</a>
                        </c:forEach>
                        <c:if test="${PAGE<NUMPAGE}">
                            <a href="viewBillListController?page=${PAGE<NUMPAGE?(PAGE+1):NUMPAGE}"><i class="fa-solid fa-chevron-right"></i></a>
                            </c:if>
                        </c:if>
                </div>  
            </main>
        </div>
    </body>
</html>
