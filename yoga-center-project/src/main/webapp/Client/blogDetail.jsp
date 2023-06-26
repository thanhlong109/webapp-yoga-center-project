<%-- 
    Document   : blogHomeDetail
    Created on : Jun 17, 2023, 12:17:06 PM
    Author     : DatTGT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="Asset/css/blogDetail.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css">
        <link rel="stylesheet" href="Asset/css/clientFooter.css">
        <link rel="stylesheet" href="Asset/css/common.css">    
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <fmt:setLocale value="en_US" />
            <div class="banner">
                <h2>${blog.title}</h2>
                <p><fmt:formatDate value="${blog.date}" pattern="MMMM d, yyyy" /> <span></span> ${blog.account.name}</p>
            </div>
            <div class="container">
                <div class="left-container">
                    <div class="blog">
                        <div class="blog-img">
                            <img src="Asset/img/blog/${blog.img}" alt="">
                        </div>
                        <h3 class="blog-sub-title">${blog.title}</h3>
                        <div class="blog-content text">
                            ${blog.detail}
                        </div>
                    </div>
                    <div class="separate"></div>
  <!-- ------------------------------------- Comment -------------------------------------------------- -->
                    <div class="comment-area">
                        <h2 class="comment-area-title">Comments (<span id="total-cmt">${totalComment}</span>)</h2>
                        <div class="load-comment">
                            <c:forEach items="${commentList}" var="comment">
                                <div class="user-comment-item">
                                    <div class="user-comment-avata">
                                        <img src="Asset/img/avatar/${comment.account.img}" alt="">
                                    </div>
                                    <div class="comment-info">
                                        <div>
                                            <h4 class="user-comment-name">${comment.account.name}</h4>
                                            <p class="user-comment-date"><i class="fa-regular fa-clock"></i> <fmt:formatDate value="${comment.date}" pattern="MMMM d, yyyy" /> at <fmt:formatDate value="${comment.date}" pattern="hh:mm:ss a" /></p>
                                        </div>
                                        <p class="user-comment-content text">
                                            ${comment.content}
                                        </p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <form action="blog-detail" method="post" class="user-comment">
                            <input style="display: none;" name="blogid" value="${blog.id}" type="text"/>
                            <textarea name="txtCommentContent" placeholder="Write your comment here..."></textarea>
                            <button name="action" value="comment" type="submit">Post</button>
                        </form>
                    </div>
                </div>
                <div class="right-container">
                    <div class="box-section">
                        <h2 class="box-title">Text Widget</h2>
                        <p class="text" >A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot.</p>
                    </div>
                    <div class="box-section">
                        <h2 class="box-title">Recent Articles</h2>
                        <div class="small-blog-item">
                            <div class="small-blog-item-img">
                                <img src="Asset/img/blog/shutterstock_1371365435-1100x490.jpg" alt="">
                            </div>
                            <div>
                                <a>Is Information Overload Making it Harder to be Happy?</a>
                                <div class="small-blog-item-info">
                                    <div><i class="fa-regular fa-clock"></i> July 31, 2020</div>
                                    <div><i class="fa-solid fa-pen"></i> James Smith</div>
                                </div>
                            </div>
                        </div>
                        <div class="small-blog-item">
                            <div class="small-blog-item-img">
                                <img src="Asset/img/blog/shutterstock_1371365435-1100x490.jpg" alt="">
                            </div>
                            <div>
                                <a>Is Information Overload Making it Harder to be Happy?</a>
                                <div class="small-blog-item-info">
                                    <div><i class="fa-regular fa-clock"></i> July 31, 2020</div>
                                    <div><i class="fa-solid fa-pen"></i> James Smith</div>
                                </div>
                            </div>
                        </div>
                        <div class="small-blog-item">
                            <div class="small-blog-item-img">
                                <img src="Asset/img/blog/shutterstock_1371365435-1100x490.jpg" alt="">
                            </div>
                            <div>
                                <a>Is Information Overload Making it Harder to be Happy?</a>
                                <div class="small-blog-item-info">
                                    <div><i class="fa-regular fa-clock"></i> July 31, 2020</div>
                                    <div><i class="fa-solid fa-pen"></i> James Smith</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
        <%@include file="../Component/toast.jsp" %>
        <script>
            $('.user-comment').on('submit',function (e){
                e.preventDefault();
                $.ajax({
                    type     : "POST",
                    cache    : false,
                    url      : $(this).attr('action'),
                    data     : "action=comment&"+$(this).serialize(),
                    success  : function(data) {
                        $('.load-comment').prepend(data);
                        var tt = parseInt($('#total-cmt').text(),10) + 1;
                        $('#total-cmt').html(tt);
                    },error: function(xhr, textStatus, errorThrown) {
                        toast({
                            title:"Error!",
                            msg:"Login to use this fuction!",
                            type:'error',
                            duration:5000   
                        });
                    }
                });

            });
        </script>
    </body>
</html>
