<%-- 
    Document   : ViewCategory
    Created on : Jun 20, 2023, 7:58:59 PM
    Author     : DungVNT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
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
                                <th>ID</th>
                                <th>Name</th>
                                <%--<th>Is Active</th>--%>
                            <th>Actions</th>
                        </tr>
                        <c:forEach items="${CATEGORY_LIST}" var="category">
                            <c:if test="${category.isActive == true}">  
                                <tr>
                                    <td>
                                        <c:out value="${category.id}"/>
                                    </td>
                                    <td>           
                                        <c:out value="${category.name}"/>
                                    </td>
                                    <%--    <td>
                                            <input type="checkbox" name="isActived" value="ON" 
                                                   <c:if test="${category.isActive}"> 
                                                       checked="checked"
                                                   </c:if>
                                                   />
                                        </td> --%>
                                    <td>
                                        <a class="btn btn-red" href="deleteCategoryController?id=${category.id}">
                                            Delete</a>
                                        <a class="btn btn-green" href="updateCategoryController?id=${category.id}">
                                            Edit</a> 
                                    </td>
                                </tr>
                            </c:if> 
                        </c:forEach>
                    </table>

                </div>
            </div>
        </div>
    </body>
</html>
