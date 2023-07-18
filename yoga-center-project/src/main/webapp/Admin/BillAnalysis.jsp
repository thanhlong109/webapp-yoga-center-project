<%-- 
    Document   : BillAnalysis
    Created on : Jul 18, 2023, 9:33:40 AM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill Analysis</title>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/dashboard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/analysis.css">
        <!-- Library JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/Asset/js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
        <style>
            #wrapper{
                padding-top: 16px;
                display: flex;
                min-height: 80vh;
                column-gap: 8%;
                flex-wrap: wrap;
                margin-right: 32px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!-- LEFT SIDE-BAR -->
            <%@include file="../Component/adminSideMenu2.jsp" %>
            <!-- ====================== MAIN ==================== -->
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
                            <img src="../Asset/img/avatar/hinh-avatar-1.png" alt="">
                        </div>
                    </div> 
                </div>
                <h2 class="title">DashBoard</h2>
                <div id="wrapper">
                    <div class="report-wrapper chart-border">
                        <div class="report-item ${TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Bill Course Paid</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${TOTAL_PAID_BILL}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH)/TOTAL_PAID_BILL_PRE_MONTH)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Accounts</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${TOTAL_PAID_BILL}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH)/TOTAL_PAID_BILL_PRE_MONTH)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Accounts</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${TOTAL_PAID_BILL}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH)/TOTAL_PAID_BILL_PRE_MONTH)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Accounts</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${TOTAL_PAID_BILL}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH)/TOTAL_PAID_BILL_PRE_MONTH)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${TOTAL_PAID_BILL-TOTAL_PAID_BILL_PRE_MONTH})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                    </div>
                    <div class="row h-320">

                    </div>                   
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script>
            $('.item-status-up .icon-status').html('<i class="fa-solid fa-chevron-up"></i>');
            $('.item-status-down .icon-status').html('<i class="fa-solid fa-chevron-down"></i>');
        </script>
    </body>
</html>
