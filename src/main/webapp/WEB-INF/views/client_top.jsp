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
  <link href="${pageContext.request.contextPath}/resources/clientMain/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/clientMain/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/clientMain/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="${pageContext.request.contextPath}/resources/clientMain/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/clientMain/css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/clientMain/lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/clientMain/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/clientMain/css/style-responsive.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/resources/clientMain/lib/chart-master/Chart.js"></script>
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="clientNoticeList" class="logo"><b>KIC<span>커뮤니티</span></b></a>
      <!--logo end-->
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="logout">Logout</a></li>
        </ul>
        
        <c:if test="${sessionScope.master eq '1'}" >
        	<ul class="nav pull-right top-menu">
            	<li><a class="logout" href="myPage?m_num=${sessionScope.no }">마이페이지</a></li>
        	</ul>
        </c:if>
        <c:if test="${sessionScope.master eq '2'}" >
        	<ul class="nav pull-right top-menu">
            	<li><a class="logout" href="noticeList">관리자페이지</a></li>
        	</ul>
        </c:if>

      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <li class="mt">
            <a <c:if test="${sidebar eq '1' }">class="active"</c:if> href="clientNoticeList">
              <i class="fa fa-user"></i>
              <span>공지사항</span>
              </a>
          </li>
          
          <li class="sub-menu">
            <a <c:if test="${sidebar eq '2' }">class="active"</c:if> href="study">
              <i class="fa fa-flask"></i>
              <span>스터디 게시판</span>
              </a>
          </li>
          <li class="sub-menu">
            <a <c:if test="${sidebar eq '3' }">class="active"</c:if> href="competition">
              <i class="fa fa-sitemap"></i>
              <span>공모전 게시판</span>
              </a>
          </li>
          <li class="sub-menu">
            <a <c:if test="${sidebar eq '4' }">class="active"</c:if> href="amity">
              <i class="fa fa-cutlery"></i>
              <span>친목 게시판</span>
              </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    </section>