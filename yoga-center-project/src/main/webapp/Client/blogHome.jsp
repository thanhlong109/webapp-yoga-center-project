<%-- 
    Document   : blogHome
    Created on : Jun 16, 2023, 9:31:14 PM
    Author     : DatTGT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="banner">
                <h2>Blog Home</h2>
            </div>
            <div class="container">
                <div class="left-container">
                    <div class="blog-item">
                        <div class="blog-item-img">
                            <img src="Asset/img/blog/shutterstock_1371365435-1100x490.jpg" alt="">
                        </div>
                        <div class="blog-item-body">
                            <span class="blog-item-date">July 31, 2020</span>
                            <div>
                                <a class="blog-item-author" href="#">James Smith</a>
                            </div>
                            <a class="blog-item-title">
                                Is Information Overload Making it Harder to be Happy?
                            </a>
                            <div class="text">
                                I neglect my talents Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by  
                            </div>
                            <a href="#" class="read-more-btn">Read More <i class="fa-solid fa-chevron-right"></i></a>
                        </div>
                    </div>

                    <div class="blog-item">
                        <div class="blog-item-img">
                            <img src="Asset/img/blog/shutterstock_1371365435-1100x490.jpg" alt="">
                        </div>
                        <div class="blog-item-body">
                            <span class="blog-item-date">July 31, 2020</span>
                            <div>
                                <a class="blog-item-author" href="#">James Smith</a>
                            </div>
                            <a class="blog-item-title">
                                Is Information Overload Making it Harder to be Happy?
                            </a>
                            <div class="text">
                                I neglect my talents Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by  
                            </div>
                            <a href="#" class="read-more-btn">Read More <i class="fa-solid fa-chevron-right"></i></a>
                        </div>
                    </div>
                </div>
                <!-- right container-->
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
                                <a href="#">Is Information Overload Making it Harder to be Happy?</a>
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
                                <a href="#">Is Information Overload Making it Harder to be Happy?</a>
                                <div class="small-blog-item-info">
                                    <div><i class="fa-regular fa-clock"></i> July 31, 2020</div>
                                    <div><i class="fa-solid fa-pen"></i> James Smith</div>
                                </div>
                            </div>
                        </div>
                        <div class="small-blog-item">
                            <div class="small-blog-item-img">
                                <img src="../img/blog/shutterstock_1371365435-1100x490.jpg" alt="">
                            </div>
                            <div>
                                <a href="#">Is Information Overload Making it Harder to be Happy?</a>
                                <div class="small-blog-item-info">
                                    <div><i class="fa-regular fa-clock"></i> July 31, 2020</div>
                                    <div><i class="fa-solid fa-pen"></i> James Smith</div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <i class="fa-solid fa-chevron-left btnShowRight"></i>

                <div class="post-blog">
                    <div class="post-blog-container">
                        <i class="fa-solid fa-x close-btn"></i>
                        <h2><i class="fa-solid fa-star"></i> New Blog</h2>
                        <form action="">
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
                                <textarea name="txtBlogContent" placeholder="Blog content"></textarea>
                            </div>
                            <button class="btn btn-light-green" type="submit">Post</button>
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
            <script defer>
                const displayImg = document.getElementById("js-display-img");
                const displayName = document.getElementById("js-name-img");
                const btnImg = document.getElementById("jsuploadImg");

                const btnCloseBlog = document.querySelector(".close-btn");
                const postBlog = document.querySelector(".post-blog");
                const btnPostBlog = document.querySelector(".post-blog-btn");

                const showRightBtn = document.querySelector(".btnShowRight");
                const rightContainer = document.querySelector(".right-container");

                btnImg.onchange = () => {
                    let reader = new FileReader();
                    reader.readAsDataURL(btnImg.files[0]);
                    reader.onload = () => {
                        displayImg.setAttribute("src", reader.result);
                    };
                    console.log(btnImg.files[0].name);
                    displayName.textContent = btnImg.files[0].name;
                };

                btnCloseBlog.addEventListener("click", () => {
                    postBlog.classList.toggle("active");
                });
                btnPostBlog.addEventListener("click", () => {
                    postBlog.classList.toggle("active");
                });

                showRightBtn.addEventListener("click", () => {
                    rightContainer.classList.toggle("active");
                    showRightBtn.classList.toggle("fa-rotate-180");
                });

            </script>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>