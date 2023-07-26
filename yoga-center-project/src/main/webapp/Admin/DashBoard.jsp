<%-- 
    Document   : DashBoard.jsp
    Created on : Jul 8, 2023, 12:01:25 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dash Board</title>
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
        <!-- Library JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <style>
            main .top{
                padding: 20px 20px 20px 0px;  
                margin-top: 16px;
            }
            
            .h-320{
                height: 320px;
            }
            .h-380{
                height: 380px;
            }
            .row{
                display: flex;
                width: 100%;
                justify-content: space-between;
                margin-bottom: 3rem;
            }
            .w-34{
                width: 34%;
            }
            
              #sell-chart{
                position: relative;
                width: 60%;
                padding: 1rem;
                border-radius: 2 rem;
              }
              #chart-bar {
                position: relative;
                margin-top: -38px;
              }
              
              .link {
                position: absolute;
                bottom: 7px;
                right: 13px;
                z-index: 10;
                color: #ccc;
                font-size: 12px;
                text-decoration: none;
                font-family: Helvetica, Arial;
              }
              .chart-border{
                  padding: 1rem;
                  box-shadow: 0 1rem 3rem rgba(132, 139, 200, 0.48);
              }
              #chart-2{
                  height: 100%;
              }
              #chart-3{
                height: 100%;
              }
              .chart-3{
                  width: 60%;
                  position: relative;
              }
             
              #chart3-year{
                  position: absolute;
                  top: calc(1rem + 4px);
                  right: 200px;
                  z-index: 10;
                  
              }
              #chart3-year select{
                  padding: 4px 8px;
                  border-bottom: 2px solid #7d8da1;
                  background: #f6f6f9;
                  cursor: pointer;
              }
              /*report*/
              .report-wrapper{
                    width: 100%;
                    margin-bottom: 3rem;
                    display: flex;
                    gap: 24px;
                    background-color: #fff;
                    padding: 24px;
                    border-radius: 4px;
                }
                .report-item{
                    height: 100%;
                    display: flex;
                    flex-direction: column;
                    min-width: 200px;
                    width: calc(100% / 4);
                    background: #f3f4f6;
                    border:1px solid #e5e7eb;
                    padding: 5px 10px;
                    border-radius: 4px;
                }
              .report-item-title{
                  font-size: 15px;
                  color: #838383;
                  font-weight: 500;
              }
              .report-item-statis-wrapper{
                  display: flex;
                  flex-direction: column;
                  justify-content: space-between;
                  margin-top: 12px;
                  text-align: center;
              }
              .report-item-number{
                  font-size: 30px;
                  color: #545454;
                  font-weight: 600;
                  
              }
              .report-item-percent{
                  display: flex;
                  justify-content: center;
                  font-size: 14px;
              }
              .report-item-percent i{
                  margin-right: 4px;
                  font-size: 12px;
              }
              .report-item-percent p{
                  padding-bottom: 4px;
              }
              
              .item-status-up .report-item-status:before{
                 content: "+";
                 display: inline-block;
                 font-size: 16px;
                 color: #05bd70;
              }
              .item-status-up .report-item-percent p{
                  color: #05bd70;
              }
              .item-status-down .report-item-percent p{
                  color: #ff0000;
              }
              .report-item-compare{
                  margin-top: 8px;
                  color: #9d9d9d;
                  text-align: center;
                  line-height: 20px;
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
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script>
            $('.item-status-up .icon-status').html('<i class="fa-solid fa-chevron-up"></i>');
            $('.item-status-down .icon-status').html('<i class="fa-solid fa-chevron-down"></i>');
        </script>
        <script defer >
            chartAreaInit();
            function chartAreaInit(){
                var data = ${billData};
                 var d = new Date();
                if(data[data.length-1][0]!=d.getTime()){
                    data.push([d.getTime(),0]);
                }
              var options1 = {
                chart: {
                  id: "chart2",
                  type: "area",
                  height: "75%",
                  foreColor: "#247ba0",
                  toolbar: {
                    autoSelected: "pan",
                    show: true
                  },
                   export: {
                    csv: {
                      filename: "course_sale_chart",
                      columnDelimiter: ',',
                      headerCategory: 'Date',
                      headerValue: 'Sale',
                      dateFormatter(timestamp) {
                        return new Date(timestamp).toDateString()
                      }
                    },
                    svg: {
                      filename: "course_sale_chart",
                    },
                    png: {
                      filename: "course_sale_chart",
                    }
                  },
                },
                colors: ["#008ffb"],
                stroke: {
                  width: 3
                },
                grid: {
                  borderColor: "#555",
                  clipMarkers: false,
                  yaxis: {
                    lines: {
                      show: false
                    }
                  }
                },
                dataLabels: {
                  enabled: true
                },
                fill: {
                  gradient: {
                    enabled: true,
                    opacityFrom: 0.55,
                    opacityTo: 0
                  }
                },
                markers: {
                  size: 5,
                  colors: ["#008ffb"],
                  strokeColor: "#008ffb",
                  strokeWidth: 3
                },
                series: [
                  {
                    name: "Sale",
                    data: data
                  }
                ],
                tooltip: {
                  theme: "dark"
                },
                xaxis: {
                  type: "datetime"
                },
                yaxis: {
                  min: 0,
                  tickAmount: 4
                },title: {
                        text: "COURSE REVENUE CHART",
                        align: 'left',
                        margin: 10,
                        offsetX: 0,
                        offsetY: 0,
                        floating: false,
                        style: {
                          fontSize:  '14px',
                          fontWeight:  'bold',
                          color:  '#00baec'
                        },
                    }
              };

              var chart1 = new ApexCharts(document.querySelector("#chart-area"), options1);

              chart1.render();

              var options2 = {
                chart: {
                  id: "chart1",
                  height: "40%",
                  type: "bar",
                  foreColor: "#ff1654",
                  brush: {
                    target: "chart2",
                    enabled: true
                  },
                  selection: {
                    enabled: true,
                    fill: {
                      type: 'gradient',
                        gradient: {
                          opacityFrom: 0.91,
                          opacityTo: 0.1,
                        }
                    },
                    xaxis: {
                      min: data[0][0],
                      max: data[data.length-1][0]
                    }
                  }
                },
                colors: ["#FF0080"],
                series: [
                  {
                    data: data
                  }
                ],
                stroke: {
                  width: 2
                },
                grid: {
                  borderColor: "#444",
                   padding:{
                       top:16 
                   }
                },
                markers: {
                  size: 0
                },
                xaxis: {
                  type: "datetime",
                  tooltip: {
                    enabled: false
                  }
                },
                yaxis: {
                  tickAmount: 2
                },
                
              };

              var chart2 = new ApexCharts(document.querySelector("#chart-bar"), options2);

              chart2.render();
            }
            chart2Init();
            function chart2Init(){
                const categoryData = ${categoryData};
                options = {
                    chart: {
                        type: 'donut',
                        height:"300px",
                        width:"100%",
                        
                        toolbar: {
                            show: true
                          },csv: {
                        filename: "courseTipeChart",
                        columnDelimiter: ',',
                        headerCategory: 'CourseCategory',
                        headerValue: 'Quantity',
                        
                      },
                      svg: {
                        filename: "courseTipeChart",
                      },
                      png: {
                        filename: "courseTipeChart",
                      }
                    },
                    series: categoryData.categoryNum,
                    labels: categoryData.categoryName,
                    dataLabels: {
                        enabled: true,
                        formatter: function (val) {
                          return Math.round(val) + "%";
                        }
                    }, plotOptions: {
                        pie: {
                          customScale: 1.2,
                          donut: {
                            size: '45%',
                            labels:{
                                show:true,
                                total:{
                                    show:true,
                                    showAlways:true,
                                    fontWeight:600,
                                    fontSize: '10px'
                                    
                                }
                            }
                          }
                        }
                    }
                    ,legend:{
                        show: true,
                        position: 'left',
                        horizontalAlign: 'center',
                        fontSize: '15px',
                        offsetY:50,
                        labels:{
                            useSeriesColors:true
                        },
                        markers:{
                            
                        },
                        itemMargin:{
                            vertical:4,
                        }
                    },
                    title: {
                        text: "COURSE TYPE DISTRIBUTION CHART",
                        align: 'left',
                        margin: 10,
                        offsetX: 0,
                        offsetY: 0,
                        floating: false,
                        style: {
                          fontSize:  '14px',
                          fontWeight:  'bold',
                          color:  '#7d8da1',
                        },
                    },grid:{
                        padding:{
                            top:50 
                        }
                    }
                };
                var chart = new ApexCharts(document.querySelector("#chart-2"), options);

                chart.render();
            }
            function getMonthName(monthNumber) {
                const date = new Date();
                date.setMonth(monthNumber - 1);

                return date.toLocaleString('en-US', { month: 'long' });
              }
            chart3Init();
            var char3;
            function chart3Init(){
                var customerData=${accountDateData} ;
                var courseRegistrationData = ${registrationDateData};
                var categoriesData = getArrToMonth(customerData.length);
                
                function getArrToMonth(nmonth){
                    let arrData = [];
                    for(let cindex = 1; cindex <= nmonth; cindex++){
                        arrData.push(getMonthName(cindex));
                    }   
                    return arrData;
                }
                var options = {
                    chart: {
                      height: "100%",
                      width:"100%",
                      type: "line",
                      stacked: false
                    },
                    dataLabels: {
                      enabled: false
                    },
                    colors: ["#FF1654", "#247BA0"],
                    series: [
                      {
                        name: "Customer",
                        data: customerData
                      },
                      {
                        name: "Course Enrollment",
                        data: courseRegistrationData
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
                        categories:categoriesData
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
                          text: "Customer",
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
                          text: "Course Enrollment",
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
                    },title: {
                        text: "MONTHLY CUSTOMER & COURSE ENROLLMENT CHART",
                        align: 'left',
                        margin: 10,
                        offsetX: 0,
                        offsetY: 0,
                        floating: false,
                        style: {
                          fontSize:  '14px',
                          fontWeight:  'bold',
                          color:  '#7d8da1'
                        },
                    }
                  };
                  var char3 = new ApexCharts(document.querySelector("#chart-3"), options);
                  char3.render();
                  $('#chart3-year-select').change(function(){
                     $.ajax({
                        type     : "POST",
                        cache    : false,
                        url      : "dashboard",
                        data     : "action=updateChart3&chart3Year="+$(this).find(":selected").val(),
                        success  : function(data) {
                            var chartData = JSON.parse(data);
                            const accArrData = JSON.parse(chartData.accountDateData);
                            const registrationData = JSON.parse(chartData.registrationDateData);
                            const arrMonth = getArrToMonth(accArrData.length);
                            char3.updateOptions({
                                    series:[{
                                            name: 'Customer',
                                            data: accArrData
                                          },{
                                            name: 'Course registered',
                                            data: registrationData
                                          }],
                                    xaxis:{
                                        categories: arrMonth
                                    }
                                  });

                        },error: function(xhr, textStatus, errorThrown) {

                        }
                    }); 
                  });
            }
            
            chart4Init();
            function chart4Init(){
                 var options = {
                    series: ${studentDateData},
                    chart: {
                        height: '100%',
                        type: 'pie',
                        toolbar: {
                            show: true
                        },csv: {
                            filename: "StudentsWeeklyChart",
                            columnDelimiter: ',',
                            headerCategory: 'DayOfWeek',
                            headerValue: 'StudentNumber',

                        },
                        svg: {
                            filename: "StudentsWeeklyChart",
                          },
                        png: {
                            filename: "StudentsWeeklyChart",
                          }
                    },
                  labels: ["Sunday","Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
                  theme: {
                    monochrome: {
                      enabled: true
                    }
                  },grid:{
                        padding:{
                            top:20
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
                    text: "STUDENTS' WEEKLY DISTRIBUTION CHART",
                        align: 'left',
                        margin: 10,
                        offsetX: 0,
                        offsetY: 0,
                        floating: false,
                        style: {
                          fontSize:  '14px',
                          fontWeight:  'bold',
                          color:  '#7d8da1',
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

                  var chart = new ApexCharts(document.querySelector("#chart-4"), options);
                  chart.render();   
                
            }
        </script>
    </body>
</html>
