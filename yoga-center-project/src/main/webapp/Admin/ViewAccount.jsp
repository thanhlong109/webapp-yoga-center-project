<%-- 
    Document   : ViewAccount
    Created on : Jun 21, 2023, 7:45:37 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../Asset/css/dashboard.css">
        <link rel="stylesheet" href="../Asset/css/adminCommon.css">
        <script src="../js/cdnjs.cloudflare.com_ajax_libs_Chart.js_2.4.0_Chart.min.js"></script>
        <style>
            .image {
                max-width: 90%;
                z-index: 1;
                overflow: hidden;
                position: relative;
            }
        </style>
    </head>
    <body>
         <div class="container">
            <jsp:include page="../Component/adminSideMenu.jsp"></jsp:include>
                <div class="right-container">
                    <div class="wrapper-box">

                        <table class="table-style-1">
                            <tr>
                                <th>Account ID</th>
                                <th>Account Image</th>
                                <th>Account Name</th>
                                <th>Account Email</th>
                                <th>Account Phone</th>
                                <th>Social ID</th>
                                <th>Role ID</th>
                                <th>Is Active</th>
                                <th>Actions</th>
                            </tr>
                        <c:forEach items="${ACCOUNT_LIST}" var="account">
                            <tr>
                                <td>
                                    ${account.id}
                                </td>
                                <td>
                                    <img class="image" src="../Asset/img/account/${account.img}" alt="img">  
                                </td>
                                <td>
                                    ${account.name}
                                </td>
                                <td>
                                    ${account.email}
                                </td>
                                <td>
                                    ${account.phone}
                                </td>
                                <td>
                                    ${account.socialID}
                                </td>
                                <td>
                                    ${account.role.id}
                                </td>                                                   
                                <td>
                                    <input type="checkbox" name="isActived" value="ON" 
                                           <c:if test="${account.isActive}"> 
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
