<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<style>
    .box-section{
        padding: 16px 0 32px 0;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    .box-container{
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    .load-more{
        cursor: pointer;
    }
    .box-title{
        font-size: 20px;
        color: #383838;
        margin-bottom: 32px;
    }
    .small-blog-item{
        display: flex;
        gap: 16px;
    }
    .small-blog-item a{
        font-size: 16px;
        color: #444444;
        text-decoration: none;
        font-weight: 600;
    }
    .small-blog-item-img{
        overflow: hidden;
        display: flex;
        justify-content: center;
        max-width: 75px;
        max-height: 75px;
        min-width: 75px;
        min-height: 75px;
        border: 1px solid #999;
    }
    .small-blog-item-img img{
       height: 100%;
       display: block;
    }
    .small-blog-item-info{
        display: flex;
        color: #a0a0a0;
        font-size: 14px;
        margin-top: 8px;
        gap: 16px;
        flex-direction: column;
    }
    .small-blog-item-action{
        display: flex;
    }
    .small-blog-item-action div{
        cursor: pointer;
    }
    .small-blog-item-action div:last-child{
        margin-left: 16px;
    }
    .btnShowRight{
        display: none;
    }
    @media screen and (max-width:739px) {
        .right-container{
            position: fixed;
            left: 100%;
            top: 130px;
            right: 0;
            bottom: 0;
            background-color: white;
            padding: 0;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.4);
            overflow: hidden;
            transition: all ease-in-out .4s;
        }
        .right-container.active{
            padding: 20px;
            left: 0;
            overflow-y: scroll;
        }
        .btnShowRight{
            position: fixed;
            display: block;
            top:30%;
            right: 16px;
            background-color: white;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            color: black;
            border: 1px solid #383838;
            text-align: center;
            line-height: 32px;
            cursor: pointer;
            transition: all ease-in-out .3s;
        }
    }
</style>
<div class="right-container">
    <script src="${pageContext.request.contextPath}/Asset/js/cdnjs.cloudflare.com_ajax_libs_jquery_3.7.0_jquery.min.js"></script>
    <div class="box-section">
        <h2 class="box-title">Text Widget</h2>
        <p class="text" >A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot.</p>
    </div>
    <div class="box-section">
        <h2 class="box-title">Recent Articles</h2>
        <c:if test="${recentBlogList!=null && recentBlogList.size() gt 0}">
            <div class="box-container">
                <c:forEach items="${recentBlogList}" var="blog">
                    <div class="small-blog-item">
                        <div class="small-blog-item-img">
                            <img src="Asset/img/blog/${blog.img}" alt="">
                        </div>
                        <div>
                            <a href="blog-detail?blogid=${blog.id}">${blog.title}</a>
                            <div class="small-blog-item-info">
                                <div><i class="fa-regular fa-clock"></i> <fmt:formatDate value="${blog.date}" pattern="MMMM d, yyyy" /></div>
                                <div class="small-blog-item-action">
                                    <div onclick="editBlog(${blog.id})"><i class="fa-solid fa-pen-to-square"></i> Edit</div>
                                    <div onclick="deleteBlog(${blog.id},this)"><i class="fa-solid fa-trash"></i> Delete</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <p class="load-more" data-idd="3" onclick="loadMore(this)">view more <i class="fa fa-caret-down" aria-hidden="true"></i></p>
        </c:if>
        <c:if test="${recentBlogList==null || recentBlogList.size() lt 1}">
            <div class="noice-empty">
                <img src="Asset/img/icon/empty.png" alt="">
                <h4>You haven't posted any blogs yet</h4>
            </div>
        </c:if>
    </div>
</div>
    
<i class="fa-solid fa-chevron-left btnShowRight"></i>
<script defer>
    //show off right part blog on mobile view
    const showRightBtn = document.querySelector(".btnShowRight");
    const rightContainer = document.querySelector(".right-container");
    showRightBtn.addEventListener("click",()=>{
        rightContainer.classList.toggle("active");
        showRightBtn.classList.toggle("fa-rotate-180");
    });
    //load more for right section
    <c:if test="${maxLoadMore<=3}">
        $('.load-more').hide();                                
    </c:if>
    function loadMore(select){
        var quantity = $(select).data("idd");
        if(quantity<=${maxLoadMore}){
            $.ajax({
                url:"blogs?action=loadmore&quantity="+quantity,
                type:"post",
                success:function(data){
                    $('.box-container').append(data);
                    quantity+=3;
                    $(select).data("idd",quantity);
                    if(quantity>=${maxLoadMore}){
                        $(select).hide();
                    }
                },
                error: function(msg){

                }   
            });
        }
    }
    function editBlog(id){
        $('.btnSave').show();
        $('.btnPost').hide();
        $.ajax({
                url:"blogs?action=getBlog&id="+id,
                type:"post",
                success:function(data){
                    var blog = JSON.parse(data);
                    $('.post-blog').find('#js-display-img').attr("src","Asset/img/blog/"+blog.img);
                    $('.post-blog').find('#jsuploadImg').attr("data-id",1);
                    $('.post-blog').find('#blg-id').val(blog.id);
                    $('.post-blog').find('#postTile').val(blog.title);
                    $('.post-blog').find('#textEditor').val(blog.detail);
                    tinymce.activeEditor.setContent(blog.detail);
                    openPostBlog();
                },
                error: function(){   
                }   
            });
    }
    
    function deleteBlog(id,select){
        $.ajax({
            url:"blogs?action=deleteBlog&id="+id,
            type:"post",
            success:function(data){
                $(select).parents('.small-blog-item').hide();
                $('.js-blog-'+id).hide();
                 toast({
                    title: "Success!",
                    msg: "Delete success!",
                    type: 'success',
                    duration: 3000
                });
            },
            error: function(){   
            }   
        });
        
        
    }
</script>
