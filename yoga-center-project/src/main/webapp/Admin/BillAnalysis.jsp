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
                        <div class="report-item ${TOTAL_BILL_COURSE_INCOME-TOTAL_BILL_COURSE_INCOME_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Bill Course Income</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">$${TOTAL_BILL_COURSE_INCOME}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span>${TOTAL_BILL_COURSE_INCOME_PERCENT}% (<span class="report-item-status"></span><fmt:formatNumber value="${TOTAL_BILL_COURSE_INCOME-TOTAL_BILL_COURSE_INCOME_PRE_MONTH}" pattern="##.##"/>$)</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${TOTAL_PAID_BILL_MEMBERSHIP-TOTAL_PAID_BILL_MEMBERSHIP_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Bill Membership Paid</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">${TOTAL_PAID_BILL_MEMBERSHIP}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span><fmt:formatNumber value="${((TOTAL_PAID_BILL_MEMBERSHIP-TOTAL_PAID_BILL_MEMBERSHIP_PRE_MONTH)/TOTAL_PAID_BILL_MEMBERSHIP_PRE_MONTH)*100}" pattern="##.##"/>% (<span class="report-item-status"></span>${TOTAL_PAID_BILL_MEMBERSHIP-TOTAL_PAID_BILL_MEMBERSHIP_PRE_MONTH})</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                        <div class="report-item ${TOTAL_BILL_MEMBERSHIP_INCOME-TOTAL_BILL_MEMBERSHIP_INCOME_PRE_MONTH>0?'item-status-up':'item-status-down'}">
                            <h4 class="report-item-title">Total Bill Membership Income</h4>
                            <div class="report-item-statis-wrapper">
                                <div class="report-item-statis">
                                    <span class="report-item-number">$${TOTAL_BILL_MEMBERSHIP_INCOME}</span>
                                </div>
                                <div class="report-item-percent" >
                                    <p><span class="icon-status"></span>${TOTAL_BILL_MEMBERSHIP_INCOME_PERCENT}% (<span class="report-item-status"></span><fmt:formatNumber value="${TOTAL_BILL_MEMBERSHIP_INCOME-TOTAL_BILL_MEMBERSHIP_INCOME_PRE_MONTH}" pattern="##.##"/>$)</p>
                                </div>
                            </div>
                            <div class="report-item-compare">
                                vs previous 30 days
                            </div>
                        </div>
                    </div>
                    <div class="row h-320">
                        <div class="chart-border chart-1">
                            <form id="chart1-year" action="blogAnalysisController" method="post">
                                <label style="color: #7d8da1">Years</label>
                                <select id="chart1-year-select" name="chart1Year" style="color: #7d8da1">
                                    <c:forEach items="${BILL_YEAR_LIST}" var="i">
                                        <option value="${i}">${i}</option>
                                    </c:forEach>
                                </select>
                            </form>
                            <div id="chart-1">
                            </div>
                        </div>
                        <div class="chart-border w-34">
                            <div id="chart-2"></div>
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
        <script>
            function getMonthName(monthNumber) {
                const date = new Date();
                date.setMonth(monthNumber - 1);

                return date.toLocaleString('en-US', {month: 'long'});
            }
            chart1Init();
            var char1;
            function chart1Init() {
                var billCourseData =${PAID_BILL_COURSE_DATE_DATA};
                var billMembershipData = ${PAID_BILL_MEMBERSHIP_DATE_DATA};
                var categoriesData = getArrToMonth(billCourseData.length);

                function getArrToMonth(nmonth) {
                    let arrData = [];
                    for (let cindex = 1; cindex <= nmonth; cindex++) {
                        arrData.push(getMonthName(cindex));
                    }
                    return arrData;
                }
                var options = {
                    chart: {
                        height: "100%",
                        width: "100%",
                        type: "line",
                        stacked: false
                    },
                    dataLabels: {
                        enabled: false
                    },
                    colors: ["#FF1654", "#247BA0"],
                    series: [
                        {
                            name: "Paid Bill Course",
                            data: billCourseData
                        },
                        {
                            name: "Paid Bill Membership",
                            data: billMembershipData
                        }
                    ],
                    stroke: {
                        width: [4, 4]
                    },
                    plotOptions: {
                        bar: {
                            columnWidth: "20%"
                        }
                    },
                    xaxis: {
                        categories: categoriesData
                    },
                    yaxis: [
                        {
                            axisTicks: {
                                show: true
                            },
                            axisBorder: {
                                show: true,
                                color: "#FF1654"
                            },
                            labels: {
                                style: {
                                    colors: "#FF1654"
                                }
                            },
                            title: {
                                text: "Bill Course",
                                style: {
                                    color: "#FF1654"
                                }
                            }
                        },
                        {
                            opposite: true,
                            axisTicks: {
                                show: true
                            },
                            axisBorder: {
                                show: true,
                                color: "#247BA0"
                            },
                            labels: {
                                style: {
                                    colors: "#247BA0"
                                }
                            },
                            title: {
                                text: "Bill Membership",
                                style: {
                                    color: "#247BA0"
                                }
                            }
                        }
                    ],
                    tooltip: {
                        shared: false,
                        intersect: false,
                        x: {
                            show: true
                        }
                    },
                    legend: {
                        horizontalAlign: "left",
                        offsetX: 40
                    }, title: {
                        text: "MONTHLY PAID BILL CHART",
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
                    }
                };
                var char1 = new ApexCharts(document.querySelector("#chart-1"), options);
                char1.render();
                $('#chart1-year-select').change(function () {
                    $.ajax({
                        type: "POST",
                        cache: false,
                        url: "billAnalysisController",
                        data: "action=updateChart1&chart1Year=" + $(this).find(":selected").val(),
                        success: function (data) {
                            var chartData = JSON.parse(data);
                            const billCourseData = JSON.parse(chartData.PAID_BILL_COURSE_DATE_DATA);
                            const billMembershipData = JSON.parse(chartData.PAID_BILL_MEMBERSHIP_DATE_DATA);
                            const arrMonth = getArrToMonth(billCourseData.length);
                            char1.updateOptions({
                                series: [{
                                        name: 'Bill Course',
                                        data: billCourseData
                                    }, {
                                        name: 'Bill Membership',
                                        data: billMembershipData
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

            chart2Init();
            function chart2Init() {
                var options = {
                    series: ${ALL_BILL_STATUS_DATA},
                    chart: {
                        height: '100%',
                        type: 'pie',
                        toolbar: {
                            show: true
                        }, csv: {
                            filename: "BillStatusDistributiomChart",
                            columnDelimiter: ',',
                            headerCategory: 'Status',
                            headerValue: 'Total',
                        },
                        svg: {
                            filename: "BillStatusDistributiomChart",
                        },
                        png: {
                            filename: "BillStatusDistributiomChart",
                        }
                    },
                    labels: ["Completed", "Canceled", "Pending"],
                    theme: {
                        monochrome: {
                            enabled: true
                        }
                    }, grid: {
                        padding: {
                            top: 20
                        }
                    },
                    plotOptions: {
                        pie: {
                            customScale: 1,
                            dataLabels: {
                                offset: -5
                            }
                        }
                    },
                    title: {
                        text: "BILL STATUS DISTRIBUTION CHART",
                        align: 'left',
                        margin: 10,
                        offsetX: 0,
                        offsetY: 0,
                        floating: false,
                        style: {
                            fontSize: '14px',
                            fontWeight: 'bold',
                            color: '#7d8da1',
                        },
                    },
                    dataLabels: {
                        formatter(val, opts) {
                            const name = opts.w.globals.labels[opts.seriesIndex]
                            return [name, val.toFixed(1) + '%']
                        }
                    },
                    legend: {
                        show: false
                    }
                };

                var chart = new ApexCharts(document.querySelector("#chart-2"), options);
                chart.render();
            }
        </script>
    </body>
</html>
