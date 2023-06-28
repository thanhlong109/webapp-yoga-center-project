<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<div class="right-container">
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
                                <div style="text-transform: capitalize;" ><i class="fa-solid fa-pen"></i> ${blog.account.name}</div>
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
                <h4>you haven't posted any blogs yet</h4>
            </div>
        </c:if>
    </div>
</div>

<i class="fa-solid fa-chevron-left btnShowRight"></i>
<script>
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
</script>
