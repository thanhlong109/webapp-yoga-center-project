<%-- 
    Document   : instructorProfile
    Created on : Jun 8, 2023, 10:08:11 PM
    Author     : localboss
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Asset/css/instructorProfile.css">
        <link rel="stylesheet" href="Asset/css/clientHeader.css">
        <link rel="stylesheet" href="Asset/css/clientFooter.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">
        <title>Instructor Profile</title>
    </head>
    <body>
        <jsp:include page="../Component/header.jsp"></jsp:include>
        <div class="banner">
        <h2>Instructor profile</h2>
    </div>
    <div class="container">
        <div class="image-instructor-profile">
            <img src="../img/avatar/hinh-avatar-1.png" alt="image for profile">
        </div>
        <div class="bio-instructor-profile">
            <h3>Jane Smith</h3>
            <p>Modern postural yoga consists largely but not exclusively of the practice of asanas. There were very few
                standing asanas before 1900.</p>
        </div>
    </div>
        <jsp:include page="../Component/footer.jsp"></jsp:include>
    </body>
</html>
