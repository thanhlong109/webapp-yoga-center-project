<%-- 
    Document   : blogHome
    Created on : Jun 16, 2023, 9:31:14 PM
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
        <title>Blog</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="Asset/css/blogHome.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css">
        <link rel="stylesheet" href="Asset/css/clientFooter.css">
        <link rel="stylesheet" href="Asset/css/common.css">
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <fmt:setLocale value="en_US" />
        <div class="banner">
            <h2>Blog Home</h2>
        </div>
        <div class="container">
            <div class="left-container">
                <c:forEach items="${blogList}" var="blog">
                    <div class="blog-item js-blog-${blog.id}">
                        <div class="blog-item-img">
                            <img src="Asset/img/blog/${blog.img}" alt="">
                        </div>
                        <div class="blog-item-body">
                            <span class="blog-item-date"><fmt:formatDate value="${blog.date}" pattern="MMMM d, yyyy" /></span>
                            <div>
                                <a class="blog-item-author" href="#">Written by ${blog.account.name}</a>
                            </div>
                            <a href="blog-detail?blogid=${blog.id}" class="blog-item-title">
                                ${blog.title}
                            </a>
                            <div class="text text-ellipsis">
                                ${blog.detail}
                            </div>
                            <a href="blog-detail?blogid=${blog.id}" class="read-more-btn">Read More <i class="fa-solid fa-chevron-right"></i></a>
                        </div>
                    </div>
                </c:forEach>
                <%@include file="../Component/pagination.jsp" %>
            </div>
            <%@include file="../Component/rightBarBlog.jsp" %>
            <%@include file="../Component/postBlog.jsp" %>
        </div>
        <%@include file="../Component/toast.jsp" %>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>