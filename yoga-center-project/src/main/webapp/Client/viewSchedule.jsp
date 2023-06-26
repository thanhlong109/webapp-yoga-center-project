<%-- 
    Document   : viewSchedule
    Created on : Jun 16, 2023, 10:05:38 PM
    Author     : DatTGT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <form action="Timetable" id="dateForm" method="POST">
                <input type="date" name="txtDate" lang="en-US" value="${dateSelected}"/>
        </form>
        <table>
            <tr>
                <th>Monday</th>
                <th>Tuesday</th>
                <th>Wednesday</th>
                <th>Thursday</th>
                <th>Friday</th>
                <th>Saturday</th>
                <th>Sunday</th>
            </tr>
         <c:forEach items="${scheduleTable}" var="row" >
             <tr>
                 <c:forEach items="${row}" var="item">
                     <td <c:if test="${item!=null}">data-typeid="${item.registrationCourse.course.category.id}"</c:if> class="event" >
                         <c:if test="${item!=null}">
                            <a class="event-title">${item.registrationCourse.course.category.name}</a>
                            <p class="event-slot"><fmt:formatDate value="${item.startTime}" pattern="HH:mm a" /> - <fmt:formatDate value="${item.endTime}" pattern="HH:mm a" /></p>
                            <p class="event-sub-title">Yowu Studio</p>
                         </c:if>
                     </td>
                 </c:forEach>
            </tr>
         </c:forEach>
            
        </table>
    </div>
    <jsp:include page="../Component/footer.jsp"></jsp:include>
    <script>
        $(document).ready(function(){
           var dataIDs = [];
           $('td[data-typeid]').each(function(){
               var dataid = $(this).data('typeid');
               dataIDs.push(dataid); 
           });
           var uniqueArr = Array.from(new Set(dataIDs));
           for(var i=0;i<uniqueArr.length;i++){
               $('td[data-typeid="'+uniqueArr[i]+'"]').addClass('event-bg-color-'+i);
           }
           $('#dateForm input[type="date"]').on("change",function(){
                $('#dateForm').submit();
           });
        });
        document.querySelector('#dateForm input[type="date"]').valueAsDate = Date.parse('${dateSelected}');
        
    </script>
</body>
</html>
