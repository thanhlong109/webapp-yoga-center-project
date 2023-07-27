<%-- 
    Document   : courseList
    Created on : Jun 18, 2023, 5:12:14 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@page import="com.yowu.yogacenter.repository.RatingCourseRepository" %>
<%@page import="com.yowu.yogacenter.repository.RegistrationCourseRepository" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Course list</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/clientHeader.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Asset/css/clientFooter.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            html{
                scroll-behavior: smooth; 
            }

            body{
                font-family: 'Jost', sans-serif;
                display: flex;
                flex-direction: column;
            }
            .banner{
                padding: 12% 20px 4% 20px;
                width: 100%;
                text-align: center;
                background: url( Asset/img/bg/page-title-1.png) top center / cover no-repeat;
            }
            .banner h2{
                color: #227179;
                font-size: 3.3vw;
            }
            .banner p{
                color: #547670;
                font-size: 24px;
            }          
            /*card*/
            .course-list{
                padding: 40px;
                display: flex;
                flex-direction: column;
                gap: 60px;
                padding: 20px 0;
            }    
            .course-list a{
                text-decoration: none;
            }
            .course-card{
                display: flex;
                gap: 60px;
                max-width: 82%;
                margin: 0 auto;
                max-height: 300px;
            }
            .card-img{
                width: 30%;
                max-width: 30%;
                overflow: hidden;
                transition: all ease-in-out .3s;
                display: flex;
                align-items: center;
                cursor: pointer;
            }
            .card-img:hover{
                filter: brightness(60%);
            }
            .card-img img{
                width: 100%;
                height: auto;
                max-width: 100%;
                vertical-align: middle;
            }
            .card-body{
                max-width: 60%;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .card-body-top{
                display: flex;
            }
            .card-title{
                color: #545454;
                font-size: 31px;
                margin-bottom: 16px;
                font-weight: 700;
            }
            .card-info-box{
                display: flex;
                flex-wrap: wrap;
                row-gap: 10px;
                column-gap: 25px;
                margin-top: 12px;
                align-items: center;
            }
            .card-info{
                margin-left: 6px;
                line-height: 1.7;
                font-weight: 600;
                color: #3dbca8;
            }
            .card-info .card-info-lable{
                color: #a2a2a2;
                font-weight: 600;
            }
            .card-detail{
                color: #5e5e5e;
                font-size: 17;
                line-height: 1.7;
            }
            .card-stars{
                color: #3dbca8;
                font-size: 12px;
            }
            .card-price{
                height: 85px;
                width: 85px;
                display: flex;
                justify-content: center;
                line-height: 85px;
                background-color: #3dbca8;
                color: white;
                font-weight: 600;
                font-size: 22px;
                border-radius: 50%;
                margin-left: 32px;
                min-width: 85px;
                min-height: 85px;
                
            }
            .card-teacher{
                display: flex;
                gap: 25px;
                cursor: pointer;
            }
            .card-teacher-img{
                max-width: 48px;
                max-height: 48px;
                width: 48px;
                height: 48px;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 50%;
                overflow: hidden;
            }

            .card-teacher p,.card-teacher a{
                line-height: 1.7;
            }
            .card-teacher p{
                color: #5e5e5e;
            }
            .card-teacher a{
                color: #3dbca8;
                font-weight: 600;
            }
            
            /*Filter*/
            .filter-container{
                display: flex;
                flex-wrap: wrap;
                gap: 16px;
                padding: 32px;
                max-width: 82%;
                margin: 0 auto;
            }
            .input-wrapper{
                background: #fff;
                box-shadow: 0 2px 20px rgba(0,0,0,.5);
                padding: 4px 16px 20px;
                width: 300px;
                z-index: 8;
            }
            .price-input{
                display: flex;
                width: 100%;
                margin: 8px 0 16px;
            }
            .price-input .field{
                height: 24px;
                width: 100%;
                display: flex;
                align-items: center;
                position: relative;
            }
            .field::after{
                position: absolute;
                content: "$";
                color: #444;
                top: 0;
                display: block;
                font-size: 18px;
                font-weight: 600;
                right: 4px;
            }   
            .field input{
                width: 100%;
                height: 100%;
                outline: none;
                border-radius: 5px;
                text-align: center;
                margin-left: 12px;
                font-size: 16px;
                border: 1px solid #999;
                -moz-appearance: textfield;
                padding-right: 8px;
            }
            .field input[type="number"]::-webkit-outer-spin-button, 
            .field input[type="number"]::-webkit-inner-spin-button{
                -webkit-appearance: none;
            }
            .price-input .separator{
                width: 70px;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 17px;
            }

            .slider{
                height: 5px;
                background-color: #ddd;
                border-radius: 5px;
                position: relative;
            }
            .slider .progress{
                height: 5px;
                left: 25%;
                right: 25%;
                position: absolute;
                border-radius: 5px;
                background: #17A288;
            }
            .range-input{
                position: relative;
            }
            .range-input input{
                position: absolute;
                top: -5px;
                height: 5px;
                width: 100%;
                background: none;
                -webkit-appearance: none;
                pointer-events: none;
                cursor: pointer;
            }
            .input-wrapper input[type="range"]::-webkit-slider-thumb{
                height: 17px;
                width: 17px;
                -webkit-appearance: none;
                background:#17A288;
                border-radius: 50%;
                pointer-events: auto;
            }
            .input-wrapper input[type="range"]::-moz-range-thumb{
                height: 17px;
                width: 17px;
                border: none;
                -webkit-appearance: none;
                background:#17A288;
                border-radius: 50%;
                pointer-events: auto;
            }
            .filter-box{
                background: #f3f4f6;
                padding: 0px 12px;
                border: 1px solid #e5e7eb;  
                color: #444;
                font-size: 14px;
                border-radius: 10px;
                height: 42px;
                display: flex;
                align-items: center;
                cursor: pointer;
            }
            .filter-box label{
                cursor: pointer;
            }
            .filter-box select{
                border: none;
                background: none;
                padding-bottom: 5px;
                border-bottom: 2px solid #444;
                cursor: pointer;
                outline: none;
            }
            .filter-box option{
                cursor: pointer;
            }
            .price-box{
                position: relative;

            }
            .input-wrapper{
                left: 0;
                top: 120%;
                position: absolute;
                border-radius: 10px;
            }
            .arrow-up {
                position: absolute;
                top:90%;
                left: 24px;
                width: 0; 
                height: 0; 
                border-left: 15px solid transparent;
                border-right: 15px solid transparent;
                border-bottom: 15px solid rgb(255, 255, 255);
                z-index: 10;
            }
            .filter-btn button{
                height: 42px;
                padding: 0 12px;
                border: 1px solid #e5e7eb;
                border-radius: 10px;
                color: #fff;
                background: rgb(75, 192, 192);
                cursor: pointer;
            }
            .toggle-box{
                display: none;
            }
            /**/
            .free-box{
                display: flex;
                align-items: center;
                margin-top: 20px;
            }
            .free-box input{
                display: none;
            }
            /*free btn*/
            .free-box label{
                background-color: #d2d2d2;
                width: 60px;
                height: 24px;
                border-radius: 100px;
                cursor: pointer;
                position: relative;
                transition: all ease-in-out .3s;
                display: flex;
                align-items: center;
            }
            .free-box label:before{
                position: absolute;
                content: '';
                background-color: #fff;
                width: 23px;
                height: 23px;
                border-radius: 50%;
                margin: 1px;
                transition: all ease-in-out .3s;
            }
            .free-box input:checked + label{
                background-color: #17A288;
            }
            .free-box input:checked + label:before{
                transform: translateX(35px);
            }
            .free-box span{
                margin-left: 16px;
            }
            /*order*/
            .order-container{
                display: flex;
                gap: 16px;
                flex-wrap: wrap;
                padding: 32px;
                padding-top: 0px;
                width: 82%;
                margin: 0 auto;
            }
            .select-box{
                background-color: #f3f4f6;
                padding: 0px 12px;
                border: 1px solid #e5e7eb;
                color: #444;
                font-size: 14px;
                border-radius: 10px;
                height: 42px;
                display: flex;
                align-items: center;
                cursor: pointer;
            }
            .select-box label{
                cursor: pointer;
            }
            .select-box.active{
                border: 1px solid #d70018;
                background-color: #fef2f2;
                color: #d70018;
            }
            /**/
            .pagination{
                padding: 6px 24px;
                display: flex;
                border-radius: 24px;
                max-width: fit-content;
                margin: 12px auto;
                row-gap: 16px;
                flex-wrap: wrap;
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
                cursor: pointer;
            }
            .pagination a:hover, .pagination .p-active{
                background-color: #547670;
                color: white;
            }
            .hide{
                display: none;
            }
            .text-ellipsis {
                display: -webkit-box;
                -webkit-line-clamp: 3; /* Limit the text to 1 lines */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis; /* Add "..." at the end of the 1 line */
                white-space: normal;
            }
            @media screen and (max-width:740px){
                
                .course-card{
                    width: 100%;
                }
                .course-section h2{
                    font-size: 24px;
                }
                .filter-container{
                    max-width: 100%;
                }
                .input-wrapper{
                    transform: translateX(-40%);
                }
                .order-container{
                    width: 100%;
                }
                .course-card{
                    max-width: 90%;
                    gap:0;
                    
                }
                .card-img{
                    display: none;
                }
                .card-body{
                    max-width: 100%;
                    gap:10px;
                }
                .card-title{
                    font-size: 22px;
                }
                .card-info-box{
                    row-gap: 4px;
                    margin-top: 0;
                }
                .card-stars{
                    margin-left: 6px;
                }
                .text-ellipsis{
                    -webkit-line-clamp:3;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <%
            request.setAttribute("rcRepo",new RegistrationCourseRepository());
            request.setAttribute("rcr",new RatingCourseRepository());
        %>
        <div class="banner">
            <h2>Our Courses</h2>
        </div>
        <!-- ------------------------------ Start Filter -------------------------------------------- -->
        <div class="filter-wrapper">
            <form action="course-filter" id="filter-form"></form>
            <div class="filter-container">
                <div class="filter-box">
                    <select form="filter-form" name="categoryid">
                        <option value="-1">All Category</option>
                        <c:forEach items="${categoryList}" var="category">
                            <option <c:if test="${categorySelected==category.id}">selected</c:if> value="${category.id}">${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="filter-box price-box click-action-box">
                    <label><i class="fa-solid fa-sack-dollar"></i> Price</label>
                    <div class="toggle-box">
                        <div class="arrow-up"></div>
                        <div class="input-wrapper">
                            <div class="js-price-box">
                                <div class="price-input">
                                    <div class="field">
                                        <span>Min</span>
                                        <input form="filter-form"  type="number" name="minPrice" class="input-min" value="${minSelected==null?minPrice:minSelected}">
                                    </div>
                                    <div class="separator">-</div>
                                    <div class="field">
                                        <span>Max</span>
                                        <input form="filter-form" name="maxPrice" type="number" class="input-max" value="${maxSelected==null?maxPrice:maxSelected}">
                                    </div>
                                </div>
                                <div class="slider">
                                    <div class="progress"></div>
                                </div>
                                <div class="range-input">
                                    <input type="range" class="range-min" min="${minPrice}" max="${maxPrice}" value="${minSelected==null?minPrice:minSelected}" step="1">
                                    <input type="range" class="range-max" min="${minPrice}" max="${maxPrice}" value="${maxSelected==null?maxPrice:maxSelected}" step="1">
                                </div>
                            </div>
                            <div class="free-box">
                                <input id="free-check-box" <c:if test="${isFree}">Checked</c:if>  form="filter-form" type="checkbox" name="free" value="true"/> <label for="free-check-box"></label><span> Free Course?</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="filter-btn">
                    <button form="filter-form" type="submit"><i class="fa-solid fa-filter"></i> Filter</button>
                </div>
            </div>
        </div>
        <!-- ------------------------------ End Filter -------------------------------------------- -->
        <!-- ------------------------------ Start Order -------------------------------------------- -->
        <div class="order-container">
            <div class="select-box" data-boxid="1">
                <label><i class="fa-solid fa-arrow-down-wide-short"></i> Price High - Low</label>
            </div>
            <div class="select-box" data-boxid="2">
                <label><i class="fa-solid fa-arrow-down-short-wide"></i> Price Low - High</label>
            </div>
            <div class="select-box" data-boxid="3">
                <label><i class="fa-solid fa-fire"></i> Popular Course</label>
            </div>
            <div class="select-box" data-boxid="4">
                <label><i class="fa-solid fa-star"></i> Rating Course</label>
            </div>
        </div>
        <!-- ------------------------------ End Order -------------------------------------------- -->
        <!-- ------------------------------ Start Course List -------------------------------------------- -->
        <div class="course-list">
            <c:if test="${courseList!=null&&courseList.size() gt 0}">
                <c:forEach items="${courseList}" var="course">
                    <div class="course-card">
                        <div onclick="goto('course-detail?id=${course.id}')" class="card-img">
                            <img src="Asset/img/classes/${course.img}" alt="">
                        </div>
                        <div class="card-body">
                            <div class="card-body-top">
                                <div>
                                    <a class="card-title" href="course-detail?id=${course.id}">${course.title}</a> <!--replace category for card -->
                                    <div class="card-info-box">
                                        <div class="card-info"><span class="card-info-lable">Category:</span> ${course.category.name}</div>
                                        <div class="card-info"><span class="card-info-lable">Duration:</span> ${course.duration} Slots</div>
                                        <div class="card-info"><span class="card-info-lable">Student Enrolled:</span> <span class="card-student">${rcRepo.getStudentEnrolled(course.id)}</span> Students</div>
                                        <div class="card-stars">
                                            <i class=""></i>
                                            <i class=""></i>
                                            <i class=""></i>
                                            <i class=""></i>
                                            <i class=""></i>
                                        </div>
                                        <div class="agv-star-value" style="display: none;" >${rcr.getAvgCourseRating(course.id)}</div><!-- replace star for  card-->
                                    </div>
                                </div>
                                <div class="card-price">
                                    <c:if test="${course.price>0}">$${course.price}</c:if><c:if test="${course.price<=0}">Free</c:if>
                                </div>
                            </div>
                            <div class="card-detail text-ellipsis">${course.detail}</div>
                            <div onclick="goto('instructor?id=${course.account.id}')" class="card-teacher">
                                <div class="card-teacher-img img-square-container">
                                    <img src="Asset/img/avatar/${course.account.img}" alt="">
                                </div>
                                <div>
                                    <p>Teacher</p>
                                    <a>${course.account.name}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach> 
            </c:if>
             <c:if test="${courseList==null||courseList.size() lt 1}">
                <%@include file="../Component/empty.jsp" %>
            </c:if> 
        </div>
        <!-- ------------------------------ End Course List -------------------------------------------- -->
        <!-- ------------------------------ Start Pagination -------------------------------------------- -->
        <c:if test="${numpage>1}">
            <div class="pagination">
                <a class="p-nav-left"><i class="fa-solid fa-chevron-left"></i></a>
                <c:forEach begin="${1}" var="i" end="${numpage}">
                    <a class='page p-${i} <c:if test="${i==1}">p-active</c:if>' >${i}</a>
                </c:forEach>
                    <a class="p-nav-right"><i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </c:if>
        <!-- ------------------------------ End Pagination -------------------------------------------- -->
        <script defer>
            const surgestCards = document.querySelectorAll(".course-card");
            surgestCards.forEach(card =>{
                let sgCardStars = card.querySelectorAll(".card-stars i");
                let avgSt = card.querySelector(".agv-star-value").textContent;
                sgCardStars.forEach(st =>{
                    if(avgSt>0){
                    st.classList.add("fa-solid");
                    if(avgSt<1){
                        st.classList.add("fa-star-half-stroke");
                    }else{
                        st.classList.add("fa-star");
                    } 
                    }else{
                        st.classList.add("fa-regular");
                        st.classList.add("fa-star");
                    }
                    avgSt-=1;
                });
            });
            function goto(url){
                window.location.href = "${pageContext.request.contextPath}/"+url;   
            }
        </script>
        <!-- -------------------- ----- - Start Filter Script --------------------------------- -->
        <script>
            const rangeInput = document.querySelectorAll('.range-input input');
            const progress = document.querySelector('.slider .progress');
            const priceInput = document.querySelectorAll('.price-input input');
            let priceGap = 10;
            /**/
            rangeInput.forEach(input => {
                input.addEventListener('input', e =>{
                    //getting two ranges value
                    let minVal = parseInt(rangeInput[0].value),
                    maxVal = parseInt(rangeInput[1].value);
                    if(maxVal - minVal < priceGap){
                        if(e.target.className === "range-min"){
                            rangeInput[0].value = maxVal - priceGap;
                        }else{
                            rangeInput[1].value = minVal + priceGap;
                        }
                    }else{
                        priceInput[0].value = minVal;
                        priceInput[1].value = maxVal;
                        progress.style.left = (minVal / rangeInput[0].max) * 100 + '%';
                        progress.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + '%';
                    }

                });
            });
            /*update progress bar for fisrt time*/
            let minVal = parseInt(rangeInput[0].value),maxVal = parseInt(rangeInput[1].value);
            priceInput[0].value = minVal;
            priceInput[1].value = maxVal;
            progress.style.left = (minVal / rangeInput[0].max) * 100 + '%';
            progress.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + '%';
            /**/
            priceInput.forEach(input => {
                input.addEventListener('input', e =>{
                    //getting two input value
                    let minVal = parseInt(priceInput[0].value),
                    maxVal = parseInt(priceInput[1].value);
                    if(maxVal > rangeInput[1].max){
                        maxVal = rangeInput[1].max;
                    }
                    if(minVal < rangeInput[0].min){
                        minVal = rangeInput[0].min;
                    }
                    if((maxVal - minVal >= priceGap)){
                        if(e.target.className === "input-min"){
                            rangeInput[0].value = minVal;
                            progress.style.left = (minVal / rangeInput[0].max) * 100 + '%';
                        }else{
                            rangeInput[1].value = maxVal;
                            progress.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + '%';
                        }
                    }
                });
            });
            $('.click-action-box').click(function(e){
                $(this).find('.toggle-box').show(400);
                e.stopPropagation();
            });
            $(document).click(function(){
                $('.toggle-box').hide(400);
            });
            const freeCheckBox = document.getElementById('free-check-box');
            if(freeCheckBox.checked){
                $('.js-price-box').slideUp(); 
            }else{
                $('.js-price-box').slideDown(); 
            }
            $(freeCheckBox).change(function (){ 
                if(this.checked){
                    $('.js-price-box').slideUp(); 
                }else{
                    $('.js-price-box').slideDown(); 
                }
            });
       </script>
       <!-- -------------------- ----- - End Filter Script --------------------------------- -->
       <!-- -------------------- ----- - Start Order script----- --------------------------------- -->
       <script>
           const courseList = document.querySelectorAll('.course-card');
           const courseArray = Array.from(courseList);
           let itemPerPage = ${itemPerPage};
            $('.select-box').click(function(){
                $(this).addClass('active');
                $(this).siblings().removeClass('active');
                switch($(this).attr('data-boxid')){
                    case '1':{
                        courseArray.sort((a, b) => {
                            const priceA = parseFloat(convertPrice(a.querySelector('.card-price').textContent));
                            const priceB = parseFloat(convertPrice(b.querySelector('.card-price').textContent));
                            return priceB - priceA; // Descending order
                        }); 
                        break;
                    }
                    case '2':{
                         courseArray.sort((a, b) => {
                            const priceA = parseFloat(convertPrice(a.querySelector('.card-price').textContent));
                            const priceB = parseFloat(convertPrice(b.querySelector('.card-price').textContent));
                            return priceA - priceB; // Ascending order
                        });    
                         break;
                    }
                    case '3':{
                         courseArray.sort((a, b) => {
                            const enrollA = parseInt(convertEnroll(a.querySelector('.card-student').textContent));
                            const enrollB = parseInt(convertEnroll(b.querySelector('.card-student').textContent));
                            return enrollB - enrollA; // Descending order
                        });
                         break;
                    }
                    case '4':{
                        courseArray.sort((a, b) => {
                            const enrollA = parseFloat(a.querySelector('.agv-star-value').textContent);
                            const enrollB = parseFloat(b.querySelector('.agv-star-value').textContent);
                            return enrollB - enrollA; // Descending order
                        });
                         break;    
                    }
                }
                courseArray.forEach((element, index) => {
                    element.style.order = index + 1;
                });
                Pagination(1);
                 
            });
            function convertPrice(c){
                c=c.toLowerCase();
                if(c.includes("free")){
                    return 0;
                }
                let s = c.indexOf('$')+1;
                c = c.substring(s,c.length-1);
                return parseInt(c);
            }
            function convertEnroll(c){
                return parseInt(c);
            }
           
       //<!-- -------------------- ----- - End Order script----- --------------------------------- -->
       //<!-- -------------------- ----- - Start Pagination script----- --------------------------------- -->
             const numpage = ${numpage};
             $('.page').click(function (){
                Pagination(parseInt($(this).text()));
             });
             Pagination(1);
             function Pagination(page){
                $('.p-'+page).addClass('p-active');
                $('.p-'+page).siblings().removeClass('p-active');
                if(page==1){
                    $('.p-nav-left').addClass('hide');
                }else{
                    $('.p-nav-left').removeClass('hide');
                }
                if(page==numpage){
                    $('.p-nav-right').addClass('hide');
                }else{
                    $('.p-nav-right').removeClass('hide');
                }
                let start = (page - 1) * itemPerPage;
                let end = Math.min(page * itemPerPage, courseList.length);
                courseArray.forEach((element, index)=>{
                    if(index>=start&&index<end){
                        element.classList.remove('hide');
                    }else{
                        element.classList.add('hide');
                    }
                });
             }
             
            $('.p-nav-left').click(function (){
                let i = parseInt($('.p-active').text());
                if(i>1){
                    Pagination(i-1);
                }
            });
            $('.p-nav-right').click(function (){
                let i = parseInt($('.p-active').text());
                if(i<numpage){
                    Pagination(i+1);
                }
            });
       </script>
       <!-- -------------------- ----- - End Pagination script----- --------------------------------- -->
        <%@include file="../Component/footer.jsp" %> 
    </body>
</html>
