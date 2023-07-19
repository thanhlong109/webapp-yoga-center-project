<%-- 
    Document   : BlogAnalysis
    Created on : Jul 18, 2023, 10:16:49 AM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog Analysis</title>
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
            .report-wrapper{
                justify-content: space-evenly;
            }
            #chart-1{
                height: 100%;
            }
            .chart-1{
                width: 60%;
                position: relative;
            }

            #chart1-year{
                position: absolute;
                top: calc(1rem + 4px);
                right: 200px;
                z-index: 10;

            }
            #chart1-year select{
                padding: 4px 8px;
                border-bottom: 2px solid #7d8da1;
                background: #f6f6f9;
                cursor: pointer;
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
                            <img src="../Asset/img/avatar/${sessionScope.account.img}" alt="">
                        </div>
                    </div> 
                </div>
                <h2 class="title">Blog Analysis</h2>
                <div id="wrapper">
                    <div class="report-wrapper chart-border">
                        <div class="report-item ${TOTAL_BLOG-TOTAL_BLOG_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Blog</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${TOTAL_BLOG}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((TOTAL_BLOG-TOTAL_BLOG_PRE_MONTH)/TOTAL_BLOG_PRE_MONTH)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${TOTAL_BLOG-TOTAL_BLOG_PRE_MONTH})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${TOTAL_COMMENT-TOTAL_COMMENT_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Interactions</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${TOTAL_COMMENT}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((TOTAL_COMMENT-TOTAL_COMMENT_PRE_MONTH)/TOTAL_COMMENT_PRE_MONTH)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${TOTAL_COMMENT-TOTAL_COMMENT_PRE_MONTH})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item">
                            <h4 class="report-item-title">Most Comment Blog</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${MOST_COMMENT_BLOG.blog.title}</span>
                                </div>                               
                            </div>
                            <div class="report-item-compare">
                                <strong>${TOTAL_COMMENT_IN_MOST_COMMENT_BLOG} </strong> comments
                            </div>
                        </div>
<!--                        <div class="report-item ${TOTAL_COMMENT-TOTAL_COMMENT_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Interactions</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${TOTAL_COMMENT}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((TOTAL_COMMENT-TOTAL_COMMENT_PRE_MONTH)/TOTAL_COMMENT_PRE_MONTH)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${TOTAL_COMMENT-TOTAL_COMMENT_PRE_MONTH})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>-->
                    </div>
                    <div class="row h-320">
                        <div class="chart-border chart-1">
                            <form id="chart1-year" action="blogAnalysisController" method="post">
                                <select id="chart1-year-select" name="chart1Year">
                                    <c:forEach items="${BLOG_YEAR_LIST}" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>
                            </form>
                            <div id="chart-1">
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script>
            $('.item-status-up .icon-status').html('<i class="fa-solid fa-chevron-up"></i>');
            $('.item-status-down .icon-status').html('<i class="fa-solid fa-chevron-down"></i>');
        </script>
        <script defer>
            function getMonthName(monthNumber) {
                const date = new Date();
                date.setMonth(monthNumber - 1);

                return date.toLocaleString('en-US', {month: 'long'});
            }
            chart1Init();
            var char1;
            function chart1Init() {
                var blogData = ${BLOG_DATE_DATA};
                var categoriesData = getArrToMonth(blogData.length);

                function getArrToMonth(nmonth) {
                    let arrData = [];
                    for (let cindex = 1; cindex <= nmonth; cindex++) {
                        arrData.push(getMonthName(cindex));
                    }
                    return arrData;
                }
                var options = {
                    series: [{
                            name: "Blog",
                            data: blogData
                        }],
                    chart: {
                        height: "100%",
                        width: "100%",
                        type: 'line',
                        zoom: {
                            enabled: false
                        }
                    },
                    dataLabels: {
                        enabled: false
                    },
                    stroke: {
                        curve: 'straight'
                    },
                    title: {
                        text: 'MONTHLY POST BLOG CHART',
                        align: 'left',
                        margin: 10,
                        offsetX: 0,
                        offsetY: 0,
                        floating: false,
                        style: {
                            fontSize: '14px',
                            fontWeight: 'bold',
                            color: '#7d8da1'
                        }
                    },
                    grid: {
                        row: {
                            colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
                            opacity: 0.5
                        }
                    },
                    xaxis: {
                        categories: categoriesData
                    }
                };
                var char1 = new ApexCharts(document.querySelector("#chart-1"), options);
                char1.render();
                $('#chart1-year-select').change(function () {
                    $.ajax({
                        type: "POST",
                        cache: false,
                        url: "blogAnalysisController",
                        data: "action=updateChart1&chart1Year=" + $(this).find(":selected").val(),
                        success: function (data) {
                            var chartData = JSON.parse(data);
                            const blogDateData = JSON.parse(chartData.BLOG_DATE_DATA);
                            const arrMonth = getArrToMonth(blogDateData.length);
                            char1.updateOptions({
                                series: [{
                                        name: 'Blog',
                                        data: blogDateData
                                    }],
                                xaxis: {
                                    categories: arrMonth
                                }
                            });

                        }, error: function (xhr, textStatus, errorThrown) {

                        }
                    });
                });
            }
        </script>
    </body>
</html>
