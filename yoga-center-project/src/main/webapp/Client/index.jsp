<%-- 
    Document   : index
    Created on : Jul 3, 2023, 7:10:19 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            response.sendRedirect(request.getContextPath()+"/home");
        %>
    </body>
</html>
