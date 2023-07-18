<%-- 
    Document   : pagination
    Created on : Jun 29, 2023, 6:51:36 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
       <style>
            .pagination{
                padding: 6px 24px;
                display: flex;
                border-radius: 24px;
                max-width: fit-content;
                margin: 12px auto;
                max-width: 100%;
                flex-wrap: wrap;
                row-gap: 12px;
            }
            .pagination a{
                width: 45px;
                height: 45px;
                color: #929292;
                text-decoration: none;
                text-align: center;
                line-height: 45px;
                border-radius: 50%;
                font-weight: 500;
                transition: ease-in-out .3s;
                margin: 0 12px;
                background-color: #f0f0f0;
            }
            .pagination a:hover, .pagination .p-active{
                background-color: #547670;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="pagination">
            <c:if test="${numpage>1}">
                <c:if test="${page>1}">
                    <a href="blogs?page=${page-1}"><i class="fa-solid fa-chevron-left"></i></a>
                </c:if>
                <c:forEach begin="${1}" var="i" end="${numpage}">
                    <a href="blogs?page=${i}" <c:if test="${i==page}">class="p-active"</c:if> >${i}</a>
                </c:forEach>
                <c:if test="${page<numpage}">
                    <a href="blogs?page=${page<numpage?(page+1):numpage}"><i class="fa-solid fa-chevron-right"></i></a>
                </c:if>
            </c:if>
        </div>
    </body>
</html>
