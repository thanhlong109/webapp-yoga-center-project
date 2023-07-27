<%-- 
    Document   : about
    Created on : Jul 11, 2023, 7:35:04 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
         <link rel="stylesheet" href="Asset/css/common.css">
        <style>
            .banner{
                padding: 12% 20px 4% 20px;
                width: 100%;
                text-align: center;
                background: url(Asset/img/bg/page-title-1.png) top center / cover no-repeat;
            }
            .banner h2{
                color: #227179;
                font-size: 3.3vw;
            }
            .banner p{
                color: #547670;
                font-size: 24px;
            }
            .section1{
                display: grid;
                grid-template-columns: 1fr 1fr;
                padding: 120px 0;
            }
            .section1 img{
                width: 100%;
                object-fit: cover;
                transform: translateX(-10%);
            }
            .section1>div:last-child{
                padding: 110px 60px 0 0;

            }
            .section1 h4,.section2 h4{
                color: #3dbca8;
                font-size: 27px;
                font-weight: 500;
            }
            .section1 h2, .section2 h2{
                color: #227179;
                font-size: 55px;
                font-weight: 600;
            }
            .section1 p{
                margin-top: 32px;
                color: #506762;
                font-size: 19px;
                line-height: 1.5;
                text-align: justify;
                max-width: 550px;
            }
            .section1 .btn{
                margin-top: 32px;
                margin-right: 16px;
            }
            .section2{
                display: grid;
                grid-template-columns: 1fr 1fr;
                margin: 0 auto;
                padding-left: 120px;
                gap: 60px;
            }
            .section2 h2{
                font-size: 42px;
            }
            .section2 .group-tag{
                display: grid;
                grid-template-columns: 1fr 1fr;
                padding: 32px 0;
                gap: 80px 40px;
                margin-top: 42px;
            }
            .section2 .tag{
                position: relative;
                padding: 40px 20px 20px;
                border: 1px solid rgba(0, 0, 0, 0.25);
                border-radius: 4px;
            }
            .tag .icon img{
                width: 74px;
                height: 74px;
            }
            .tag .icon{
                position: absolute;
                top: 0;
                left: 0;
                transform: translate(50%,-50%);
            }
            .tag h3{
                color: #494949;
            }
            .tag p{
                color: #5e5e5e;
            }
            .section2>div:last-child{
                background: url(Asset/img/about/hp1-about-image.png) left center / cover no-repeat;
            }
            .section6{
                padding: 120px 0 600px 0;
                display: flex;
                background: url(Asset/img/banner/newsletter-bg-2-3.jpg) bottom center / cover no-repeat;
            }

            .section6>div{
                margin: auto;
                display: flex;
                flex-direction: column;
                justify-content: center;
                text-align: center;
            }
            .section6 img{
                height: 65px;
                width: 65px;
                margin: 0 auto 50px auto;
            }
            .section6 form{
                margin-top: 50px;
                position: relative;

            }
            .section6 i{
                color: #5e5e5e;
                position: absolute;
                left: 25px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 16px;
            }
            .section6 input{
                width: 100%;
                padding: 11px 25px 11px 58px;
                line-height: 21px;
                outline: none;
                border: 1px solid rgb(255, 255, 255);
                border-radius: 50px;
                box-shadow: 0 0 25px rgba(0, 0, 0,0.1);
                color: #5e5e5e;
                height: 60px;
                font-size: 15px;
            }
            .section6 button{
                position: absolute;
                padding: 15px 40px;
                background: #3cc3a9;
                font-size: 13px;
                font-weight: bold;
                right: -10px;
                color: white;
                border: 2px solid #3cc3a9;
                border-radius: 50px;
                height: 100%;
                cursor: pointer;
                transition: all ease-in-out .3s;
            }
            .section6 button:hover{
                background: white;
                color: #227179;
            }
            @media screen and (max-width:740px) {
                .banner h2{
                    font-size: 9vw;
                }
                .section1{
                    padding: 60px;
                    grid-template-columns: 1fr;
                }
                .section1>div:last-child{
                    padding: 100px 0;
                }
                .section2{
                    grid-template-columns: 1fr;
                    padding: 20px;
                }
                .section2 h4,.section2 h2{
                    padding-left:40px;
                }
                .section1 h2,.section2 h2{
                    font-size: 35px;
                }
                .section2 .group-tag{
                    gap: 40px 20px;
                }
                .section2 .tag{
                    padding: 40px 10px 10px;
                }
                .tag p{
                    margin-top: 4px;
                }
                .section6 button {
                    padding: 15px 25px;
                    font-size: 12px;
                }
                .section6{
                    padding: 60px 20px 300px;
                }
            }
        </style>
        <link rel="stylesheet" href="Asset/css/clientHeader.css">
        <link rel="stylesheet" href="Asset/css/clientFooter.css">
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <div class="banner">
            <h2>About</h2>
        </div>
        <div class="container">
            <div class="section1">
                <div>
                    <img src="Asset/img/banner/bnner2.png" alt="">
                </div>
                <div>
                    <h4>About Our School</h4>
                    <h2>How we become Yoku</h2>
                    <p>Modern yoga consists of a range of techniques including asanas (postures) and meditation derived from some of the philosophies, teachings and practices of the Yoga school, which is one of the six schools of traditional Hindu philosophies, and organised into a wide variety of schools and denominations. It has been described by Elizabeth de Michelis as having four types, namely: Modern Psych osomatic Yoga, as in The Yoga Institute.</p>
                    <a href="#" class="btn btn-red-orange">Learn More</a>
                </div>
            </div>
            <div class="section2">
                <div>
                    <h4>Our Faith</h4>
                    <h2>We believe in Making Yoga Inclusive</h2>
                    <div class="group-tag">
                        <div class="tag">
                            <div class="icon">
                                <img src="Asset/img/icon/icon1.png" alt="">
                            </div>
                            <h3>How we become Yowu</h3>
                            <p>Modern yoga consists of a range of techniques including asanas and meditation derived</p>
                        </div>
                        <div class="tag">
                            <div class="icon">
                                <img src="Asset/img/icon/icon1.png" alt="">
                            </div>
                            <h3>Where are we from</h3>
                            <p>Modern yoga consists of a range of techniques including asanas (postures) and meditation derived from some of the philosophies, teachings and practices of the Yoga school.</p>
                        </div>
                        <div class="tag">
                            <div class="icon">
                                <img src="Asset/img/icon/icon1.png" alt="">
                            </div>
                            <h3>Our Expertises</h3>
                            <p>A social network is a social structure made up of a set of social actors (such as individuals or organizations), sets of dyadic ties, and other social interactions between actors. </p>
                        </div>
                        <div class="tag">
                            <div class="icon">
                                <img src="Asset/img/icon/icon1.png" alt="">
                            </div>
                            <h3>Clear Mind & Body</h3>
                            <p>Modern yoga consists of a range of techniques including asanas (postures) and meditation derived from some of the philosophies, teachings and practices of the Yoga school.</p>
                        </div>

                    </div>
                </div>
                <div>
                    <!--dont delete this is img right-->
                </div>
            </div>
            <!--end section 2-->
            <div class="section section6">
                <div>
                    <img src="Asset/img/icon/mail.png" alt="">
                    <h2 class="section-title">We wish you a good experience with Yowu.</h2>
                    
                </div>
            </div>
        </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>
