<%-- 
    Document   : BlogApproval
    Created on : Jul 21, 2023, 1:17:21 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Category</title>
        <!-- Fontawesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
        <!-- Google icon -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Sharp:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <!-- Link CSS  -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/dashboard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/alertBoxAdmin.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
             
        <style>
            main .top{
                padding: 20px 20px 20px 0px;  
                margin-top: 16px;
            }
            #wrapper{
                background: #fff;
                width: fit-content;
                padding: 12px;
                
            }
            .blog-list{
                border-collapse: collapse;
                background: #fff;
            }
            .blog-list td,th{
                border: 1px solid #b1b1b1;
                padding: 8px 24px;
            }
            .blog-list th{
                color: #444;
                font-size: 16px;
            }
            .blog-list td{
                color: #444;
                font-size: 15px;
                
            }
            .blog-list tr:nth-child(odd){
                background-color: #f8f8f8d1;
            }
            .blog-title{
                font-weight: 600;
                font-size: 15px;
            }
            .blog-status-approved,.blog-status-pending{
                color: white !important;
                font-weight: 600;
                padding: 2px 4px;
                display: flex;
                justify-content: center;
                font-size: 13px;
            }
            
            .blog-status-pending{
                background-color: rgb(255, 205, 86);
            }
            .blog-status-approved{
                background-color: rgb(75, 192, 192);
            }
            /**/
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
            /**/
            .blog-view-wrapper{
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0,0,0,.35);
                display: none;
            }
            .blog-view-container{
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                display: flex;
                flex-direction: column;
                max-width: 1000px;
                width: 90%;
                gap: 12px;
                background: #fff;
                padding: 16px;
                border-radius: 10px;
            }
            .blog-view{
                display: flex;
                max-height: 500px;
                overflow-y: scroll;
                border: 2px solid #e5e7eb;
                border-radius: 10px;
            }
            .blog-view-scroller{
                padding: 12px;
            }
            .blog-view-scroller h2{
                margin: 12px 0;
                
            }
            .blog-view-img{
                overflow:hidden;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .blog-view-img img{
                width: 100%;
            }
            .blog-view h2{
                color: #227179;
                font-size: 20px;
                font-weight: 600;
            }
            .blog-view p{
                color: #5e5e5e;
                font-size: 16px;
                line-height: 1.4;
            }
            .blog-view-btns{
                display: flex;
                gap: 32px;
                justify-content: right;
                padding: 4px 24px;
            }
            .bl-btn{
                padding: 12px 24px;
                font-size: 16px;
                border-radius: 10px;
                cursor: pointer;
                transition: all ease-in-out .3s;
            }
            .bl-btn-sm:not(.bl-btn-sm:first-child){
                margin-top: 4px;
            }
            .bl-btn-sm{
                font-size: 14px;
                border-radius: 8px;
                cursor: pointer;
                transition: all ease-in-out .3s;
                width: 70px;
                display: block;
                text-align: center;
                padding: 4px;
            }
            .btn-close{
                background: #f3f4f6;
                border: 1px solid #e5e7eb;
                color: #444;
            }
            .btn-close:hover{
                background:#444;
                color: white;
            }
            .btn-delete{
                border:1px solid #d70018;
                background: #fef2f2;
                color: #d70018;
            }
            .btn-delete:hover{
                background:#d70018;
                color: white;
            }
            .btn-approval{
                border:1px solid #008ed7;
                background: #008ed72b;
                color: #008ed7;
            }
            .btn-approval:hover{
                background:#008ed7;
                color: white;
            }
            
            /**/
            .bl-filter{
                padding: 4px 8px;
                border: 1px solid #b1b1b1;
                margin-bottom: 16px;
                cursor: pointer;
            }
            
        </style>
    </head>
    <body>
        <fmt:setLocale value="en_US" />
        <div class="container">
            <!-- LEFT SIDE-BAR -->
            <%@include file="../Component/adminSideMenu2.jsp" %>
            <!-- ====================== MAIN ==================== -->
            <main>
                <div class="top">
                    <button id="menu-btn">
                        <span class="material-symbols-sharp">menu</span>
                    </button>
                    <div class="profile">
                        <div class="info">
                            <p>Hey, <b>${sessionScope.account.name}</b></p>
                            <small class="text-muted">Admin</small>
                        </div>
                        <div class="profile-photo">
                            <img src="../Asset/img/avatar/${sessionScope.account.img}" alt="">
                        </div>
                    </div> 
                </div>
                <h2 class="title">Blog Approval</h2>
                <div>
                    <span>
                        <select class="bl-filter" onchange="reloadPage(this)">
                            <option ${filter.equals("all")?"selected":""} value="all">All</option>
                            <option ${filter.equals("pending")?"selected":""} value="pending">Pending</option>
                            <option ${filter.equals("approved")?"selected":""} value="approved">Approved</option>
                        </select>
                    </span>
                </div>
                <div id="wrapper">
                    <c:if test="${blog-list!=null}">
                        <table class="blog-list">
                            <tr>
                                <th>Blog ID</th>
                                <th>Name</th>
                                <th>Author</th>
                                <th>Publish Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                            <c:forEach items="${blogList}" var="blog">
                                <tr class="bl-id-${blog.id}">
                                    <td>${blog.id}</td>
                                    <td class="blog-title">${blog.title}</td>
                                    <td>${blog.account.name}</td>
                                    <td><fmt:formatDate value="${blog.date}" pattern="MMMM d, yyyy" /></td>
                                    <c:if test="${!blog.active}"><td><span class="bl-status blog-status-pending">Pending</span></td></c:if>
                                    <c:if test="${blog.active}"><td> <span class="bl-status blog-status-approved">Approved</span></td></c:if>
                                    <td><span class="bl-btn-sm btn-close" onclick="show(${blog.id})" >View</span> 
                                        <span class="bl-btn-sm btn-delete" onclick="deleteBlog(${blog.id})">Delete</span> 
                                        <c:if test="${!blog.active}"><span onclick="approval(${blog.id})" class="bl-btn-sm btn-approval" >Approval</span></c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:if>
                </div>
                <div class="blog-view-wrapper">
                    <div class="blog-view-container">
                        <div class="blog-view">
                            <div class="blog-view-scroller">
                                <div class="blog-view-img">
                                    <img src="../Asset/img/blog/img-blog-id-10.jpg" alt="alt"/>
                                </div>
                                <h2 class="blog-view-title" >Blog Title</h2>
                                <p class="blog-view-content">
                                    Keep in mind that email validation can be quite complex due to the different possible characters allowed and the vast number of email providers and TLDs available. The above regular expression is a basic one and may not cover all valid email addresses or exclude all invalid ones.
                                    Keep in mind that email validation can be quite complex due to the different possible characters allowed and the vast number of email providers and TLDs available. The above regular expression is a basic one and may not cover all valid email addresses or exclude all invalid ones.
                                </p>
                            </div>
                        </div>
                        <div class="blog-view-btns">
                            <span onclick="closeView()" class="bl-btn btn-close">Close</span>
                            <span class="bl-btn btn-delete">Delete</span>
                            <span class="bl-btn btn-approval">Approval</span>
                        </div>
                    </div>
                </div>
                <%@include file="../Component/toast.jsp" %>
                <div class="pagination">
                    <c:if test="${numpage>1}">
                        <c:if test="${page>1}">
                            <a href="blog-approval?filter=${filter}&page=${page-1}"><i class="fa-solid fa-chevron-left"></i></a>
                        </c:if>
                        <c:forEach begin="${1}" var="i" end="${numpage}">
                            <a href="blog-approval?filter=${filter}&page=${i}" <c:if test="${i==page}">class="p-active"</c:if> >${i}</a>
                        </c:forEach>
                        <c:if test="${page<numpage}">
                            <a href="blog-approval?filter=${filter}&page=${page<numpage?(page+1):numpage}"><i class="fa-solid fa-chevron-right"></i></a>
                        </c:if>
                    </c:if>
                </div>
            </main>
        </div>
        <script defer>
               function deleteBlog(id){
                    $.ajax({
                        url:"../blogs?action=deleteBlog&id="+id,
                        type:"post",
                        success:function(data){
                            $('bl-id-'+id).hide();
                             toast({
                                title: "Success!",
                                msg: "Delete success!",
                                type: 'success',
                                duration: 3000
                            });
                            $('.bl-id-' + id).hide();
                        },
                        error: function(){   
                        }   
                    });
                }
                
                
                function closeView(){
                    $('.blog-view-wrapper').fadeOut(300);
                }
                
                function show(id){
                    $.ajax({
                        url:"blog-approval?action=view&id="+id,
                        type:"post",
                        success:function(data){
                            var blog = JSON.parse(data);
                            console.log(blog);
                            $('.blog-view-content').html(blog.detail);
                            $('.blog-view-title').html(blog.title);
                            $('.blog-view-img img').attr("src",'../Asset/img/blog/'+blog.img);
                            $('.blog-view-container .btn-delete').click(function(){
                                deleteBlog(id);
                                $('.blog-view-wrapper').fadeOut(300);
                            });
                            $('.blog-view-wrapper .btn-approval').click(function(){
                                $(this).hide();
                                approval(id);
                            });
                        },
                        error: function(){   
                        }   
                    });
                    if($('.bl-id-' + id).find('.btn-approval').length > 0){
                        $('.blog-view-wrapper .btn-approval').show();
                    }else{
                        $('.blog-view-wrapper .btn-approval').hide();
                    }
                    $('.blog-view-wrapper').fadeIn(300);
                }
                function approval(id){
                    $.ajax({
                        url:"blog-approval?action=approval&id="+id,
                        type:"post",
                        success:function(data){
                            let bl = $('.bl-id-'+id).find('.bl-status');
                            bl.addClass('blog-status-approved');
                            bl.removeClass('blog-status-pending');
                            bl.html('Approved');
                            $('.bl-id-'+id).find('.btn-approval').hide();
                        },
                        error: function(){   
                        }   
                    });
                    
                }
                
                function reloadPage(e){
                    
                    var value = $(e).find(":selected").val();
                    // Get the current URL search parameters
                    var searchParams = new URLSearchParams(window.location.search);

                    // Set the new value for the "filter" parameter
                    searchParams.set("filter", value);
                    searchParams.set("page", 1);

                    // Get the updated search string
                    var newSearchString = searchParams.toString();

                    // Replace the current URL with the updated search string
                    window.location.href = window.location.pathname + "?" + newSearchString;
                    
                }
                
                function search(){
                    
                }
         </script>               
    </body>
</html>
