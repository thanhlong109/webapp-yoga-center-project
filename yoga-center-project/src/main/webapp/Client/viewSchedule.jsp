<%-- 
    Document   : viewSchedule
    Created on : Jun 16, 2023, 10:05:38 PM
    Author     : DatTGT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Schedule</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="Asset/css/font/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="Asset/css/schedule.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css"/>
        <link rel="stylesheet" href="Asset/css/clientFooter.css"/>
        <link rel="stylesheet" href="Asset/css/common.css"/>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <fmt:setLocale value="en_US" />
        <div class="banner">
            <h2>Timetable</h2>
            <p>For Offline Classes</p>
        </div>
        <div class="wrapper-table">
            <c:if test="${sessionScope.account!=null}">
                <div class="container__navigation-element">
                    <select onchange="filter(this)" class="navigation__element-select" name="txtCourse" id="#">
                        <option value="-1">All Courses</option>
                        <c:forEach items="${categoryList}" var="c">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                    <form action="Timetable" id="dateForm" method="POST">
                        <input type="date" name="txtDate" lang="en-US" value="${dateSelected}"/>
                    </form>
                </div>
                <table>
                    <tr>
                        <th>Monday <p><fmt:formatDate value="${daysList[0]}" pattern="dd/MM/yyyy" /></p></th>
                        <th>Tuesday <p><fmt:formatDate value="${daysList[1]}" pattern="dd/MM/yyyy" /></p></th>
                        <th>Wednesday <p><fmt:formatDate value="${daysList[2]}" pattern="dd/MM/yyyy" /></p></th>
                        <th>Thursday <p><fmt:formatDate value="${daysList[3]}" pattern="dd/MM/yyyy" /></p></th>
                        <th>Friday <p><fmt:formatDate value="${daysList[4]}" pattern="dd/MM/yyyy" /></p></th>
                        <th>Saturday <p><fmt:formatDate value="${daysList[5]}" pattern="dd/MM/yyyy" /></p></th>
                        <th>Sunday <p><fmt:formatDate value="${daysList[6]}" pattern="dd/MM/yyyy" /></p></th>
                    </tr>
                    <c:forEach items="${scheduleTable}" var="row" >
                        <tr>
                            <c:forEach items="${row}" var="item">
                                <td <c:if test="${item!=null}">data-typeid="${item.registrationCourse.course.category.id}" class="event"</c:if>  >
                                    <c:if test="${item!=null}">
                                        <a class="event-title">${item.registrationCourse.course.title}</a>
                                        <input id="dayTime"  value="${dayList}" type="hidden">
                                        <p class="event-slot"><fmt:formatDate value="${item.startTime}" pattern="HH:mm a" /> - <fmt:formatDate value="${item.endTime}" pattern="HH:mm a" /></p>
                                        <p class="event-sub-title">Yowu Studio</p>
                                    </c:if>
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${sessionScope.account==null}">
                <div class="noice-empty">
                    <img src="Asset/img/icon/empty.png" alt="">
                    <h4>Login to view your schedule!</h4>
                </div>
            </c:if>
        </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
        <script>
            $(document).ready(function () {
                var dataIDs = [];
                $('td[data-typeid]').each(function () {
                    var dataid = $(this).data('typeid');
                    dataIDs.push(dataid);
                });
                var uniqueArr = Array.from(new Set(dataIDs));
                for (var i = 0; i < uniqueArr.length; i++) {
                    $('td[data-typeid="' + uniqueArr[i] + '"]').addClass('event-bg-color-' + i);
                }
                $('#dateForm input[type="date"]').on("change", function () {
                    $('#dateForm').submit();
                });
            });
            function filter(select) {
                var selected = $(select).val();
                if (selected == -1) {
                    $('tr:not(tr:first-child)').show();
                    $('tr:not(tr:first-child) .event').removeClass("hide");
                } else {
                    $('tr:not(tr:first-child)').each(function () {
                        var isHave = false;
                        $(this).children('.event').each(function () {
                            if ($(this).data('typeid') == selected) {
                                $(this).removeClass("hide");
                                isHave = true;
                            } else {
                                $(this).addClass("hide");
                            }
                        });
                        console.log($(this).children('td[data-typeid]'));
                        if (isHave) {
                            $(this).show();
                        } else {
                            $(this).hide();
                        }
                    });
                }
            }

//            // Lấy ngày hiện tại
//            var currentDate = new Date();
//
//// Lấy danh sách các thẻ <p> trong các thẻ <th> trong bảng
//            var dateElements = document.querySelectorAll('th p');
//
//// Lặp qua danh sách các thẻ <p> để thay đổi nội dung nếu ngày hiện tại lớn hơn
//            for (var i = 0; i < dateElements.length; i++) {
//                var dateElement = dateElements[i];
//                var dateValue = new Date(dateElement.innerText);
//console.log("da qua " + dateValue);
//                // So sánh ngày trong cột với ngày hiện tại
//                if (currentDate > dateValue) {
//                    dateElement.innerText += " - Đã qua";
//                    console.log("da qua" + currentDate);
//                }
//            }


        </script>
    </body>
</html>
