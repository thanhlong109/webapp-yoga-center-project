<%-- 
    Document   : ViewBill
    Created on : Jun 21, 2023, 7:25:37 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bill</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/dashboard.css">
        <link rel="stylesheet" href="../Asset/css/adminCommon.css">
        <script src="../js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
    </head>
    <body>
        <div class="container">
            <jsp:include page="../Component/adminSideMenu.jsp"></jsp:include>
                <div class="right-container">
                    <div class="wrapper-box">

                        <table class="table-style-1">
                            <tr>
                                <th>Bill ID</th>
                                <th>Course ID</th>
                                <th>Account ID</th>
                                <th>Bill Status</th>
                                <th>Bill Value</th>
                                <th>Bill Discount</th>
                                <th>Bill Date</th>
                                <th>Is Active</th>
                                <th>Actions</th>
                            </tr>
                        <c:forEach items="${BILL_LIST}" var="bill">
                            <tr>
                                <td>
                                    ${bill.id}
                                </td>
                                <td>
                                    ${bill.course.id}
                                </td>
                                <td>
                                    ${bill.account.id}
                                </td>
                                <td>
                                    ${bill.status}
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
                                    <input type="checkbox" name="isActived" value="ON" 
                                           <c:if test="${bill.isActive}"> 
                                               checked="checked"
                                           </c:if>
                                           />
                                </td>
                                <td>
                                    <a class="btn btn-red" href="#delete">Detete</a> 
                                    <a class="btn btn-green" href="#Edit">Edit</a> 
                                </td>
                            </tr>
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
