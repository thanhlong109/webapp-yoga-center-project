<%-- 
    Document   : ViewMembership
    Created on : Jun 23, 2023, 10:36:56 AM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Membership</title>
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
                                <th>Membership ID</th>
                                <th>Name</th>
                                <th>Duration</th>
                                <th>Price(VND)</th>
                                <th>Description</th>
                                <th>Discount (%)</th>
                                <th>Is Active</th>
                                <th>Actions</th>
                            </tr>
                        <c:forEach items="${MEMBERSHIP_LIST}" var="membership">
                            <tr>
                                <td>
                                    ${membership.id}
                                </td>
                                <td>
                                    ${membership.name}
                                </td>
                                <td>
                                    ${membership.duration}
                                </td>
                                <td>
                                    ${membership.price}
                                </td>
                                <td>
                                    ${membership.description}
                                </td>    
                                <td>
                                    ${membership.discount}
                                </td> 
                                <td>
                                    <input type="checkbox" name="isActived" value="ON" 
                                           <c:if test="${membership.isActive}"> 
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
