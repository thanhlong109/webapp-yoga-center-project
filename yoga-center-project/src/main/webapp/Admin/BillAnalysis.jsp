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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/dashboard_2.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/analysis.css">
        <!-- Library JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/Asset/js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
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
                        <div class="report-item ${totalAccount-totalAccountPreMonth>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Accounts</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${totalAccount}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((totalAccount-totalAccountPreMonth)/totalAccountPreMonth)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${totalAccount-totalAccountPreMonth})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${totalIncome-totalIncomePreMonth>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Income</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">$${totalIncome}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span>${IncomePrecent}% (<span class="report-item-status"></span><fmt:formatNumber value="${totalIncome-totalIncomePreMonth}" pattern="##.##"/>$)</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${totalEnrollment-totalEnrollmentPreMonth>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Course Enrollment</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${totalEnrollment}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><c:if test="${totalEnrollmentPreMonth!=0}"><fmt:formatNumber value="${((totalEnrollment-totalEnrollmentPreMonth)/totalEnrollmentPreMonth)*100}" pattern="##.##"/></c:if><c:if test="${totalEnrollmentPreMonth==0}">100</c:if>% (<span class="report-item-status"></span>${totalEnrollment-totalEnrollmentPreMonth})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${totalBlog-totalBlogPreMonth>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Post Blogs</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${totalBlog}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><c:if test="${totalBlogPreMonth!=0}"><fmt:formatNumber value="${((totalBlog-totalBlogPreMonth)/totalBlogPreMonth)*100}" pattern="##.##"/></c:if><c:if test="${totalBlogPreMonth==0}">100</c:if>% (<span class="report-item-status"></span>${totalBlog-totalBlogPreMonth})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                    </div>
                    <div class="row h-320">
                        <div class="chart-border chart-3">
                            <form id="chart3-year" action="dashboard" method="post">
                                <select id="chart3-year-select" name="chart3Year">
                                    <c:forEach items="${accountYearList}" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>
                            </form>
                            <div id="chart-3">
                            </div>
                        </div>
                        <div class="w-34">
                            <div id="chart-2" class="chart-border"></div>
                        </div>
                    </div>
                    <div class="row h-380">
                        <div id="sell-chart" class="chart-border">
                            <div id="chart-area">
                            </div>
                            <div id="chart-bar">
                            </div>
                        </div>
                        <div class="chart-border chart-4 w-34">
                            <div id="chart-4">
                            </div>
                        </div>
                        
                    </div>
                </div>
            </main>
        </div>
    </body>
</html>
