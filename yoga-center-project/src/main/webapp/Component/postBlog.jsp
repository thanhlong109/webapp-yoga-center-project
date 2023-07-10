<%-- 
    Document   : postBlog
    Created on : Jun 30, 2023, 5:50:30 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .post-blog{
                position: fixed;
                z-index: 80;
                background-color: rgba(0, 0, 0, 0.6);
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                display: flex;
                padding: 32px 0;
                display: none;
                overflow-y: scroll;

            }
            .post-blog.active{
                display: block;
            }
            .post-blog-container{
                width: 70%;
                margin: auto;
                background-color: white;
                border-radius: 8px;
                padding: 32px;
                display: flex;
                flex-direction: column;
                gap: 18px;
                position: relative;
                animation: slideUp .3s ease-in-out;
            }
            .post-blog-container .close-btn{
                position: absolute;
                top: 32px;
                right: 32px;
                font-size: 18px;
                color: #383838;
                font-weight: bold;
                padding: 12px;
                cursor: pointer;
            }
            .post-blog-container .close-btn:hover{
                color: rgb(230, 55, 55);
            }
            .post-blog-container form{
                display: flex;
                flex-direction: column;
            }
            .post-blog-container h2{
                font-size: 18px;
                color: #333;
            }
            .post-blog-box{
                display: flex;
            }
            .img-container{
                padding: 0 32px;
                width: 80%;
                margin: 0 auto;
            }
            .img-container img{
                max-width:100%;
                display: block;
                max-height: 100px;
            }
            input[type="file"]{
                display: none;
            }
            .img-container figcaption{
                margin: 4px auto 16px;
                font-size: 12px;
            }
            .uploadImg{
                max-width: fit-content;
                padding: 6px 12px;
                background-color: #3dbca8;
                color: white;
                border-radius: 4px;
                margin-bottom: 16px;
                font-size: 12px;
                border: 2px solid #3dbca8;
                transition: all ease-in-out .3s;
                cursor: pointer;
                margin-left: 70px;
            }
            .uploadImg i{
                font-size: 18px;
                margin-right: 8px;
            }
            .uploadImg:hover{
                background-color: white;
                color: #3dbca8;
            }
            .img-label{
                margin-bottom: 32px;
            }
            .img-label label:first-child{
                margin-right: 16px;
            }
            .box-input{
                display: flex;
                margin-bottom: 16px;
                display: flex;
            }
            .box-input label{
                width: 70px;
            }
            .box-input input,.box-input textarea{
                flex: 1;
                padding:8px;
                border-radius:4px;
                outline: none;
                border: 2px solid #444444;
            }
            .tox.tox-tinymce{
                width: 100%;
                max-height: 250px;
            }
            .post-blog form button{
                width: fit-content;
                margin: auto;
                border: none;
                padding: 12px 32px;
            }
            /**/
            .post-blog-btn{
                position: fixed;
                right: 4px;
                top: 40%;
                cursor: pointer;
                display: flex;
                align-items: center;
                padding-right: 32px;
            }
            .post-blog-btn-icon{
                width: 52px;
                height: 52px;
                border: 2px solid #383838;
                color: #383838;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                background-color: white;
                transform: translateX(50%);
            }
            .post-blog-btn-des{
                overflow: hidden;
                background-color: #383838;
                color: white;
                height: 52px;
                line-height: 52px;
                border-radius: 0 24px 24px 0 ;
                max-width: 0;
                transition: all ease-in-out .4s;
            }
            .post-blog-btn:hover .post-blog-btn-des{
                max-width: 300px;
                padding-left: 32px;
                padding-right: 32px;
            }
            .btnSave{
                display: none;
            }
            @media screen and (max-width:739px) {
                .post-blog-container {
                    width: 100%;
                }
                .post-blog-container{
                    max-width: 90%;
                    padding: 32px 10px;
                }
                .box-input label{
                    display: none;
                }
                .uploadImg{
                    margin-left: 0;
                }
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-jquery@1/dist/tinymce-jquery.min.js"></script>
        <script src="https://cdn.tiny.cloud/1/g9biibw87x3wdbf63v8imq9u08nzao11ff9a24bmpxsureo3/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>
    </head>
    <body>
        <div class="post-blog">
            <div class="post-blog-container">
                <i onclick="closePostBlog()" class="fa-solid fa-x close-btn"></i>
                <h2><i class="fa-solid fa-star"></i> New Blog</h2>
                <form id="postBlog" action="blogs" method="POST" enctype="multipart/form-data">
                    <div class="box-input">
                        <label>Titles: </label>
                        <input id="postTile" name="txtBlogTitle" placeholder="Blog title" type="text">
                    </div>
                    <figure class="img-container">
                        <img id="js-display-img" src="" alt="">
                        <figcaption  id="js-name-img"></figcaption>
                    </figure>
                    <input data-id="" id="jsuploadImg" type="file" name="blogImg" accept="image/*">
                    <div class="img-label">
                        <label class="uploadImg" for="jsuploadImg"><i class="fa-solid fa-upload"></i> Choose A Photo</label>
                    </div>
                    <div class="box-input">
                        <label>Content: </label>
                        <textarea id="textEditor" name="txtBlogContent" placeholder="Blog content"></textarea>
                    </div>
                    <input type="hidden" id="blg-id" value="" name="id" />
                    <button name="action" value="postBlog" class="btn btn-light-green btnPost" type="submit">Post</button>
                    <button name="action" value="editBlog" class="btn btn-light-green btnSave" type="submit">Save</button>
                </form>
            </div>
        </div>
        <div onclick="postBlog()" class="post-blog-btn">
            <div class="post-blog-btn-icon">
                <i class="fa-solid fa-plus"></i>
                <i class="fa-solid fa-pen"></i>
            </div>
            <div class="post-blog-btn-des">
                Write your blog?
            </div>
        </div>
        <%@include file="toast.jsp" %>
        <script defer>
            const displayImg = document.getElementById("js-display-img");
            const displayName = document.getElementById("js-name-img");
            const btnImg = document.getElementById("jsuploadImg");

            tinymce.init({
                selector: '#textEditor',
                plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss',
                toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
                tinycomments_mode: 'embedded',
                tinycomments_author: 'Author name',
                mergetags_list: [
                    {value: 'First.Name', title: 'First Name'},
                    {value: 'Email', title: 'Email'},
                ]
            });

            /*check validation*/
            $('#postBlog').on('submit', function (e) {
                var maxLengthTitle = 50;
                var maxLengthContent = 3000;
                var minLengthContent = 100;
                if ($(this).children('#jsuploadImg').attr("data-id") != 1 && $(this).children('#jsuploadImg').get(0).files.length === 0) {
                    toast({
                        title: "Opps!",
                        msg: "Need to upload an image!",
                        type: 'warning',
                        duration: 3000
                    });
                    e.preventDefault();
                } else if ($('#postTile').val().length > maxLengthTitle) {
                    toast({
                        title: "Opps!",
                        msg: "Post title maximun " + maxLengthTitle + " charactors!",
                        type: 'warning',
                        duration: 3000
                    });
                    e.preventDefault();
                } else if ($('#textEditor').val().length > maxLengthContent) {
                    toast({
                        title: "Opps!",
                        msg: "Post content maximun " + maxLengthContent + " charactors!",
                        type: 'warning',
                        duration: 3000
                    });
                    e.preventDefault();
                } else if ($('#textEditor').val().length < minLengthContent) {
                    toast({
                        title: "Opps!",
                        msg: "Post content minimum " + minLengthContent + " charactors!",
                        type: 'warning',
                        duration: 3000
                    });
                    e.preventDefault();
                }

            });

            //display img when upload
            btnImg.onchange = () => {
                let reader = new FileReader();
                reader.readAsDataURL(btnImg.files[0]);
                reader.onload = () => {
                    displayImg.setAttribute("src", reader.result);
                };
                displayName.textContent = btnImg.files[0].name;
            };
            //off post blog 
            function closePostBlog() {
                $('.post-blog').toggleClass("active");
                $('.header-wrapper').slideDown();
                $(window).on('mousewheel');
                $('body').removeClass('modal-open');
            }

            function postBlog() {
                $('.btnSave').hide();
                $('.btnPost').show();
                openPostBlog();
            }

            //show post blog 
            function openPostBlog() {
            <c:if test="${sessionScope.account!=null}">
                $('.post-blog').toggleClass('active');
                $('.header-wrapper').slideUp();
                $('body').addClass('modal-open');
            </c:if>
            <c:if test="${sessionScope.account==null}">
                toast({
                    title: "Opps!",
                    msg: "Login to use this fuction!",
                    type: 'error',
                    duration: 5000
                });
            </c:if>
            }

        </script>
    </body>
</html>
