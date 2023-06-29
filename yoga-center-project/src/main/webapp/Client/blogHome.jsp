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
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <fmt:setLocale value="en_US" />
        <div class="banner">
            <h2>Blog Home</h2>
        </div>
        <div class="container">
            <div class="left-container">
                <c:forEach items="${blogList}" var="blog">
                    <div class="blog-item">
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


            <div class="post-blog">
                <div class="post-blog-container">
                    <i class="fa-solid fa-x close-btn"></i>
                    <h2><i class="fa-solid fa-star"></i> New Blog</h2>
                    <form action="blogs" method="POST" enctype="multipart/form-data">
                        <figure class="img-container">
                            <img id="js-display-img" src="" alt="">
                            <figcaption  id="js-name-img"></figcaption>
                        </figure>
                        <input id="jsuploadImg" type="file" name="blogImg" accept="image/*">
                        <div class="img-label">
                            <label>Img cover:</label>
                            <label class="uploadImg" for="jsuploadImg"><i class="fa-solid fa-upload"></i> Choose A Photo</label>
                        </div>

                        <div class="box-input">
                            <label>Titles: </label>
                            <input name="txtBlogTitle" placeholder="Blog title" type="text">
                        </div>
                        <div class="box-input">
                            <label>Content: </label>
                            <textarea id="textEditor" name="txtBlogContent" placeholder="Blog content"></textarea>
                        </div>
                        <button name="action" value="postBlog" class="btn btn-light-green" type="submit">Post</button>
                    </form>
                </div>
            </div>
            <div class="post-blog-btn">
                <div class="post-blog-btn-icon">
                    <i class="fa-solid fa-plus"></i>
                    <i class="fa-solid fa-pen"></i>
                </div>
                <div class="post-blog-btn-des">
                    Write your blog?
                </div>
            </div>
        </div>
        <%@include file="../Component/toast.jsp" %>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.tiny.cloud/1/drz9q75t7w0e2yrsegy3qr29p30m6b0nb9zm476dryjq73bq/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
        <script src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-jquery@1/dist/tinymce-jquery.min.js"></script>
        <script defer>
            const displayImg = document.getElementById("js-display-img");
            const displayName = document.getElementById("js-name-img");
            const btnImg = document.getElementById("jsuploadImg");

            const btnCloseBlog = document.querySelector(".close-btn");
            const postBlog = document.querySelector(".post-blog");
            const btnPostBlog = document.querySelector(".post-blog-btn");

            $('textarea#textEditor').tinymce({
                height: 250,
                menubar: false,
                plugins: [
                    'a11ychecker', 'advlist', 'advcode', 'advtable', 'autolink', 'checklist', 'export',
                    'lists', 'link', 'image', 'charmap', 'preview', 'anchor', 'searchreplace', 'visualblocks',
                    'powerpaste', 'fullscreen', 'formatpainter', 'insertdatetime', 'media', 'table', 'help', 'wordcount'
                ],
                toolbar: 'undo redo | a11ycheck casechange blocks | bold italic backcolor | alignleft aligncenter alignright alignjustify | bullist numlist checklist outdent indent | removeformat | code table help'
            });
            
            /*check validation*/
            $(document).ready(function (){
                var maxLengthTitle = 50;
                var maxLengthContent = 3000;
                var minLengthContent = 200;
                $('.post-blog form').on("submit",function (e){
                   e.preventDefault();
                   if($('input[name="txtBlogTitle"]').val().length>maxLengthTitle){
                        toast({
                            title: "Opps!",
                            msg: "Blog title must short than 50 characters!",
                            type: 'warning',
                            duration: 3000
                        });
                   }else if($('textarea[name="txtBlogContent"]').val().length>maxLengthContent){
                       toast({
                            title: "Opps!",
                            msg: "Blog content must short than 3000 characters!",
                            type: 'warning',
                            duration: 3000
                        });
                   }else if($('textarea[name="txtBlogContent"]').val().length<minLengthContent){
                       toast({
                            title: "Opps!",
                            msg: "Blog content to short, require at least 200 character!",
                            type: 'warning',
                            duration: 3000
                        });
                   }else{
                       $(this).submit();
                   }
                });
            });

            //display img when upload
            btnImg.onchange = () => {
                let reader = new FileReader();
                reader.readAsDataURL(btnImg.files[0]);
                reader.onload = () => {
                    displayImg.setAttribute("src", reader.result);
                };
                console.log(btnImg.files[0].name);
                displayName.textContent = btnImg.files[0].name;
            };
            //off post blog on mobile view
            btnCloseBlog.addEventListener("click", () => {
                postBlog.classList.toggle("active");
                $('.header-wrapper').slideDown();
                $(window).on('mousewheel');
            });
            //show post blog on mobile view
            btnPostBlog.addEventListener("click", () => {
            <c:if test="${sessionScope.account!=null}">
                postBlog.classList.toggle("active");
                $('.header-wrapper').slideUp();
                $(window).off('mousewheel');
            </c:if>
            <c:if test="${sessionScope.account==null}">
                toast({
                    title: "Opps!",
                    msg: "Login to use this fuction!",
                    type: 'error',
                    duration: 5000
                });
            </c:if>
             
             
            });
        </script>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>