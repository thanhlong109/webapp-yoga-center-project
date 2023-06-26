<%-- 
    Document   : viewSchedule
    Created on : Jun 16, 2023, 10:05:38 PM
    Author     : DatTGT
--%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="en" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Timetable</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link href="Asset/css/font/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="Asset/css/timetable.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css"/>
        <link rel="stylesheet" href="Asset/css/clientFooter.css"/>
        <link rel="stylesheet" href="Asset/css/common.css"/>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
            <div class="main">
                <div class="banner">
                    <h1>Timetable</h1>
                    <div class="banner__page-caption">For Offline Classes</div>
                </div>
                <div class="container">
                    <div class="container__navigation-element">
                        <select class="navigation__element-select" name="txtCourse" id="#">
                            <option value="all">All Events</option>
                            <option value="vinyasa-yoga">Vinyasa Yoga</option>
                            <option value="aerial-yoga">Aerial Yoga</option>
                            <option value="meditation-yoga">Meditation Yoga</option>
                            <option value="pure-alignment">Pure Alignment</option>
                            <option value="hot-yoga">Hot Yoga</option>
                            <option value="basic-yoga">Basic Yoga</option>
                        </select>
                    </div>
                    <div class="container__timetable">
                        <!-- timetable-all-event -->
                        <table class="container__timetable-table" id="#all">
                            <thead>
                                <tr class="timetable__table-row">
                                    <th data-index="0" data-column-id></th>
                                    <th data-index="1" data-column-id="11031">Monday</th>
                                    <th data-index="2" data-column-id="11032">Tuesday</th>
                                    <th data-index="3" data-column-id="11033">Wednesday</th>
                                    <th data-index="4" data-column-id="11034">Thursday</th>
                                    <th data-index="5" data-column-id="11035">Friday</th>
                                    <th data-index="6" data-column-id="11036">Saturday</th>
                                    <th data-index="7" data-column-id="11037">Sunday</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:if test="${scheduleList != null}">
                                <c:forEach var="timetable" items="${scheduleList}">
                                    <tr class="timetable__table-row-10" data-index="10">
                                        <td class="timetable__body-time" colspan="1" style="height: 90px;">
                                            <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                        </td>
                                        <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11032"
                                            style="height: 180px;">
                                            <div data-event-id="11042" data-start="10" data-start-item="10" data-end="12"
                                                 class="body__event-theme-0">
                                                <div class="body__event__theme-content">
                                                    <a title="Meditation Yoga" class="event__content-title" href="">
                                                        Meditation Yoga
                                                    </a>
                                                    <p class="event__content-timeslot">
                                                        <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                                        -
                                                        <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                                    </p>
                                                    <p class="event__content-subtitle">Yowu Studio</p>
                                                </div>
                                            </div>
                                        </td>

                                        <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                        </td>

                                        <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11034"
                                            style="height: 180px;">
                                            <div data-event-id="11038" data-start="10" data-start-item="10" data-end="12"
                                                 class="body__event-theme-1">
                                                <div class="body__event__theme-content">
                                                    <a title="Hot Yoga" class="event__content-title" href="">
                                                        Hot Yoga
                                                    </a>
                                                    <p class="event__content-timeslot">
                                                        <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                                        -
                                                        <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                                    </p>
                                                    <p class="event__content-subtitle">Yowu Studio</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                        </td>
                                        <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11036"
                                            style="height: 180px;">
                                            <div data-event-id="11044" data-start="10" data-start-item="10" data-end="12"
                                                 class="body__event-theme-2">
                                                <div class="body__event__theme-content">
                                                    <a title="Pure Alignment" class="event__content-title" href="">
                                                        Pure Alignment
                                                    </a>
                                                    <p class="event__content-timeslot">
                                                        <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                                        -
                                                        <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                                    </p>
                                                    <p class="event__content-subtitle">Yowu Studio</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11037"
                                            style="height: 180px;">
                                            <div data-event-id="11038" data-start="10" data-start-item="10" data-end="12"
                                                 class="body__event-theme-1">
                                                <div class="body__event__theme-content">
                                                    <a title="Hot Yoga" class="event__content-title" href="">
                                                        Hot Yoga
                                                    </a>
                                                    <p class="event__content-timeslot">
                                                        <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                                        -
                                                        <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                                    </p>
                                                    <p class="event__content-subtitle">Yowu Studio</p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr class="timetable__table-row-11" data-index="11">
                                        <td class="timetable__body-time" colspan="1" style="height: 90px;">
                                            <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                        </td>

                                    </tr>

                                    <tr class="timetable__table-row-13" data-index="13">
                                        <td class="timetable__body-time" colspan="1" style="height: 90px;">
                                            <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                        </td>
                                        <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11031"
                                            style="height: 180px;">
                                            <div data-event-id="11043" data-start="13" data-start-item="13" data-end="15"
                                                 class="body__event-theme-3">
                                                <div class="body__event__theme-content">
                                                    <a title="Vinyasa Yoga" class="event__content-title" href="">
                                                        Vinyasa Yoga
                                                    </a>
                                                    <p class="event__content-timeslot">
                                                        <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                                        -
                                                        <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                                    </p>
                                                    <p class="event__content-subtitle">Yowu Studio</p>
                                                </div>
                                            </div>
                                        </td>

                                        <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                        </td>
                                        <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11033"
                                            style="height: 180px;">
                                            <div data-event-id="11038" data-start="13" data-start-item="13" data-end="15"
                                                 class="body__event-theme-1">
                                                <div class="body__event__theme-content">
                                                    <a title="Hot Yoga" class="event__content-title" href="">Hot Yoga</a>
                                                    <p class="event__content-timeslot">
                                                        <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                                        -
                                                        <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                                    </p>
                                                    <p class="event__content-subtitle">Yowu Studio</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11034"
                                            style="height: 180px;">
                                            <div data-event-id="11042" data-start="13" data-start-item="13" data-end="15"
                                                 class="body__event-theme-0">
                                                <div class="body__event__theme-content">
                                                    <a title="Meditation Yoga" class="event__content-title" href="">Meditation
                                                        Yoga</a>
                                                    <p class="event__content-timeslot">
                                                        <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                                        -
                                                        <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                                    </p>
                                                    <p class="event__content-subtitle">Yowu Studio</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                        </td>
                                        <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11036"
                                            style="height: 180px;">
                                            <div data-event-id="11041" data-start="13" data-start-item="13" data-end="15"
                                                 class="body__event-theme-4">
                                                <div class="body__event__theme-content">
                                                    <a title="Aerial Yoga" class="event__content-title" href="">Aerial Yoga</a>
                                                    <p class="event__content-timeslot">
                                                        <fmt:formatDate value="${timetable.startTime}" pattern="h:mm a"/>
                                                        -
                                                        <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                                    </p>
                                                    <p class="event__content-subtitle">Yowu Studio</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                        </td>
                                    </tr>
                                    <tr class="timetable__table-row-14" data-index="14">
                                        <td class="timetable__body-time" colspan="1" style="height: 90px;">
                                            <fmt:formatDate value="${timetable.endTime}" pattern="h:mm a"/>
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                        </td>
                                        <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <tr class="timetable__table-row-16" data-index="16">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">4.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11032"
                                    style="height: 180px;">
                                    <div data-event-id="11044" data-start="16" data-start-item="16" data-end="18"
                                         class="body__event-theme-2">
                                        <div class="body__event__theme-content">
                                            <a title="Pure Alignment" class="event__content-title" href="">Pure
                                                Alignment</a>
                                            <p class="event__content-timeslot">4.00 PM - 5.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11035"
                                    style="height: 180px;">
                                    <div data-event-id="11045" data-start="16" data-start-item="16" data-end="18"
                                         class="body__event-theme-5">
                                        <div class="body__event__theme-content">
                                            <a title="Basic Yoga" class="event__content-title" href="">Basic Yoga</a>
                                            <p class="event__content-timeslot">4.00 PM - 5.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11037"
                                    style="height: 180px;">
                                    <div data-event-id="11045" data-start="16" data-start-item="16" data-end="18"
                                         class="body__event-theme-5">
                                        <div class="body__event__theme-content">
                                            <a title="Basic Yoga" class="event__content-title" href="">Basic Yoga</a>
                                            <p class="event__content-timeslot">4.00 PM - 5.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="timetable__table-row-17" data-index="17">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">5.00 PM</td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11031"
                                    style="height: 180px;">
                                    <div data-event-id="11041" data-start="17" data-start-item="17" data-end="19"
                                         class="body__event-theme-4">
                                        <div class="body__event__theme-content">
                                            <a title="Aerial Yoga" class="event__content-title" href="">Aerial Yoga</a>
                                            <p class="event__content-timeslot">5.00 PM - 6.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11033"
                                    style="height: 180px;">
                                    <div data-event-id="11041" data-start="17" data-start-item="17" data-end="19"
                                         class="body__event-theme-4">
                                        <div class="body__event__theme-content">
                                            <a title="Aerial Yoga" class="event__content-title" href="">Aerial Yoga</a>
                                            <p class="event__content-timeslot">5.00 PM - 6.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11034"
                                    style="height: 180px;">
                                    <div data-event-id="11043" data-start="17" data-start-item="17" data-end="19"
                                         class="body__event-theme-3">
                                        <div class="body__event__theme-content">
                                            <a title="Vinyasa Yoga" class="event__content-title" href="">Vinyasa Yoga</a>
                                            <p class="event__content-timeslot">5.00 PM - 6.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>

                            </tr>
                            <tr class="timetable__table-row-18" data-index="18">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">6.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>

                        </tbody>
                    </table>

                    <!-- timetable-vinyasa__yoga -->
                    <table class="container__timetable-table" id="#vinyasa-yoga" style="display: none;">
                        <thead>
                            <tr class="timetable__table-row">
                                <th data-index="0" data-column-id></th>
                                <th data-index="1" data-column-id="11031">Monday</th>
                                <th data-index="2" data-column-id="11032">Tuesday</th>
                                <th data-index="3" data-column-id="11033">Wednesday</th>
                                <th data-index="4" data-column-id="11034">Thursday</th>
                                <th data-index="5" data-column-id="11035">Friday</th>
                                <th data-index="6" data-column-id="11036">Saturday</th>
                                <th data-index="7" data-column-id="11037">Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="timetable__table-row-13" data-index="13">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">1.00 PM</td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11031"
                                    style="height: 180px;">
                                    <div data-event-id="11043" data-start="13" data-start-item="13" data-end="15"
                                         class="body__event-theme-3">
                                        <div class="body__event__theme-content">
                                            <a title="Vinyasa Yoga" class="event__content-title" href="">Vinyasa Yoga</a>
                                            <p class="event__content-timeslot">1.00 PM - 2.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                            <tr class="timetable__table-row-14" data-index="14">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">2.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                            <tr class="timetable__table-row-17" data-index="17">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">5.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11034"
                                    style="height: 180px;">
                                    <div data-event-id="11043" data-start="17" data-start-item="17" data-end="19"
                                         class="body__event-theme-3">
                                        <div class="body__event__theme-content">
                                            <a title="Vinyasa Yoga" class="event__content-title" href="">Vinyasa Yoga</a>
                                            <p class="event__content-timeslot">5.00 PM - 6.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>

                            </tr>
                            <tr class="timetable__table-row-18" data-index="18">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">6.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- timetable-aerial__yoga -->
                    <table class="container__timetable-table" id="#aerial-yoga" style="display: none;">
                        <thead>
                            <tr class="timetable__table-row">
                                <th data-index="0" data-column-id></th>
                                <th data-index="1" data-column-id="11031">Monday</th>
                                <th data-index="2" data-column-id="11032">Tuesday</th>
                                <th data-index="3" data-column-id="11033">Wednesday</th>
                                <th data-index="4" data-column-id="11034">Thursday</th>
                                <th data-index="5" data-column-id="11035">Friday</th>
                                <th data-index="6" data-column-id="11036">Saturday</th>
                                <th data-index="7" data-column-id="11037">Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="timetable__table-row-13" data-index="13">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">1.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11036"
                                    style="height: 180px;">
                                    <div data-event-id="11041" data-start="13" data-start-item="13" data-end="15"
                                         class="body__event-theme-4">
                                        <div class="body__event__theme-content">
                                            <a title="Aerial Yoga" class="event__content-title" href="">Aerial Yoga</a>
                                            <p class="event__content-timeslot">1.00 PM - 2.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>

                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                            <tr class="timetable__table-row-14" data-index="14">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">2.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>

                            </tr>
                            <tr class="timetable__table-row-17" data-index="17">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">5.00 PM</td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11031"
                                    style="height: 180px;">
                                    <div data-event-id="11041" data-start="17" data-start-item="17" data-end="19"
                                         class="body__event-theme-4">
                                        <div class="body__event__theme-content">
                                            <a title="Aerial Yoga" class="event__content-title" href="">Aerial Yoga</a>
                                            <p class="event__content-timeslot">5.00 PM - 6.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11033"
                                    style="height: 180px;">
                                    <div data-event-id="11041" data-start="17" data-start-item="17" data-end="19"
                                         class="body__event-theme-4">
                                        <div class="body__event__theme-content">
                                            <a title="Aerial Yoga" class="event__content-title" href="">Aerial Yoga</a>
                                            <p class="event__content-timeslot">5.00 PM - 6.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>

                            </tr>
                            <tr class="timetable__table-row-18" data-index="18">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">6.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">
                                </td>></td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- timetable-meditation__yoga -->
                    <table class="container__timetable-table" id="#meditation-yoga" style="display: none;">
                        <thead>
                            <tr class="timetable__table-row">
                                <th data-index="0" data-column-id></th>
                                <th data-index="1" data-column-id="11031">Monday</th>
                                <th data-index="2" data-column-id="11032">Tuesday</th>
                                <th data-index="3" data-column-id="11033">Wednesday</th>
                                <th data-index="4" data-column-id="11034">Thursday</th>
                                <th data-index="5" data-column-id="11035">Friday</th>
                                <th data-index="6" data-column-id="11036">Saturday</th>
                                <th data-index="7" data-column-id="11037">Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="timetable__table-row-10" data-index="10">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">10.00 AM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11032"
                                    style="height: 180px;">
                                    <div data-event-id="11042" data-start="10" data-start-item="10" data-end="12"
                                         class="body__event-theme-0">
                                        <div class="body__event__theme-content">
                                            <a title="Meditation Yoga" class="event__content-title" href="">Meditation
                                                Yoga</a>
                                            <p class="event__content-timeslot">10.00 AM - 12.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">

                                </td>
                            </tr>
                            <tr class="timetable__table-row-11" data-index="11">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">11.00 AM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                            <tr class="timetable__table-row-13" data-index="13">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">1.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">

                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11034"
                                    style="height: 180px;">
                                    <div data-event-id="11042" data-start="13" data-start-item="13" data-end="15"
                                         class="body__event-theme-0">
                                        <div class="body__event__theme-content">
                                            <a title="Meditation Yoga" class="event__content-title" href="">Meditation
                                                Yoga</a>
                                            <p class="event__content-timeslot">1.00 PM - 2.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                            <tr class="timetable__table-row-14" data-index="14">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">2.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>

                            </tr>
                        </tbody>
                    </table>

                    <!-- timetable-pure__algnment -->
                    <table class="container__timetable-table" id="#pure-alignment" style="display: none;">
                        <thead>
                            <tr class="timetable__table-row">
                                <th data-index="0" data-column-id></th>
                                <th data-index="1" data-column-id="11031">Monday</th>
                                <th data-index="2" data-column-id="11032">Tuesday</th>
                                <th data-index="3" data-column-id="11033">Wednesday</th>
                                <th data-index="4" data-column-id="11034">Thursday</th>
                                <th data-index="5" data-column-id="11035">Friday</th>
                                <th data-index="6" data-column-id="11036">Saturday</th>
                                <th data-index="7" data-column-id="11037">Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="timetable__table-row-10" data-index="10">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">10.00 AM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11036"
                                    style="height: 180px;">
                                    <div data-event-id="11044" data-start="10" data-start-item="10" data-end="12"
                                         class="body__event-theme-2">
                                        <div class="body__event__theme-content">
                                            <a title="Pure Alignment" class="event__content-title" href="">Pure
                                                Alignment</a>
                                            <p class="event__content-timeslot">10.00 AM - 12.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">

                                </td>
                            </tr>
                            <tr class="timetable__table-row-11" data-index="11">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">11.00 AM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                            <tr class="timetable__table-row-16" data-index="16">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">4.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11032"
                                    style="height: 180px;">
                                    <div data-event-id="11044" data-start="16" data-start-item="16" data-end="18"
                                         class="body__event-theme-2">
                                        <div class="body__event__theme-content">
                                            <a title="Pure Alignment" class="event__content-title" href="">Pure
                                                Alignment</a>
                                            <p class="event__content-timeslot">4.00 PM - 5.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">

                                </td>
                            </tr>
                            <tr class="timetable__table-row-17" data-index="17">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">5.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- timetable-hot__yoga -->
                    <table class="container__timetable-table" id="#hot-yoga" style="display: none;">
                        <thead>
                            <tr class="timetable__table-row">
                                <th data-index="0" data-column-id></th>
                                <th data-index="1" data-column-id="11031">Monday</th>
                                <th data-index="2" data-column-id="11032">Tuesday</th>
                                <th data-index="3" data-column-id="11033">Wednesday</th>
                                <th data-index="4" data-column-id="11034">Thursday</th>
                                <th data-index="5" data-column-id="11035">Friday</th>
                                <th data-index="6" data-column-id="11036">Saturday</th>
                                <th data-index="7" data-column-id="11037">Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="timetable__table-row-10" data-index="10">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">10.00 AM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11034"
                                    style="height: 180px;">
                                    <div data-event-id="11038" data-start="10" data-start-item="10" data-end="12"
                                         class="body__event-theme-1">
                                        <div class="body__event__theme-content">
                                            <a title="Hot Yoga" class="event__content-title" href="">Hot Yoga</a>
                                            <p class="event__content-timeslot">10.00 AM - 12.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">

                                </td> 
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11037"
                                    style="height: 180px;">
                                    <div data-event-id="11038" data-start="10" data-start-item="10" data-end="12"
                                         class="body__event-theme-1">
                                        <div class="body__event__theme-content">
                                            <a title="Hot Yoga" class="event__content-title" href="">Hot Yoga</a>
                                            <p class="event__content-timeslot">10.00 AM - 12.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="timetable__table-row-11" data-index="11">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">11.00 AM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;"></td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;"></td>

                            </tr>
                            <tr class="timetable__table-row-13" data-index="13">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">1.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11033"
                                    style="height: 180px;">
                                    <div data-event-id="11038" data-start="13" data-start-item="13" data-end="15"
                                         class="body__event-theme-1">
                                        <div class="body__event__theme-content">
                                            <a title="Hot Yoga" class="event__content-title" href="">Hot Yoga</a>
                                            <p class="event__content-timeslot">1.00 PM - 2.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>
                            </tr>
                            <tr class="timetable__table-row-14" data-index="14">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">2.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;"></td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;"></td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11035" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;"></td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11037" style="height: 90px;">
                                </td>

                            </tr>
                        </tbody>
                    </table>

                    <!-- timetable-basic__yoga -->
                    <table class="container__timetable-table" id="#basic-yoga" style="display: none;">
                        <thead>
                            <tr class="timetable__table-row">
                                <th data-index="0" data-column-id></th>
                                <th data-index="1" data-column-id="11031">Monday</th>
                                <th data-index="2" data-column-id="11032">Tuesday</th>
                                <th data-index="3" data-column-id="11033">Wednesday</th>
                                <th data-index="4" data-column-id="11034">Thursday</th>
                                <th data-index="5" data-column-id="11035">Friday</th>
                                <th data-index="6" data-column-id="11036">Saturday</th>
                                <th data-index="7" data-column-id="11037">Sunday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="timetable__table-row-16" data-index="16">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">4.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11035"
                                    style="height: 180px;">
                                    <div data-event-id="11045" data-start="16" data-start-item="16" data-end="18"
                                         class="body__event-theme-5">
                                        <div class="body__event__theme-content">
                                            <a title="Basic Yoga" class="event__content-title" href="">Basic Yoga</a>
                                            <p class="event__content-timeslot">4.00 PM - 5.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>
                                <td class="timetable__body-event" colspan="1" rowspan="2" data-column-id="11037"
                                    style="height: 180px;">
                                    <div data-event-id="11045" data-start="16" data-start-item="16" data-end="18"
                                         class="body__event-theme-5">
                                        <div class="body__event__theme-content">
                                            <a title="Basic Yoga" class="event__content-title" href="">Basic Yoga</a>
                                            <p class="event__content-timeslot">4.00 PM - 5.00 PM</p>
                                            <p class="event__content-subtitle">Yowu Studio</p>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr class="timetable__table-row-17" data-index="17">
                                <td class="timetable__body-time" colspan="1" style="height: 90px;">5.00 PM</td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11031" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11032" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11033" style="height: 90px;">

                                </td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11034" style="height: 90px;"></td>
                                <td class="timetable__body-blank" colspan="1" data-column-id="11036" style="height: 90px;">
                                </td>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>