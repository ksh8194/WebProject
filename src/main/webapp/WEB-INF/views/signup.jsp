<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="container">
      <form class="form-login" action="signup" method="post" name="frm">
        <h2 class="form-login-heading">회원가입</h2>
        <div class="login-wrap">
          
          <input type="hidden" id="emailChk" value="false">
          
          <div class="form-group">
            <label class="control-label">이메일</label>
            <div>
              <input type="email" class="form-control" name="m_email" id="m_email">
              <div id="emailErrorMsg" class="text-danger" style="font-size: 14px;"></div>
            </div>
          </div>
          
          <div class="form-group">
            <label class="control-label">이름</label>
            <div>
              <input type="text" class="form-control" name="m_name" id="m_name">
              <div id="nameErrorMsg" class="text-danger" style="font-size: 14px;"></div>
            </div>
          </div>
          
          <div class="form-group">
            <label class="control-label">비밀번호</label>
            <div>
              <input type="password" class="form-control" name="m_password" id="m_password">
              <div id="pwdErrorMsg" class="text-danger" style="font-size: 14px;"></div>
            </div>
          </div>
         
          <div class="form-group">
            <label class="control-label">비밀번호 확인</label>
            <div>
              <input type="password" class="form-control" id="pwdChk">
              <div id="pwdchkErrorMsg" class="text-danger" style="font-size: 14px;"></div>
            </div>
          </div>
         
          <div class="form-group">
            <label class="control-label">핸드폰 번호</label>
            <div>
              <input type="text" class="col-sm-3" name="m_phone1" id="m_phone1">
              <div class="col-sm-1">-</div>
              <input type="text" class="col-sm-3" name="m_phone2" id="m_phone2">
              <div class="col-sm-1">-</div>
              <input type="text" class="col-sm-3" name="m_phone3" id="m_phone3">
              <div id="phoneErrorMsg" class="text-danger" style="font-size: 14px;"></div>
            </div>
          </div>
          
          <br>
         
          <div class="form-group">
            <label class="control-label">직책</label>
            <div class="radio">
              <label><input type="radio" name="m_grade" id="optionsRadios1" value="1" checked>학생</label>
              <label><input type="radio" name="m_grade" id="optionsRadios2" value="2">선생님</label>
            </div>
          </div>
          
          <br>
          
          <button class="btn btn-theme btn-block" type="button" id="signupChk"><i class="fa fa-lock"></i>회원가입</button>
        
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
  <script src="./resources/js/signup.js"></script>
</body>

</html>