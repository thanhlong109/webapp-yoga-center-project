<%-- 
    Document   : blogHomeDetail
    Created on : Jun 17, 2023, 12:17:06 PM
    Author     : DatTGT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="Asset/css/blogHomeDetail.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css">
        <link rel="stylesheet" href="Asset/css/clientFooter.css">
        <link rel="stylesheet" href="Asset/css/common.css">    
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
            <div class="banner">
                <h2>Is Information Overload Making it Harder to be Happy?</h2>
                <p>July 31, 2020 <span></span> James Smith</p>
            </div>
            <div class="container">
                <div class="left-container">
                    <div class="blog">
                        <div class="blog-img">
                            <img src="Asset/img/blog/shutterstock_1371365435-1100x490.jpg" alt="">
                        </div>
                        <div class="blog-content text">
                            Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life.
                        </div>
                    </div>
                    <div class="separate"></div>
                    <div class="comment-area">
                        <h2 class="comment-area-title">Comments (3)</h2>
                        <div class="load-comment">
                            <div class="user-comment-item">
                                <div class="user-comment-avata">
                                    <img src="Asset/img/Trainer/personnel-3.jpg" alt="">
                                </div>
                                <div class="comment-info">
                                    <div>
                                        <h4 class="user-comment-name">James Smith</h4>
                                        <p class="user-comment-date"><i class="fa-regular fa-clock"></i> Jule 07, 2023 at 10:21 AM</p>
                                    </div>
                                    <p class="user-comment-content text">
                                        Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.
                                    </p>
                                </div>
                            </div>
                            <div class="user-comment-item">
                                <div class="user-comment-avata">
                                    <img src="Asset/img/Trainer/personnel-3.jpg" alt="">
                                </div>
                                <div class="comment-info">
                                    <div>
                                        <h4 class="user-comment-name">James Smith</h4>
                                        <p class="user-comment-date"><i class="fa-regular fa-clock"></i> Jule 07, 2023 at 10:21 AM</p>
                                    </div>
                                    <p class="user-comment-content text">
                                        Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <form action="#" method="post" class="user-comment">
                            <textarea name="txtCommentContent" placeholder="Your comment here..."></textarea>
                            <button type="submit">Post</button>
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
    </body>
</html>
