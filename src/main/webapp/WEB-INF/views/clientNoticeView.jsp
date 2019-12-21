<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="client_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <h3 class="col-sm-10"><i class="fa fa-angle-right"></i>공지사항</h3>
        <div class="col-sm-2">
            <button type="button" class="btn btn-theme btn-lg pull-right" style="margin-top: 15px; margin-left: 30px;" onclick = "location.href ='clientNoticeList?page=${page}'">리스트 보기</button>
        </div>
        <div class="row mt">
          <div class="col-lg-12">
            <div class="form-panel">
            	<form class="form-horizontal style-form" method="get">
            		<div class="form-group">
                      <label class="col-sm-2 control-label">작성자</label>
                      <div class="col-sm-2">
                        <p class="form-control-static">${dto.a_name }</p>
                      </div>
                      <label class="col-sm-2 control-label">날짜</label>
                      <div class="col-sm-2">
                        <p class="form-control-static">${dto.n_sdate }</p>
                      </div>
                      <label class="col-sm-2 control-label">조회수</label>
                      <div class="col-sm-2">
                        <p class="form-control-static">${dto.n_views }</p>
                      </div>
                  </div>
                <div class="form-group">
                  <label class="col-lg-2 col-sm-2 control-label">제목</label>
                  <div class="col-lg-10">
                    <p class="form-control-static">${dto.n_title }</p>
                  </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-12">
                      <p class="form-control-static">${dto.n_content }</p>
                    </div>
                </div>  
            	</form>
           
            </div>
          </div>
        </div>
        <!-- /row -->
        </section>
      </section>
      <!-- /wrapper -->
    <!--main content end-->
    
<%@ include file="client_bottom.jsp" %>
