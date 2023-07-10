<%-- 
    Document   : DashBoard.jsp
    Created on : Jul 8, 2023, 12:01:25 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Add Screen</title>
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
        <!-- Library JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/Asset/js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
        <style>
            .row{
                display: flex;
                width: 100%;
                justify-content: space-between;
                height: 380px;
            }
            .w-42{
                width: 42%;
            }
            
              #sell-chart{
                position: relative;
                background: #000524;
                border: 1px solid #000;
                width: 50%;
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
              #chart-2{
                  padding: 2rem 2rem 1rem;
                  box-shadow: 0 1rem 4rem rgba(132, 139, 200, 0.18);
                  height: 100%;
              }
              aside{
                  height: 100%;
                  box-shadow: 2rem 0 2rem rgba(132, 139, 200, 0.18);
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
                    <form action="" id="search-box">
                        <input type="text" id="search-text" placeholder="Search anything you want" required>
                        <button id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                    <div class="profile">
                        <div class="info">
                            <p>Hey, <b>An</b></p>
                            <small class="text-muted">Admin</small>
                        </div>
                        <div class="profile-photo">
                            <img src="../Asset/img/avatar/hinh-avatar-1.png" alt="">
                        </div>
                    </div>
                </div>
                <div id="wrapper">
                    <div class="row">
                        <div id="sell-chart">
                            <div id="chart-area">
                            </div>
                            <div id="chart-bar">
                            </div>
                        </div>
                        <div class="w-42">
                            <div id="chart-2"></div>
                        </div>
                    </div>
                    
                    
                </div>
            </main>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
        <script defer >
            chartAreaInit();
            function chartAreaInit(){
                var data = [
                    <c:forEach items="${billData}" var="i">
                            [
                        <c:set var="u" value="1"/>
                        <c:forEach items="${i}" var="j">
                            <c:if test="${u % 2 ==0}">${j}</c:if>
                            <c:if test="${u % 2 !=0}">${j},</c:if>
                        </c:forEach>
                            ],
                    </c:forEach>
                ];
                 var d = new Date();
                if(data[data.length-1][0]!=d.getTime()){
                    data.push([d.getTime(),0]);
                }
              var options1 = {
                chart: {
                  id: "chart2",
                  type: "area",
                  height: 230,
                  foreColor: "#ccc",
                  toolbar: {
                    autoSelected: "pan",
                    show: false
                  }
                },
                colors: ["#00BAEC"],
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
                  enabled: false
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
                  colors: ["#000524"],
                  strokeColor: "#00BAEC",
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
                        text: "COURSE SALE CHART",
                        align: 'left',
                        margin: 10,
                        offsetX: 0,
                        offsetY: 0,
                        floating: false,
                        style: {
                          fontSize:  '16px',
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
                  height: 130,
                  type: "bar",
                  foreColor: "#ccc",
                  brush: {
                    target: "chart2",
                    enabled: true
                  },
                  selection: {
                    enabled: true,
                    fill: {
                      color: "#fff",
                      opacity: 0.4
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
                  borderColor: "#444"
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
            char2Init();
            function char2Init(){
                options = {
                    chart: {
                        type: 'donut'
                    },
                    <c:set var="cs" value="${categoryData.size()-1}"/>
                    series: [<c:forEach begin="0"  end="${cs}" var="i">
                        <c:if test="${cs==i}">${categoryData.get(i).get(1)} </c:if>
                        <c:if test="${cs!=i}">${categoryData.get(i).get(1)}, </c:if>
                    </c:forEach>],
                    labels: [<c:forEach begin="0"  end="${cs}" var="i">
                        <c:if test="${cs==i}">'${categoryData.get(i).get(0)}' </c:if>
                        <c:if test="${cs!=i}">'${categoryData.get(i).get(0)}', </c:if>
                    </c:forEach>],
                    dataLabels: {
                        enabled: true,
                        formatter: function (val) {
                          return Math.round(val) + "%";
                        }
                    }, plotOptions: {
                        pie: {
                          customScale: 1,
                          donut: {
                            size: '45%',
                            labels:{
                                show:true,
                                total:{
                                    show:true,
                                    showAlways:true,
                                    fontWeight:600
                                }
                            }
                          }
                        }
                    },legend:{
                        show: true,
                        position: 'left',
                        horizontalAlign: 'center',
                        fontSize: '15px',
                        offsetY:20,
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
                        text: "COURSE TYPE CHART",
                        align: 'left',
                        margin: 10,
                        offsetX: 0,
                        offsetY: 0,
                        floating: false,
                        style: {
                          fontSize:  '16px',
                          fontWeight:  'bold',
                          color:  '#263238',
                        },
                    }
                };
                var chart = new ApexCharts(document.querySelector("#chart-2"), options);

                chart.render();
            }

        </script>
    </body>
</html>
