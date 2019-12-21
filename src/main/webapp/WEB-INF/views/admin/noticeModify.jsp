<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_top.jsp" %>
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper">
          <h3><i class="fa fa-angle-right"></i>공지사항 수정</h3>
          
          <div class="row mt">
            <div class="col-lg-12">
              <div class="form-panel">
                <form class="form-horizontal style-form" method="post" action="noticeModify" name="noticefrm">
               		<input type="hidden" value="${sessionScope.no}" name="n_ano">
	              	<input type="hidden" value="${dto.n_num}" name="n_num"> 
	              	<input type="hidden" value="${page}" name="page" >
	              	<input type="hidden" value="${sidebar}" name="sidebar">
	              	
                    <div class="form-group">
                        <label class="col-sm-2 control-label">제목</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" value="${dto.n_title}" name="n_title" id="n_title">
                        </div>
                    </div>
                    <div class="form-group">
                      <label class="col-sm-12 control-label">글 내용</label>
                      <div class="col-sm-12">
                        <textarea class="form-control" name="n_content" id="n_content" rows="5" style="height: 500px;">${dto.n_content}</textarea>
                      </div>
                    </div>
                    <div class="form-group">
                        <div class="pull-right">
                            <div class="col-lg-12">
                                <button type="button" class="btn btn-theme" id="noticeChk">공지 수정</button>
                                <button type="button" class="btn btn-theme" onclick = "location.href ='noticeView?n_num=${d.n_num}&page=${page}&sidebar=${sidebar}'">수정 취소</button>
                            </div>
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
<%@ include file="admin_bottom.jsp"%>