<%-- 
    Document   : userProfileSetting
    Created on : Jun 17, 2023, 9:27:46 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user setting</title>
        <link rel="stylesheet" href="../Asset/css/clientHeader.css">
        <link rel="stylesheet" href="../Asset/css/clientFooter.css">
        <link rel="stylesheet" href="../Asset/css/common.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <style>
             .banner{
                padding: 12% 20px 10% 20px;
                width: 100%;
                text-align: center;
                background: url(../Asset/img/bg/page-title-1.png) top center / cover no-repeat;
            }
            .banner h2{
                color: #227179;
                font-size: 3.3vw;
            }
            .container{
                max-width: 1320px;
                margin: 0 auto;
                padding: 50px;
                width: 1220px;
            }
            .user2{
                display: flex;
                align-items: center;
            }
            .user-img{
                max-width: 120px;
                max-height: 120px;
                min-width: 120px;
                min-height: 120px;
                overflow: hidden;
                border-radius: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
               border: 1px solid #4444;
               margin-right: 24px;
            }
            .user-img img{
                width: 100%;
                max-height: 150px ;
            }
            .user-container{
                margin-top: 64px;
                display: flex;
            }
            .user-nav{
                list-style: none;
                display: flex;
                flex-direction: column;
                gap: 2px;
                box-shadow: 0 5px 25px rgba(0,0,0,0.15);
                width: 250px;
                height: fit-content;
            }
            .user-nav li{
                background-color: #f5f5f5;
                cursor: pointer;
            }
            .user-nav li.active,.user-nav li:hover{
                background-color: #fbfbfb;
            }
            .user-nav li.active a{
                color: #3dbca8;
            }

            .user-nav a{
                text-decoration: none;
                color: #6a6a6a;
                line-height: 50px;
                margin-left: 16px;
                display: block;
            }
            .user-nav a i{
                margin-right: 16px;
            }
            .user-content{
                padding: 0 50px;
            }
            .filter-course{
                list-style: none;
                display: flex;
                gap:16px;
            }
            .filter-course>li{
                padding: 0px 4px;
                color: #696969;
                font-weight: 600;
                cursor: pointer;
            }
            .filter-course>li.active{
                border-bottom: 2px solid #3dbca8;
            }
            table{
                margin-top: 46px;
                border-collapse: collapse;
                border: 1px solid #e6e6e6;
                text-align: center;
            }
            th{
                color: #5e5e5e;
                background-color: #e6e6e6;
            }
            td,th{
                padding: 12px 24px;

            }
            .course-table img{
                max-width: 100px;
                max-height: 70px;
            }

            /*input*/
            form{
                margin-top: 16px;
                min-width: 500px;
                display: flex;
                flex-direction: column;
            }

            .box-input{
                padding: 16px 0;
                display: flex;
                flex-direction: column;
            }
            .box-input label{
                font-size: 18px;
                color: #565555;
                font-weight: 500;
            }
            form input{
                padding: 12px;
                margin-top: 16px;
                border: 1px solid #e7e7e7;
                outline: none;
                display: block;
                width: 100%;
            }
            button[type="submit"],.img-btn-label{
                padding: 12px 24px;
                width: fit-content;
                margin-top: 12px;
                background-color: #3dbca8;
                border: none;
                border-radius: 4px;
                color: white;
                cursor: pointer;
                font-size: 14px;
                font-style: normal;
            }
            button[type="submit"]:hover,.img-btn-label:hover{
                opacity: 0.8;
            }

            /*avatar*/
            .show-img{
                max-width: 320px;   
                max-height: 320px;
                overflow: hidden;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .show-img img{
                max-width: 100%;
                max-height: 300px;
                display: block;
            }
            .avatar button{
                margin-left: 64px;
            }
            /**/
            .box-pass{
                position: relative;
            }
            .box-pass i{
                position: absolute;
                top: 50%;
                right: 12px;
                cursor: pointer;
            }
            .noice{
                color: rgb(246, 73, 73);
            }
            @media screen and (max-width:740px) {
                .container{
                    padding: 50px 20px;
                    max-width: 100%;
                }
                .banner h2{
                    font-size: 9vw;
                }
                .user-container{
                    flex-direction: column;
                }
                .user-nav{
                    flex-direction: row;
                    width: 100%;
                }
                .user-nav li{
                    width: fit-content;
                    display: flex;
                    height: fit-content;
                }
                .user-nav a{
                    margin-left: 0; 
                    text-align: center; 
                }
                .user-nav a i{
                    margin-right: 0;
                }

                .user-content{
                    padding: 0;
                }
                .display-course-content{
                    overflow-x: scroll;
                    max-width: 100%;
                }
                .filter-course{
                    margin-top: 64px;
                }
                form{
                    min-width: none;
                }

            }
        </style>
    </head>
    <body>
        <%@include file="../Component/header.jsp" %> 
        <div class="banner">
            <h2>Your Profile</h2>
        </div>
        <div class="container">
            <div class="user2">
                <div class="user-img"><img src="../Asset/img/avatar/${account.img}" alt="img"></div>
                <h2 class="js-username" >${account.name}</h2>
            </div>
            <div class="user-container">
                <!-- navigation -->
                <ul class="user-nav">
                    <li ><a href="course"><i class="fa fa-book" aria-hidden="true"></i> Course</a></li>
                    <li><a href="wishlist"><i class="fa fa-heart" aria-hidden="true"></i> Wishlist</a></li>
                    <li class="active"><a href="setting"><i class="fa fa-sliders" aria-hidden="true"></i> Setting</a></li>
                    <li><a href="booking"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Booking</a></li>
                    <li><a href="../logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li>
                </ul>
                <div class="user-content">
                    <div class="course-option">
                        <!-- filter -->
                        <ul class="filter-course">
                            <li data-filterid="general" class="active">General</li>
                            <li data-filterid="avatar">Avatar</li>
                            <li data-filterid="password">Password</li>
                        </ul>
                        <div class="display-content">
                            <!-- general section -->
                            <div class="general">
                                <form class="general-form" action="setting">
                                    <div class="box-input">
                                        <label>Username:</label>
                                        <input required type="text" name="txtUsername" placeholder="Username" value="">
                                    </div>
                                    <div class="box-input">
                                        <label>Email:</label>
                                        <input required  type="email" name="txtEmail" placeholder="Email" value="">
                                    </div>
                                    <div class="box-input">
                                        <label>Phone Number:</label>
                                        <input required type="number" name="txtPhone" placeholder="Phone Number" value="">
                                    </div>
                                    <button type="submit">Save</button>
                                </form>
                            </div>
                            <!-- avatar section -->
                            <div class="avatar" style="display: none;">
                                <form class="avatar-form" action="setting" enctype="multipart/form-data">
                                    <div class="show-img">
                                        <img src="../Asset/img/avatar/${account.img}" alt="">
                                    </div>
                                    <input id="img-btn" required style="display: none;" type="file" name="avatar" accept="image/*">
                                    <div >
                                        <label class="img-btn-label" for="img-btn">Choose File</label>
                                        <button type="submit">Save</button>
                                    </div>
                                </form>
                            </div>
                            <!-- password section -->
                            <div class="password" style="display: none;">
                                <form class="password-form" action="setting">
                                    <div class="box-input">
                                        <label>Current Password:</label>
                                        <div class="box-pass">
                                            <input required type="password" name="txtPassword" placeholder="Current Password">
                                            <i class="fa-sharp fa-solid fa-eye"></i>
                                        </div>
                                    </div>
                                    <div class="box-input">
                                        <label>New Password:</label>
                                        <div class="box-pass">
                                            <input class="jsCheckPass" id="newPass1" required type="password" name="txtNewPassword" placeholder="New Password">
                                            <i class="fa-sharp fa-solid fa-eye"></i>
                                        </div>
                                    </div>
                                    <div class="box-input">
                                        <label>Confirm New Password:</label>
                                        <div class="box-pass">
                                            <input  class="jsCheckPass" id="newPass2" required type="password" placeholder="Confirm New Password">
                                            <i class="fa-sharp fa-solid fa-eye"></i>
                                        </div>
                                        <button id="btnPass" type="submit">Save</button>
                                    </div>
                                    <h4 class="noice"></h4>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
        $(document).ready(()=>{
            /*display filter option*/
           document.querySelectorAll(".filter-course li").forEach(f =>{
            $(f).click(()=>{
                $(f).addClass('active');
                $(f).siblings().removeClass('active');
                if($(f).data('filterid')=='general'){
                    $('.general').show(300);
                    $('.general').siblings().hide(300);
                }else if($(f).data('filterid')=='avatar'){
                    $('.avatar').show(300);
                    $('.avatar').siblings().hide(300);
                }else if($(f).data('filterid')=='password'){
                    $('.password').show(300);
                    $('.password').siblings().hide(300);
                }
            });
           });
           /* dispay hide password*/
            const passBoxs = document.querySelectorAll(".box-pass");
            passBoxs.forEach(passBox =>{
                let icon = passBox.querySelector("i");
                let input = passBox.querySelector("input");
                icon.addEventListener("click",()=>{
                    if(icon.classList.contains("fa-eye")){
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash")
                        input.setAttribute("type","text");
                    }else{
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                        input.setAttribute("type","password");
                    }

                });
            });
            /*check new pass equal*/
            $('.jsCheckPass').on('input',()=>{
                    if($('#newPass1').val()==$('#newPass2').val()){
                        document.querySelector('.noice').innerHTML = "";
                        $('#btnPass').removeAttr("disabled");
                    }else{
                        $('#btnPass').attr('disabled','disabled');
                        document.querySelector('.noice').innerHTML = "Your new password don't match!";
                    }
                });
            });
            /*upload img display*/
            const avatar = document.querySelector('.user-img img');
            const btnImg =  document.getElementById('img-btn');
            const displayImg = document.querySelector('.show-img img');
            btnImg.onchange = ()=>{
                let reader = new FileReader();
                reader.readAsDataURL(btnImg.files[0]);
                reader.onload = ()=>{
                    displayImg.setAttribute("src",reader.result);
                    avatar.setAttribute("src",reader.result);
                };
                console.log(btnImg.files[0].name);
            };
            
            /**/
            $('.general-form').on('submit',function (e){
                e.preventDefault();
                $.ajax({
                    type     : "POST",
                    cache    : false,
                    url      : $(this).attr('action'),
                    data     : "action=general&"+$(this).serialize(),
                    success  : function(data) {
                        document.querySelector('.js-username').innerHTML =data;
                    }
                });
                
            });
            $('.avatar-form').on('submit',function (e){
                e.preventDefault();
                var formData = new FormData(this);
                $.ajax({
                    url: "setting?action=avatar",
                    type: 'POST',
                    contentType: false,
                    processData: false,
                    data: formData,
                    success: function(data){
                    },
                    error: function(xhr, textStatus, errorThrown) {
                      alert( xhr.status);
                    }
                });
            });
        </script>
        <%@include file="../Component/footer.jsp" %>
    </body>
</html>
