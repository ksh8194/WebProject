<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>KIC 커뮤니티</title>

  <!-- Favicons -->
  <link href="./resources/clientMain/img/favicon.png" rel="icon">
  <link href="./resources/clientMain/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="./resources/clientMain/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="./resources/clientMain/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="./resources/clientMain/css/style.css" rel="stylesheet">
  <link href="./resources/clientMain/css/style-responsive.css" rel="stylesheet">
</head>

<body>
  <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->

  <div id="login-page">
      <div class="container" > 
        <form class="form-login" action="adminLogin" method="post">
          <h2 class="form-login-heading">관리자 로그인</h2>
          <div class="login-wrap">
            <input type="email" class="form-control" placeholder="User EMAIL" autofocus name="a_email">
            <br>
            <input type="password" class="form-control" placeholder="Password" name="a_password">
            <br>
            <button class="btn btn-theme btn-block" href="#" type="submit"><i class="fa fa-lock"></i>로그인</button>
            <br>
          </div>
        </form>
      </div>
  </div>

  
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="./resources/clientMain/lib/jquery/jquery.min.js"></script>
  <script src="./resources/clientMain/lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
  <script type="text/javascript" src="./resources/clientMain/lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("./resources/clientMain/img/login.jpg", {
      speed: 500
    });
  </script>
</body>

</html>
